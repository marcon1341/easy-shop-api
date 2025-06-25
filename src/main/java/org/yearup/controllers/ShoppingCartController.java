package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.yearup.data.ProductDao;
import org.yearup.data.ShoppingCartDao;
import org.yearup.data.UserDao;
import org.yearup.models.ShoppingCart;
import org.yearup.models.ShoppingCartItem;
import org.yearup.models.User;

import java.security.Principal;

/**
 * REST controller for managing the shopping cart for logged-in users.
 * Only authenticated users can access these endpoints.
 * Provides actions to view, add, update, and remove cart items.
 */
@RestController
@RequestMapping("/cart")
@CrossOrigin
@PreAuthorize("isAuthenticated()")//usseer must logged in
public class ShoppingCartController
{
    private ShoppingCartDao shoppingCartDao;
    private UserDao userDao;
    private ProductDao productDao;

    /**
     * Constructor for dependency injection.
     * @param shoppingCartDao DAO for cart operations.
     * @param userDao DAO for user lookup.
     * @param productDao DAO for product lookup.
     */
    @Autowired
    public ShoppingCartController(ShoppingCartDao shoppingCartDao, UserDao userDao, ProductDao productDao)
    {
        this.shoppingCartDao = shoppingCartDao;
        this.userDao = userDao;
        this.productDao = productDao;
    }

    /**
     * GET /cart
     * Returns the current user's shopping cart.
     * @param principal Authenticated user info.
     * @return The ShoppingCart object for the user.
     */
    @GetMapping
    public ShoppingCart getCart(Principal principal)
    {
        try
        {
            // get the currently logged in username
            String userName = principal.getName();
            System.out.println("Username: " + userName);
            // find database user by userId
            User user = userDao.getByUserName(userName);
            System.out.println("User: " + user);
            int userId = user.getId();

            return shoppingCartDao.getByUserId(userId);
        }
        catch(Exception e)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * POST /cart/products/{productId}
     * Adds a product to the current user's cart. If already in cart, increments quantity.
     * @param productId Product to add.
     * @param principal Authenticated user info.
     * @return Updated ShoppingCart.
     */
    @PostMapping("/products/{productId}")
    public ShoppingCart addProductToCart(@PathVariable int productId, Principal principal) {
        try {
            // get the currently logged in username
            String userName = principal.getName();
            // find database user by userId
            User user = userDao.getByUserName(userName);
            int userId = user.getId();

            shoppingCartDao.addProductToCart(userId, productId);
            return shoppingCartDao.getByUserId(userId);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * PUT /cart/products/{productId}
     * Updates the quantity of a product in the user's cart.
     * @param productId Product to update.
     * @param item ShoppingCartItem object with new quantity.
     * @param principal Authenticated user info.
     * @return Updated ShoppingCart.
     */
    @PutMapping("/products/{productId}")
    public ShoppingCart updateCartItem(@PathVariable int productId, @RequestBody ShoppingCartItem item, Principal principal){
        try
        {
            String userName = principal.getName();
            User user = userDao.getByUserName(userName);
            int userId = user.getId();

            shoppingCartDao.updateProductQuantity(userId, productId, item.getQuantity());
            return shoppingCartDao.getByUserId(userId);
        } catch(Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * DELETE /cart
     * Clears all products from the current user's cart.
     * @param principal Authenticated user info.
     * @return Updated (now empty) ShoppingCart.
     */
    @DeleteMapping
    public ShoppingCart clearCart(Principal principal)
    {
        try
        {
            String userName = principal.getName();
            User user = userDao.getByUserName(userName);
            int userId = user.getId();

            shoppingCartDao.clearCart(userId);
            return shoppingCartDao.getByUserId(userId);
        }
        catch(Exception e)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * DELETE /cart/products/{productId}
     * Removes a specific product from the user's cart.
     * @param productId Product to remove.
     * @param principal Authenticated user info.
     * @return Updated ShoppingCart.
     */
    @DeleteMapping("/products/{productId}")
    public ShoppingCart removeProductFromCart(@PathVariable int productId, Principal principal) {
        try {
            String userName = principal.getName();
            User user = userDao.getByUserName(userName);
            int userId = user.getId();

            shoppingCartDao.removeProductFromCart(userId, productId);
            return shoppingCartDao.getByUserId(userId);
        } catch(Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }
}
