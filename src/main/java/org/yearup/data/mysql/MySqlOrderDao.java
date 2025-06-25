package org.yearup.data.mysql;

import org.springframework.stereotype.Component;
import org.yearup.data.OrderDao;
import org.yearup.models.Order;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDateTime;

/**
 * MySQL implementation of the {@link OrderDao} interface.
 * Handles inserting new Order records into the database.
 */
@Component
public class MySqlOrderDao extends MySqlDaoBase implements OrderDao {

    /**
     * Constructor for dependency injection of DataSource.
     * @param dataSource The DataSource used for DB connections.
     */
    public MySqlOrderDao(DataSource dataSource) {
        super(dataSource);
    }

    /**
     * Inserts a new order into the orders table.
     * Fills the generated orderId into the returned object.
     * @param order The Order object to insert.
     * @return The inserted Order with orderId set.
     */
    @Override
    public Order create(Order order) {
        String sql = "INSERT INTO orders (user_id, date, address, city, state, zip, shipping_amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                stmt.setInt(1, order.getUserId());
                stmt.setTimestamp(2, Timestamp.valueOf(order.getOrderDate() != null ? order.getOrderDate() : LocalDateTime.now()));
                stmt.setString(3, order.getAddress());
                stmt.setString(4, order.getCity());
                stmt.setString(5, order.getState());
                stmt.setString(6, order.getZip());
                stmt.setBigDecimal(7, order.getShippingAmount());

                stmt.executeUpdate();

                // Get the generated order ID and set it on the order object
                ResultSet keys = stmt.getGeneratedKeys();
                if (keys.next()) {
                    order.setOrderId(keys.getInt(1));
                }
                return order;
            } catch (SQLException e) {
                throw new RuntimeException(e);
        }
    }
}

