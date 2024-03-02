/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Users;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{
    public Users readUserByUsernameAndPassword(String username, String password) {
        Users user = null;
        String query = "SELECT * FROM Users WHERE UserName = ? AND Password = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new Users();
                    user.setUserID(resultSet.getInt("UserID"));
                    user.setUserName(resultSet.getString("UserName"));
                    user.setEmail(resultSet.getString("Email"));
                    user.setPassword(resultSet.getString("Password"));
                    user.setUserRole(resultSet.getInt("UserRole"));
                    user.setGender(resultSet.getString("Gender"));
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("readUserByUsernameAndPassword: " + e.getMessage());
        }

        return user;
    }
    
    public Users readUserByUsername(String username) {
        Users user = null;
        String query = "SELECT * FROM Users WHERE UserName = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new Users();
                    user.setUserID(resultSet.getInt("UserID"));
                    user.setUserName(resultSet.getString("UserName"));
                    user.setEmail(resultSet.getString("Email"));
                    user.setPassword(resultSet.getString("Password"));
                    user.setUserRole(resultSet.getInt("UserRole"));
                    user.setGender(resultSet.getString("Gender"));
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("readUserByUsername: " + e.getMessage());
        }

        return user;
    }
    
    // Method to check if a username already exists
    public boolean isUsernameExists(String username) {
        String query = "SELECT COUNT(*) FROM Users WHERE UserName = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    // If count > 0, username already exists
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("isUsernameExists: " + e.getMessage());
        }

        return false;
    }
    
    // Method to check if an email already exists
    public boolean isEmailExisted(String email) {
        String query = "SELECT COUNT(*) FROM Users WHERE Email = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    // If count > 0, email already exists
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("isEmailExisted: " + e.getMessage());
        }

        return false;
    }
    
    // Method to create a new user
    public boolean createUser(Users newUser) {
        String query = "INSERT INTO Users (UserName, Email, Password, UserRole, Gender) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newUser.getUserName());
            preparedStatement.setString(2, newUser.getEmail());
            preparedStatement.setString(3, newUser.getPassword());
            preparedStatement.setInt(4, newUser.getUserRole());
            preparedStatement.setString(5, newUser.getGender());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            e.printStackTrace();
            return false;
        }
    }
    
    // Method to update user information
    public boolean updateUser(Users updatedUser) {
        String query = "UPDATE Users SET Email = ?, Password = ?, UserRole = ?, Gender = ? WHERE UserName = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, updatedUser.getEmail());
            preparedStatement.setString(2, updatedUser.getPassword());
            preparedStatement.setInt(3, updatedUser.getUserRole());
            preparedStatement.setString(4, updatedUser.getGender());
            preparedStatement.setString(5, updatedUser.getUserName());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateUser: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a user
    public boolean deleteUser(String username) {
        String query = "DELETE FROM Users WHERE UserName = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteUser: " + e.getMessage());
            return false;
        }
    }

    // Method to get all users
    public List<Users> getAllUsers() {
        List<Users> userList = new ArrayList<>();
        String query = "SELECT * FROM Users";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Users user = new Users();
                user.setUserID(resultSet.getInt("UserID"));
                user.setUserName(resultSet.getString("UserName"));
                user.setEmail(resultSet.getString("Email"));
                user.setPassword(resultSet.getString("Password"));
                user.setUserRole(resultSet.getInt("UserRole"));
                user.setGender(resultSet.getString("Gender"));

                userList.add(user);
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllUsers: " + e.getMessage());
        }

        return userList;
    }
}
