package servlet;

import dao.UserAddressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import model.UserAddress;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        UserAddressDAO dao = new UserAddressDAO();
        List<UserAddress> addresses =
                dao.getAddressesByUserId(user.getId());

        request.setAttribute("addresses", addresses);

        request.getRequestDispatcher("profile.jsp")
                .forward(request, response);
    }
}