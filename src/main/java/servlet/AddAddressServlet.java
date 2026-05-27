package servlet;

import dao.UserAddressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import model.UserAddress;

import java.io.IOException;

@WebServlet("/add-address")
public class AddAddressServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        UserAddress address = new UserAddress();

        address.setUserId(user.getId());
        address.setTitle(request.getParameter("title"));
        address.setAddress(request.getParameter("address"));

        String defaultValue = request.getParameter("defaultAddress");
        address.setDefaultAddress(defaultValue != null);

        UserAddressDAO dao = new UserAddressDAO();
        dao.addAddress(address);

        response.sendRedirect("profile");
    }
}