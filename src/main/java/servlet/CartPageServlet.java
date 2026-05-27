package servlet;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.util.*;

@WebServlet("/cart-page")
public class CartPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        List<Product> products = new ArrayList<>();

        ProductDAO dao = new ProductDAO();

        if (cart != null) {
            for (Integer id : cart.keySet()) {
                Product p = dao.getProductById(id);

                if (p != null) {
                    products.add(p);
                }
            }
        }

        request.setAttribute("products", products);
        request.setAttribute("cartMap", cart);

        request.getRequestDispatcher("cart.jsp")
                .forward(request, response);
    }
}