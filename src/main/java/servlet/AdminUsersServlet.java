package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-users")
public class AdminUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");

        if (!"admin".equals(currentUser.getRole())) {
            response.sendRedirect("products");
            return;
        }

        UserDAO dao = new UserDAO();

        List<User> users = dao.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("admin/users.jsp")
                .forward(request, response);
    }
}