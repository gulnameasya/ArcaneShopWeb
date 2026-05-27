package servlet;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;

import java.io.File;
import java.io.IOException;

@WebServlet("/update-product")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        if (!"admin".equals(user.getRole())) {

            response.sendRedirect("products");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        Product product = new Product();

        product.setId(
                Integer.parseInt(
                        request.getParameter("id")
                )
        );

        product.setCategoryId(
                Integer.parseInt(
                        request.getParameter("categoryId")
                )
        );

        product.setName(
                request.getParameter("name")
        );

        product.setDescription(
                request.getParameter("description")
        );

        product.setPrice(
                Double.parseDouble(
                        request.getParameter("price")
                )
        );

        product.setStock(
                Integer.parseInt(
                        request.getParameter("stock")
                )
        );

        String imageUrl =
                request.getParameter("imageUrl");

        String oldImageUrl =
                request.getParameter("oldImageUrl");

        Part imagePart =
                request.getPart("imageFile");

        if (imagePart != null &&
                imagePart.getSize() > 0) {

            String fileName =
                    System.currentTimeMillis()
                            + "_"
                            + imagePart.getSubmittedFileName();

            String uploadPath =
                    getServletContext()
                            .getRealPath("")
                            + File.separator
                            + "uploads";

            File uploadDir =
                    new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            imagePart.write(
                    uploadPath
                            + File.separator
                            + fileName
            );

            imageUrl =
                    "uploads/" + fileName;

        } else if (imageUrl == null ||
                imageUrl.trim().isEmpty()) {

            imageUrl = oldImageUrl;
        }

        product.setImageUrl(imageUrl);

        ProductDAO dao =
                new ProductDAO();

        boolean success =
                dao.updateProduct(product);

        if (success) {

            response.sendRedirect(
                    "admin-products"
            );

        } else {

            response.sendRedirect(
                    "products"
            );
        }
    }
}