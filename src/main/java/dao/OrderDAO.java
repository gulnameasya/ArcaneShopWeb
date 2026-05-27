package dao;

import model.Order;
import model.OrderItem;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDAO {

    public boolean createOrder(int userId, Map<Integer, Integer> cart) {

        try {
            Connection conn = DBConnection.getConnection();

            conn.setAutoCommit(false);

            double totalAmount = 0;

            ProductDAO productDAO = new ProductDAO();

            for (Integer productId : cart.keySet()) {
                double price = productDAO.getProductById(productId).getPrice();
                int quantity = cart.get(productId);

                totalAmount += price * quantity;
            }

            String orderSql =
                    "INSERT INTO orders (user_id, total_amount, status) " +
                            "VALUES (?, ?, ?) RETURNING id";

            PreparedStatement orderPs = conn.prepareStatement(orderSql);

            orderPs.setInt(1, userId);
            orderPs.setDouble(2, totalAmount);
            orderPs.setString(3, "Beklemede");

            ResultSet rs = orderPs.executeQuery();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt("id");
            }

            String itemSql =
                    "INSERT INTO order_items " +
                            "(order_id, product_id, quantity, unit_price, subtotal) " +
                            "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement itemPs = conn.prepareStatement(itemSql);

            String stockSql =
                    "UPDATE products SET stock = stock - ? WHERE id = ?";

            PreparedStatement stockPs = conn.prepareStatement(stockSql);

            for (Integer productId : cart.keySet()) {

                int quantity = cart.get(productId);
                double unitPrice = productDAO.getProductById(productId).getPrice();
                double subtotal = unitPrice * quantity;

                itemPs.setInt(1, orderId);
                itemPs.setInt(2, productId);
                itemPs.setInt(3, quantity);
                itemPs.setDouble(4, unitPrice);
                itemPs.setDouble(5, subtotal);
                itemPs.executeUpdate();

                stockPs.setInt(1, quantity);
                stockPs.setInt(2, productId);
                stockPs.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM orders " +
                            "WHERE user_id = ? " +
                            "ORDER BY order_date DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getString("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM orders " +
                            "ORDER BY order_date DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getString("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT oi.*, p.name AS product_name " +
                            "FROM order_items oi " +
                            "LEFT JOIN products p ON oi.product_id = p.id " +
                            "WHERE oi.order_id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderItem item = new OrderItem();

                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("product_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setUnitPrice(rs.getDouble("unit_price"));
                item.setSubtotal(rs.getDouble("subtotal"));

                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    public boolean updateOrderStatus(int orderId, String status) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "UPDATE orders " +
                            "SET status = ? " +
                            "WHERE id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, orderId);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean cancelOrder(int orderId, int userId) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "UPDATE orders " +
                            "SET status = 'İptal Edildi' " +
                            "WHERE id = ? " +
                            "AND user_id = ? " +
                            "AND status = 'Beklemede'";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderId);
            ps.setInt(2, userId);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}