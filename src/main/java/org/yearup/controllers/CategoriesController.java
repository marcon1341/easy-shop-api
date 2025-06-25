package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.yearup.data.CategoryDao;
import org.yearup.data.ProductDao;
import org.yearup.models.Category;
import org.yearup.models.Product;

import java.util.List;

/**
 * REST controller for category management and category-based product queries.
 * Endpoint: http://localhost:8080/categories
 * Allows anyone to view categories and category products; only admins can create, update, or delete categories.
 */
@RestController
@RequestMapping("/categories")
@CrossOrigin
public class CategoriesController
{
    private CategoryDao categoryDao;
    private ProductDao productDao;

    /**
     * Constructor for dependency injection.
     */
    @Autowired
    public CategoriesController(CategoryDao categoryDao, ProductDao productDao) {
        this.categoryDao = categoryDao;
        this.productDao = productDao;
    }

    /**
     * GET /categories
     * Gets all product categories.
     * @return List of all categories.
     */
    @GetMapping
    public List<Category> getAll()
    {
        return categoryDao.getAllCategories();
    }

    /**
     * GET /categories/{id}
     * Gets a single category by its ID.
     * @param id The category ID.
     * @return The Category object (or null if not found).
     */
    @GetMapping("/{id}")
    public Category getById(@PathVariable int id)
    {
        // get the category by id
       return categoryDao.getById(id);
    }

    /**
     * GET /categories/{categoryId}/products
     * Gets all products in the specified category.
     * @param categoryId The category ID.
     * @return List of products in that category.
     */
    @GetMapping("/{categoryId}/products")
    public List<Product> getProductsById(@PathVariable int categoryId)
    {
        // get a list of product by categoryId
        return productDao.listByCategoryId(categoryId);
    }

    /**
     * POST /categories
     * Creates a new category. Admin only.
     * @param category The category to create.
     * @return The created category.
     */
    @PostMapping
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public Category addCategory(@RequestBody Category category)
    {
        // insert the category
      return categoryDao.create(category);
    }

    /**
     * PUT /categories/{id}
     * Updates a category. Admin only.
     * @param id The category ID to update.
     * @param category The updated category data.
     */
    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void updateCategory(@PathVariable int id, @RequestBody Category category)
    {
        // update the category by id
        categoryDao.update(id, category);
    }


    /**
     * DELETE /categories/{id}
     * Deletes a category by ID. Admin only.
     * @param id The category ID to delete.
     */
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void deleteCategory(@PathVariable int id)
    {
        // delete the category by id
        categoryDao.delete(id);
    }
}
