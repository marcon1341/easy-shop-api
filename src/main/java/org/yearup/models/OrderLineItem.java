package org.yearup.models;

import java.math.BigDecimal;

public class OrderLineItem {
    private int orderLineId;
    private int orderId;
    private int productId;
    private int quantity;
    private BigDecimal price;

    public OrderLineItem() {}

    public OrderLineItem(int orderLineId, int orderId, int productId, int quantity, BigDecimal price) {
        this.orderLineId = orderLineId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }
    // Getters and setters
    public int getOrderLineId() { return orderLineId; }
    public int getOrderId() { return orderId; }
    public int getProductId() { return productId; }
    public int getQuantity() { return quantity; }
    public BigDecimal getPrice() { return price; }

    public void setOrderLineId(int orderLineId) { this.orderLineId = orderLineId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public void setProductId(int productId) { this.productId = productId; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setPrice(BigDecimal price) { this.price = price; }
}
