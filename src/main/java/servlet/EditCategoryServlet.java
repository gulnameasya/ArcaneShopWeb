package servlet;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;

import java.io.IOException;

@WebServlet("/edit-category")
public class EditCategoryServlet
        extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );

        CategoryDAO dao =
                new CategoryDAO();

        Category category =
                dao.getCategoryById(id);

        request.setAttribute(
                "category",
                category
        );

        request.getRequestDispatcher(
                "edit-category.jsp"
        ).forward(request, response);
    }
}
