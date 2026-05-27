package servlet;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;

@WebServlet("/product-detail")
public class ProductDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParam =
                request.getParameter("id");

        if (idParam == null ||
                idParam.isEmpty()) {

            response.sendRedirect("products");
            return;
        }

        int id = Integer.parseInt(idParam);

        ProductDAO dao = new ProductDAO();

        Product product =
                dao.getProductById(id);

        if (product == null) {

            response.sendRedirect("products");
            return;
        }

        request.setAttribute("product", product);

        request.getRequestDispatcher(
                "product-detail.jsp"
        ).forward(request, response);
    }
}