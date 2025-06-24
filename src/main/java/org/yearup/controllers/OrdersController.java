
package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.yearup.data.*;
import org.yearup.models.*;

import java.math.BigDecimal;
import java.security.Principal;
import java.time.LocalDateTime;

@RestController
@RequestMapping("/orders")
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class OrdersController {
    private final OrderDao orderDao;
    private final OrderLineItemDao orderLineItemDao;
    private final ShoppingCartDao shoppingCartDao;
    private final ProfileDao profileDao;
    private final UserDao userDao;

    @Autowired
    public OrdersController(OrderDao orderDao,
        OrderLineItemDao orderLineItemDao,
        ShoppingCartDao shoppingCartDao,
        ProfileDao profileDao,
        UserDao userDao) {
        this.orderDao = orderDao;
        this.orderLineItemDao = orderLineItemDao;
        this.shoppingCartDao = shoppingCartDao;
        this.profileDao = profileDao;
        this.userDao = userDao;
    }

    @PostMapping
    public ResponseEntity<?> checkout(Principal principal) {
        try {
            String userName = principal.getName();
            User user = userDao.getByUserName(userName);
            Profile profile = profileDao.getByUserId(user.getId());
            ShoppingCart cart = shoppingCartDao.getByUserId(user.getId());

            if (cart.getItems().isEmpty()) {
                return ResponseEntity.badRequest().body("Cart is empty.");
            }

            // Build the order with profile
            Order order = new Order();
            order.setUserId(user.getId());
            order.setOrderDate(LocalDateTime.now());
            order.setAddress(profile.getAddress());
            order.setCity(profile.getCity());
            order.setState(profile.getState());
            order.setZip(profile.getZip());
            order.setShippingAmount(BigDecimal.ZERO);

            orderDao.create(order);

            for (ShoppingCartItem item : cart.getItems().values()) {
                OrderLineItem oli = new OrderLineItem();
                oli.setOrderId(order.getOrderId());
                oli.setProductId(item.getProductId());
                oli.setQuantity(item.getQuantity());
                oli.setSalesPrice(item.getProduct().getPrice());
                oli.setDiscount(BigDecimal.ZERO);

                orderLineItemDao.create(oli);
            }

            shoppingCartDao.clearCart(user.getId());
            return ResponseEntity.ok("Order placed successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Checkout failed. " + e.getMessage());
        }
    }
}
