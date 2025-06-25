package org.yearup.data;

import org.yearup.models.User;

import java.util.List;

/**
 * Data Access Object (DAO) interface for managing users.
 * Provides methods to retrieve, create, and check users in the data store.
 */
public interface UserDao {

    /**
     * Retrieves all users from the data source.
     * @return List of all users.
     */
    List<User> getAll();

    /**
     * Gets a user by their unique user ID.
     * @param userId The user's ID.
     * @return The User object.
     */
    User getUserById(int userId);

    /**
     * Gets a user by their unique username.
     * @param username The user's username.
     * @return The User object.
     */
    User getByUserName(String username);

    /**
     * Gets the user ID for a given username.
     * @param username The user's username.
     * @return The user's ID.
     */
    int getIdByUsername(String username);

    /**
     * Creates a new user in the data store.
     * @param user The User object to create.
     * @return The created User object.
     */
    User create(User user);

    /**
     * Checks if a username already exists in the data store.
     * @param username The username to check.
     * @return True if the username exists.
     */
    boolean exists(String username);
}
