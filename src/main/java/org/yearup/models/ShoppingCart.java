package org.yearup.models;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

//Represents a shopping cart containing multiple ShoppingCartItems.
//Items are stored in a map, using the product ID as the key.

public class ShoppingCart
{
//    map of productId to Shopping cart Item
    private Map<Integer, ShoppingCartItem> items = new HashMap<>();

    /**
     * Gets all items in the cart as a map (keyed by productId).
     * @return the map of productId to ShoppingCartItem
     */
    public Map<Integer, ShoppingCartItem> getItems()
    {
        return items;
    }

    /**
     * Replaces the items in the cart with the given map.
     * @param items a map of productId to ShoppingCartItem
     */
    public void setItems(Map<Integer, ShoppingCartItem> items)
    {
        this.items = items;
    }

    /**
     * Checks if the cart contains an item for the given productId.
     * @param productId the product ID to check
     * @return true if item exists, false otherwise
     */
    public boolean contains(int productId)
    {
        return items.containsKey(productId);
    }

    /**
     * Adds a ShoppingCartItem to the cart.
     * If the item for this productId already exists, it will be replaced.
     * @param item the ShoppingCartItem to add
     */
    public void add(ShoppingCartItem item)
    {
        items.put(item.getProductId(), item);
    }

    /**
     * Gets the ShoppingCartItem for the given productId.
     * @param productId the product ID to get
     * @return the ShoppingCartItem.
     */
    public ShoppingCartItem get(int productId)
    {
        return items.get(productId);
    }
    //  remove items from cart
    public void clear() {
        items.clear();
    }

    /**
     * Calculates the total cost of all items in the cart.
     * Sums the line total for each ShoppingCartItem.
     * @return the total cost as a BigDecimal
     */
    public BigDecimal getTotal()
    {
        // Stream through all items, map to their line totals, then sum them up.

        BigDecimal total = items.values()
                                .stream()
                                .map(i -> i.getLineTotal())
                                .reduce( BigDecimal.ZERO, (lineTotal, subTotal) -> subTotal.add(lineTotal));

        return total;
    }

}
