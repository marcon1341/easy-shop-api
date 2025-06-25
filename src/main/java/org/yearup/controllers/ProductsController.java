package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.yearup.models.Product;
import org.yearup.data.ProductDao;

import java.math.BigDecimal;
import java.util.List;

/**
 * REST controller for product operations.
 * Public endpoints allow anyone to search or view products;
 * admin-only endpoints allow product management (add, update, delete).
 */
@RestController
@RequestMapping("products")
@CrossOrigin
public class ProductsController
{
    private ProductDao productDao;

    /**
     * Constructor for dependency injection.
     * @param productDao Data Access Object for products.
     */
    @Autowired
    public ProductsController(ProductDao productDao)
    {
        this.productDao = productDao;
    }

    /**
     * GET /products
     * Public: Returns a list of products matching optional filters.
     * Filters: category, min price, max price, color.
     * @param categoryId  Optional category filter.
     * @param minPrice Optional minimum price.
     * @param maxPrice Optional maximum price.
     * @param color Optional color.
     * @return List of matching products.
     */
    @GetMapping("")
    @PreAuthorize("permitAll()")
    public List<Product>
    search(@RequestParam(name="cat", required = false) Integer categoryId,
           @RequestParam(name="minPrice", required = false) BigDecimal minPrice,
           @RequestParam(name="maxPrice", required = false) BigDecimal maxPrice,
           @RequestParam(name="color", required = false) String color
           )
    {
        try
        {
            return productDao.search(categoryId, minPrice, maxPrice, color);
        }
        catch(Exception ex)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * GET /products/{id}
     * Public: Returns a product by ID.
     * @param id The product ID.
     * @return The product if found; 404 otherwise.
     */
    @GetMapping("{id}")
    @PreAuthorize("permitAll()")
    public Product getById(@PathVariable int id )
    {
        try
        {
            var product = productDao.getById(id);

            if(product == null)
                throw new ResponseStatusException(HttpStatus.NOT_FOUND);

            return product;
        }
        catch(Exception ex)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * POST /products
     * Admin only Creates a new product.
     * @param product Product to add.
     * @return The created product.
     */
    @PostMapping()
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public Product addProduct(@RequestBody Product product)
    {
        try
        {
            return productDao.create(product);
        }
        catch(Exception ex)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * PUT /products/{id}
     * Admin only Updates an existing product.
     * @param id Product ID to update.
     * @param product Product data to update.
     */
    @PutMapping("{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void updateProduct(@PathVariable int id, @RequestBody Product product)
    {
        try
        {
           //X productDao.create(product);//for put we have to use update statement
            productDao.update(id, product);
        }
        catch(Exception ex)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }

    /**
     * DELETE /products/{id}
     * Admin only Deletes a product by ID.
     * @param id Product ID to delete.
     */
    @DeleteMapping("{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void deleteProduct(@PathVariable int id)
    {
        try
        {
            var product = productDao.getById(id);

            if(product == null)
                throw new ResponseStatusException(HttpStatus.NOT_FOUND);

            productDao.delete(id);
        }
        catch(Exception ex)
        {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Oops... our bad.");
        }
    }
}
