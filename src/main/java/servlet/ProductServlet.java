package servlet;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        String categoryParam = request.getParameter("category");

        List<Product> products;

        if (categoryParam != null && !categoryParam.isEmpty()) {
            int categoryId = Integer.parseInt(categoryParam);
            products = dao.getProductsByCategory(categoryId);
        } else {
            products = dao.getAllProducts();
        }

        request.setAttribute("products", products);
        request.setAttribute("categories", categoryDAO.getAllCategories());

        request.getRequestDispatcher("index.jsp")
                .forward(request, response);
    }
}