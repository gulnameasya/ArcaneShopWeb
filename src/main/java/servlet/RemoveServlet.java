package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;

@WebServlet("/remove")
public class RemoveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart != null) {
            if (cart.containsKey(productId)) {

                int quantity = cart.get(productId);

                if (quantity > 1) {
                    cart.put(productId, quantity - 1);
                } else {
                    cart.remove(productId);
                }
            }
        }

        response.sendRedirect("cart-page");
    }
}
