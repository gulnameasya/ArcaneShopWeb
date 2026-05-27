package servlet;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;
import model.User;

import java.io.IOException;

@WebServlet("/add-category")
public class AddCategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

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

        Category category = new Category();

        category.setName(
                request.getParameter("name")
        );

        category.setDescription(
                request.getParameter("description")
        );

        category.setActive(true);

        CategoryDAO dao = new CategoryDAO();

        boolean success =
                dao.addCategory(category);

        if (success) {

            response.sendRedirect("admin-dashboard");

        } else {

            response.sendRedirect(
                    "admin/add-category.jsp"
            );
        }
    }
}