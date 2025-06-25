package org.yearup.data;


import org.yearup.models.Profile;
/**
 * Data Access Object (DAO) interface for managing user profiles.
 * Implementations of this interface should provide the logic for creating,
 * retrieving, and updating Profile objects in the data source.
 */
public interface ProfileDao
{
    /**
     * Creates a new user profile in the data source.
     * @param profile The {@link Profile} object to create.
     * @return The newly created {@link Profile}, including any updated fields.
     */
    Profile create(Profile profile);

    /**
     * Retrieves a user profile by the user's unique ID.
     * @param userId The unique identifier of the user.
     * @return The {@link Profile} for the specified user.
     */
    Profile getByUserId(int userId);

    /**
     * Updates an existing user profile in the data source.
     * @param profile The {@link Profile} object containing updated profile information.
     */
    void update(Profile profile);
}
