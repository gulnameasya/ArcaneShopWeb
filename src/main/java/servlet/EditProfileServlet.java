package servlet;

import dao.UserAddressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import model.UserAddress;

import java.io.IOException;
import java.util.List;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        UserAddressDAO addressDAO = new UserAddressDAO();

        List<UserAddress> addresses =
                addressDAO.getAddressesByUserId(user.getId());

        request.setAttribute("addresses", addresses);

        request.getRequestDispatcher("edit-profile.jsp")
                .forward(request, response);
    }
}