package servlet;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/update-order-status")
public class UpdateOrderStatusServlet extends HttpServlet {

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

        int orderId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        String status =
                request.getParameter("status");

        OrderDAO dao = new OrderDAO();

        dao.updateOrderStatus(orderId, status);

        response.sendRedirect("admin-orders");
    }
}