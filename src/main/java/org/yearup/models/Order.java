package org.yearup.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Order {
    private int orderId;
    private int userId;
    private LocalDateTime orderDate;
    private BigDecimal total;
    private List<OrderLineItem> items = new ArrayList<>();

    public Order() {}

    public Order(int orderId, int userId, LocalDateTime orderDate, BigDecimal total) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.total = total;
    }

    // Getters and setters
    public int getOrderId() { return orderId; }
    public int getUserId() { return userId; }
    public LocalDateTime getOrderDate() { return orderDate; }
    public BigDecimal getTotal() { return total; }
    public List<OrderLineItem> getItems() { return items; }

    public void setOrderId(int orderId) { this.orderId = orderId; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setOrderDate(LocalDateTime orderDate) { this.orderDate = orderDate; }
    public void setTotal(BigDecimal total) { this.total = total; }
    public void setItems(List<OrderLineItem> items) { this.items = items; }
}

