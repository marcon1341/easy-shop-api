package org.yearup.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.math.BigDecimal;
//Represents a single item in a shopping cart, including the product and quantity.

public class ShoppingCartItem
{
    private Product product = null;
    private int quantity = 1;
    private BigDecimal discountPercent = BigDecimal.ZERO;


    //getters
    public Product getProduct()
    {
        return product;
    }
    public int getQuantity()
    {
        return quantity;
    }
    public BigDecimal getDiscountPercent()
    {
        return discountPercent;
    }
    public int getProductId()
    {
        return this.product.getProductId();
    }

    //setters
    public void setProduct(Product product)
    {
        this.product = product;
    }
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }
    public void setDiscountPercent(BigDecimal discountPercent)
    {
        this.discountPercent = discountPercent;
    }

    @JsonIgnore

    public BigDecimal getLineTotal()
    {
        BigDecimal basePrice = product.getPrice();
        BigDecimal quantity = new BigDecimal(this.quantity);

        BigDecimal subTotal = basePrice.multiply(quantity);
        BigDecimal discountAmount = subTotal.multiply(discountPercent);

        return subTotal.subtract(discountAmount);
    }

}






