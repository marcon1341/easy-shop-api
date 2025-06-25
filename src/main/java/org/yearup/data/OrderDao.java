package org.yearup.data;

import org.yearup.models.Order;


/**
 * Data Access Object (DAO) interface for managing orders.
 * Provides a method for creating and saving new orders to the data store.
 */
public interface OrderDao {

    /**
     * Creates a new order in the database.
     * @param order The Order object to create.
     * @return The created Order object.
     */
    Order create(Order order);
}
