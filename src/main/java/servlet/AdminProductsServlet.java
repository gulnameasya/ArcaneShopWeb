package servlet;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-products")
public class AdminProductsServlet extends HttpServlet {

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

        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProducts();

        request.setAttribute("products", products);

        request.getRequestDispatcher("admin/products.jsp")
                .forward(request, response);
    }
}