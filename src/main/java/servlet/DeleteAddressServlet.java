package servlet;

import dao.UserAddressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/delete-address")
public class DeleteAddressServlet extends HttpServlet {

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

        int addressId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        UserAddressDAO dao =
                new UserAddressDAO();

        dao.deleteAddress(
                addressId,
                user.getId()
        );

        response.sendRedirect("edit-profile");
    }
}