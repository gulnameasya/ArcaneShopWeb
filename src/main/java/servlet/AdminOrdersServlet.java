package servlet;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-orders")
public class AdminOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
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

        OrderDAO dao = new OrderDAO();

        List<Order> orders =
                dao.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher(
                "admin/orders.jsp"
        ).forward(request, response);
    }
}