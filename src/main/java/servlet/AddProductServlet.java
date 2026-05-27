package servlet;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;

import java.io.File;
import java.io.IOException;

@WebServlet("/add-product")
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (!"admin".equals(user.getRole())) {
            response.sendRedirect("products");
            return;
        }

        CategoryDAO categoryDAO = new CategoryDAO();

        request.setAttribute(
                "categories",
                categoryDAO.getAllCategories()
        );

        request.getRequestDispatcher("/admin/add-product.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (!"admin".equals(user.getRole())) {
            response.sendRedirect("products");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        Product product = new Product();

        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setCategoryId(
                Integer.parseInt(request.getParameter("categoryId"))
        );
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));

        String imageUrl = request.getParameter("imageUrl");

        Part imagePart = request.getPart("imageFile");

        if (imagePart != null && imagePart.getSize() > 0) {

            String fileName = imagePart.getSubmittedFileName();

            String uploadPath =
                    getServletContext().getRealPath("")
                            + File.separator
                            + "uploads";

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            imagePart.write(uploadPath + File.separator + fileName);

            product.setImageUrl("uploads/" + fileName);

        } else {
            product.setImageUrl(imageUrl);
        }

        ProductDAO dao = new ProductDAO();

        boolean success = dao.addProduct(product);

        if (success) {
            response.sendRedirect("products");
        } else {
            response.sendRedirect("add-product");
        }
    }
}