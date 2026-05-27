package servlet;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;

import java.io.IOException;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

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

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        Product product = productDAO.getProductById(id);

        request.setAttribute("product", product);
        request.setAttribute("categories", categoryDAO.getAllCategories());

        request.getRequestDispatcher("admin/edit-product.jsp")
                .forward(request, response);
    }
}