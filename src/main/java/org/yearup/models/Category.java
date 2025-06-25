package org.yearup.models;

/**
 * Represents a product category.
 * Each category has a unique ID, a name, and a description.
 */
public class Category
{
    private int categoryId;
    private String name;
    private String description;

    public Category()
    {
    }

    public Category(int categoryId, String name, String description)
    {
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
    }

    //getters and setters
    public int getCategoryId()
    {
        return categoryId;
    }

    public void setCategoryId(int categoryId)
    {
        this.categoryId = categoryId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }
}
