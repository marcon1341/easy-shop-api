package org.yearup.models;

import java.math.BigDecimal;

public class OrderLineItem {
    private int orderLineId;
    private int orderId;
    private int productId;
    private int quantity;
    private BigDecimal salesPrice;
    private BigDecimal discount;

    public OrderLineItem() {}

    public int getOrderLineId() { return orderLineId; }
    public int getOrderId() { return orderId; }
    public int getProductId() { return productId; }
    public int getQuantity() { return quantity; }
    public BigDecimal getSalesPrice() { return salesPrice; }
    public BigDecimal getDiscount() { return discount; }

    public void setOrderLineId(int orderLineId) { this.orderLineId = orderLineId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public void setProductId(int productId) { this.productId = productId; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setSalesPrice(BigDecimal salesPrice) { this.salesPrice = salesPrice; }
    public void setDiscount(BigDecimal discount) { this.discount = discount; }
}
