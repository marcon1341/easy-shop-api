package org.yearup.data;

import org.yearup.models.Category;

import java.util.List;
/**
 * Data Access Object (DAO) interface for managing product categories.
 * Provides methods for listing, retrieving, creating, updating, and deleting categories.
 */
public interface CategoryDao
{
    /**
     * Retrieves all product categories.
     * @return A list of all categories.
     */
    List<Category> getAllCategories();

    /**
     * Retrieves a category by its unique ID.
     * @param categoryId The ID of the category to retrieve.
     * @return The Category object if found, or null if not found.
     */
    Category getById(int categoryId);

    /**
     * Creates a new category in the data source.
     * @param category The Category object to create.
     * @return The newly created Category object (including any generated fields).
     */
    Category create(Category category);

    /**
     * Updates an existing category by its ID.
     * @param categoryId The ID of the category to update.
     * @param category The Category object containing updated data.
     */
    void update(int categoryId, Category category);

    /**
     * Deletes a category by its unique ID.
     * @param categoryId The ID of the category to delete.
     */
    void delete(int categoryId);
}
