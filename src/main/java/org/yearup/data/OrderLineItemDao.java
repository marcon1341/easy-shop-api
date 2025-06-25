package org.yearup.data;

import org.yearup.models.OrderLineItem;

/**
 * Data Access Object (DAO) interface for order line items.
 * Provides a method to create (insert) a new OrderLineItem in the data store.
 */
public interface OrderLineItemDao{

    /**
     * Inserts a new order line item into the database.
     * @param item The OrderLineItem to create.
     */
void create(OrderLineItem item);
}
