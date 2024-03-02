/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.UserDAO;
import model.Users;

/**
 *
 * @author Admin
 */
public class Validation {
    public static String validSignUp(Users user, String confirmPassword) {
        UserDAO userDAO = new UserDAO();
        //1. check existed username
        if(userDAO.isUsernameExists(user.getUserName())) {
            return "Username is existed! Try again!";
        } else if(userDAO.isEmailExisted(user.getEmail())) {
            return "Email is existed! Try again!";
        } else if (!user.getPassword().equals(confirmPassword)) {
            return "Password anf Confirm Password not match! Try again!";
        } else {
            return null;
        }
    }
}
