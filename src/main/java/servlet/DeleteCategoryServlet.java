package servlet;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/delete-category")
public class DeleteCategoryServlet extends HttpServlet {

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

        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );

        CategoryDAO dao = new CategoryDAO();

        dao.deleteCategory(id);

        response.sendRedirect("admin-categories");
    }
}