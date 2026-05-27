package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        UserDAO dao = new UserDAO();

        String email =
                request.getParameter("email");

        if (dao.emailExists(email)) {

            request.setAttribute(
                    "error",
                    "Bu e-posta adresi zaten kullanılıyor."
            );

            request.getRequestDispatcher(
                    "register.jsp"
            ).forward(request, response);

            return;
        }

        User user = new User();

        user.setFullName(
                request.getParameter("fullName")
        );

        user.setEmail(email);

        user.setPassword(
                request.getParameter("password")
        );

        user.setPhone(
                request.getParameter("phone")
        );

        user.setAddress(
                request.getParameter("address")
        );

        boolean success =
                dao.registerUser(user);

        if (success) {

            response.sendRedirect(
                    "login.jsp?registered=true"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Kayıt işlemi başarısız oldu."
            );

            request.getRequestDispatcher(
                    "register.jsp"
            ).forward(request, response);
        }
    }
}