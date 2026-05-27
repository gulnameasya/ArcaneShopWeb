package servlet;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int productId =
                Integer.parseInt(
                        request.getParameter("id")
                );

        ProductDAO productDAO = new ProductDAO();

        Product product =
                productDAO.getProductById(productId);

        if (product == null ||
                product.getStock() <= 0) {

            response.sendRedirect("products");
            return;
        }

        HttpSession session =
                request.getSession();

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>)
                        session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        int currentQuantity =
                cart.getOrDefault(productId, 0);

        if (currentQuantity < product.getStock()) {

            cart.put(
                    productId,
                    currentQuantity + 1
            );
        }

        session.setAttribute("cart", cart);

        String referer = request.getHeader("Referer");

        if (referer != null && referer.contains("cart-page")) {
            response.sendRedirect("cart-page");
        } else {
            response.sendRedirect("products#product-" + productId);
        }
    }
}