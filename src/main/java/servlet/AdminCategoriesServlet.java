package servlet;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-categories")
public class AdminCategoriesServlet extends HttpServlet {

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

        CategoryDAO dao = new CategoryDAO();
        List<Category> categories = dao.getAllCategories();

        request.setAttribute("categories", categories);

        request.getRequestDispatcher("admin/categories.jsp")
                .forward(request, response);
    }
}