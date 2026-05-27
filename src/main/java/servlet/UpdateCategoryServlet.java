package servlet;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/update-category")
public class UpdateCategoryServlet
        extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );

        String name =
                request.getParameter("name");

        String description =
                request.getParameter("description");

        CategoryDAO dao =
                new CategoryDAO();

        dao.updateCategory(
                id,
                name,
                description
        );

        response.sendRedirect(
                "admin-categories"
        );
    }
}