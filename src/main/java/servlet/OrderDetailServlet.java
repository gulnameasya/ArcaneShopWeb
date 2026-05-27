package servlet;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.OrderItem;

import java.io.IOException;
import java.util.List;

@WebServlet("/order-detail")
public class OrderDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        OrderDAO dao = new OrderDAO();

        List<OrderItem> items =
                dao.getOrderItemsByOrderId(orderId);

        request.setAttribute("items", items);

        request.getRequestDispatcher(
                "order-detail.jsp"
        ).forward(request, response);
    }
}