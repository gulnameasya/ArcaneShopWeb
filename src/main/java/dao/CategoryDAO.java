package dao;

import model.Category;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<Category> getAllCategories() {

        List<Category> categories = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM categories " +
                            "WHERE is_active = true " +
                            "ORDER BY name";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Category category = new Category();

                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setActive(rs.getBoolean("is_active"));

                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }

    public Category getCategoryById(int id) {

        Category category = null;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM categories WHERE id = ?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                category = new Category();

                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setActive(rs.getBoolean("is_active"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return category;
    }

    public boolean addCategory(Category category) {

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                    "INSERT INTO categories " +
                            "(name, description, is_active) " +
                            "VALUES (?, ?, ?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setBoolean(3, category.isActive());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCategory(int id,
                                  String name,
                                  String description) {

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE categories " +
                            "SET name = ?, description = ? " +
                            "WHERE id = ?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, id);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCategory(int id) {

        try {

            Connection conn = DBConnection.getConnection();

            PreparedStatement updateProducts =
                    conn.prepareStatement(
                            "UPDATE products " +
                                    "SET category_id = NULL " +
                                    "WHERE category_id = ?"
                    );

            updateProducts.setInt(1, id);
            updateProducts.executeUpdate();

            PreparedStatement deleteCategory =
                    conn.prepareStatement(
                            "DELETE FROM categories " +
                                    "WHERE id = ?"
                    );

            deleteCategory.setInt(1, id);

            int result =
                    deleteCategory.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}