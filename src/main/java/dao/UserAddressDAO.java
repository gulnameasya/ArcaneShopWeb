package dao;

import model.UserAddress;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserAddressDAO {

    public List<UserAddress> getAddressesByUserId(int userId) {

        List<UserAddress> addresses = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM user_addresses " +
                            "WHERE user_id = ? " +
                            "ORDER BY id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                UserAddress address = new UserAddress();

                address.setId(rs.getInt("id"));
                address.setUserId(rs.getInt("user_id"));
                address.setTitle(rs.getString("title"));
                address.setAddress(rs.getString("address"));
                address.setDefaultAddress(
                        rs.getBoolean("is_default")
                );

                addresses.add(address);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return addresses;
    }

    public boolean addAddress(UserAddress address) {

        try {
            Connection conn = DBConnection.getConnection();

            if (address.isDefaultAddress()) {

                String resetSql =
                        "UPDATE user_addresses " +
                                "SET is_default = false " +
                                "WHERE user_id = ?";

                PreparedStatement resetPs =
                        conn.prepareStatement(resetSql);

                resetPs.setInt(1, address.getUserId());

                resetPs.executeUpdate();
            }

            String sql =
                    "INSERT INTO user_addresses " +
                            "(user_id, title, address, is_default) " +
                            "VALUES (?, ?, ?, ?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, address.getUserId());
            ps.setString(2, address.getTitle());
            ps.setString(3, address.getAddress());
            ps.setBoolean(4, address.isDefaultAddress());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAddress(int addressId, int userId) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "DELETE FROM user_addresses " +
                            "WHERE id = ? AND user_id = ?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, addressId);
            ps.setInt(2, userId);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}