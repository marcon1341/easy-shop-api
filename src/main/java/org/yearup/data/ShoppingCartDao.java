package org.yearup.data;

import org.yearup.models.ShoppingCart;

/**
 * Data Access Object (DAO) interface for managing shopping cart operations in the data source.
 * Implementations of this interface will provide the logic for retrieving, updating, and clearing shopping carts for users.
 */
public interface ShoppingCartDao
{
    /**
     * Retrieves the shopping cart for a given user by their userId.
     * @param userId The unique ID of the user.
     * @return The ShoppingCart object for the specified user.
     */
    ShoppingCart getByUserId(int userId);

    /**
     * Adds a product to the user's shopping cart.
     * If the product is already in the cart, implementation may increase the quantity.
     * @param userId The unique ID of the user.
     * @param productId The unique ID of the product to add.
     */
    void addProductToCart(int userId, int productId);

    /**
     * Updates the quantity of a product in the user's cart.
     * @param userId The unique ID of the user.
     * @param productId The unique ID of the product to update.
     * @param quantity The new quantity to set for this product in the cart.
     */
    void updateProductQuantity(int userId, int productId, int quantity);

    /**
     * Removes all products from the user's shopping cart.
     * @param userId The unique ID of the user.
     */
    void clearCart(int userId);

    /**
     * Removes a single product from the user's shopping cart.
     * @param userId The unique ID of the user.
     * @param productId The unique ID of the product to remove.
     */
    void removeProductFromCart(int userId, int productId);

}
