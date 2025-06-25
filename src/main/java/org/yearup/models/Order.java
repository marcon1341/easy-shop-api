package org.yearup.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * Represents a customer's order, including shipping address, shipping amount,
 * and the date/time the order was placed.
 */
public class Order {
    private int orderId;
    private int userId;
    private LocalDateTime orderDate;
    private String address;
    private String city;
    private String state;
    private String zip;
    private BigDecimal shippingAmount;

    // private BigDecimal total;
    // private List<OrderLineItem> items = new ArrayList<>();

    public Order() {}

    // Getters and setters
    public int getOrderId() {
        return orderId;
    }
    public  int getUserId(){
        return userId;
    }
    public LocalDateTime getOrderDate() {
        return orderDate;
    }
    public String getAddress() {
        return address;
    }
    public String getCity() {
        return city;
    }
    public String getState() {
        return state;
    }
    public String getZip() {
        return zip;
    }
    public BigDecimal getShippingAmount() {
        return shippingAmount;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public void setState(String state) {
        this.state = state;
    }
    public void setZip(String zip) {
        this.zip = zip;
    }
    public void setShippingAmount(BigDecimal shippingAmount) {
        this.shippingAmount = shippingAmount;
    }
}

