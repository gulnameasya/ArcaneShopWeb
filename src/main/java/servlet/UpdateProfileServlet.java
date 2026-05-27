package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/update-profile")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User sessionUser =
                (User) session.getAttribute("user");

        User user = new User();

        user.setId(sessionUser.getId());

        user.setFullName(
                request.getParameter("fullName")
        );

        user.setEmail(
                request.getParameter("email")
        );

        user.setPhone(
                request.getParameter("phone")
        );

        user.setAddress(
                request.getParameter("address")
        );

        UserDAO dao = new UserDAO();

        boolean updated =
                dao.updateUserProfile(user);

        if (updated) {

            sessionUser.setFullName(user.getFullName());
            sessionUser.setEmail(user.getEmail());
            sessionUser.setPhone(user.getPhone());
            sessionUser.setAddress(user.getAddress());

            session.setAttribute("user", sessionUser);
        }

        response.sendRedirect("profile");
    }
}