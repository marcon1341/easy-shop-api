package org.yearup.data.mysql;

import org.springframework.stereotype.Component;
import org.yearup.data.ShoppingCartDao;
import org.yearup.models.ShoppingCart;

import javax.sql.DataSource;

@Component
public class MySqlShoppingCartDao  extends MySqlDaoBase implements ShoppingCartDao {
    public MySqlShoppingCartDao(DataSource dataSource){
        super(dataSource);
    }
    @Override
    public ShoppingCart getByUserId(int userId) {
        return null;
    }

    @Override
    public void addProductToCart(int userId, int productId) {

    }

    @Override
    public void updateProductQuantity(int userId, int productId, int quantity) {

    }

    @Override
    public void clearCart(int userId) {

    }
}
