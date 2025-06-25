package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.yearup.data.ProfileDao;
import org.yearup.data.UserDao;
import org.yearup.models.Profile;
import org.yearup.models.User;

import java.security.Principal;

/**
 * REST controller for handling user profile operations.
 * Only authenticated users can access these endpoints.
 */
@RestController
@RequestMapping("/profile")
@CrossOrigin //allows requests from any origin
@PreAuthorize("isAuthenticated()") //required authentication
public class ProfileController {
    private ProfileDao profileDao;
    private UserDao userDao;

    /**
     * Constructor with dependency injection for DAOs.
     * @param profileDao The data access object for profiles.
     * @param userDao  The data access object for users.
     */
    @Autowired
    public ProfileController(ProfileDao profileDao, UserDao userDao)
    {
        this.profileDao = profileDao;
        this.userDao = userDao;
    }

    /**
     * GET /profile
     * Returns the profile for the currently authenticated user.
     * @param principal The Principal object representing the current user.
     * @return The Profile for the authenticated user.
     * @throws ResponseStatusException (404) if profile not found, or 500 for other errors.
     */
    @GetMapping
    public Profile getProfile(Principal principal){
        try {
            String username = principal.getName();
            User user = userDao.getByUserName(username);
            int userId = user.getId();

            Profile profile = profileDao.getByUserId(userId);
            if (profile == null)
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Profile not found");

            return profile;
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * PUT /profile
     * Updates the profile for the currently authenticated user.
     * Only the owner can update their profile.
     * @param profile   The profile object with updated data (from request body).
     * @param principal The Principal object representing the current user.
     * @throws ResponseStatusException (500) if update fails.
     */
    @PutMapping
    public void updateProfile(@RequestBody Profile profile, Principal principal)
    {
        try {
            String username = principal.getName();
            User user = userDao.getByUserName(username);
            int userId = user.getId();

            profile.setUserId(userId);
            profileDao.update(profile);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to update profile.", e);
        }
    }
}

