package servlet;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart-page");
            return;
        }

        User user = (User) session.getAttribute("user");

        OrderDAO dao = new OrderDAO();

        boolean success = dao.createOrder(user.getId(), cart);

        if (success) {
            session.removeAttribute("cart");
            response.sendRedirect("products");
        } else {
            response.sendRedirect("cart-page");
        }
    }
}
