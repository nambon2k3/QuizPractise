/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Result;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ResultDAO extends DBContext{
    // Method to create a new result
    public boolean createResult(Result newResult) {
        String query = "INSERT INTO Result (UserID, TestID, Score) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newResult.getUserID());
            preparedStatement.setInt(2, newResult.getTestID());
            preparedStatement.setInt(3, newResult.getScore());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("createResult: " + e.getMessage());
            return false;
        }
    }
    
    

    // Method to update a result
    public boolean updateResult(Result updatedResult) {
        String query = "UPDATE Result SET Score = ? WHERE UserID = ? AND TestID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, updatedResult.getScore());
            preparedStatement.setInt(2, updatedResult.getUserID());
            preparedStatement.setInt(3, updatedResult.getTestID());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateResult: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a result
    public boolean deleteResult(int resultID) {
        String query = "DELETE FROM Result WHERE ResultID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, resultID);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteResult: " + e.getMessage());
            return false;
        }
    }

    // Method to get all results for a specific user
    public List<Result> getAllResultsForUser(int userID) {
        List<Result> resultList = new ArrayList<>();
        String query = "SELECT * FROM Result WHERE UserID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Result result = new Result();
                    result.setResultID(resultSet.getInt("ResultID"));
                    result.setUserID(resultSet.getInt("UserID"));
                    result.setTestID(resultSet.getInt("TestID"));
                    result.setScore(resultSet.getInt("Score"));

                    resultList.add(result);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllResultsForUser: " + e.getMessage());
        }

        return resultList;
    }
    
    // Method to check if a result exists for a specific username and test ID
    public boolean checkExistedResult(String username, int testID) {
        String query = "SELECT COUNT(*) FROM Result R INNER JOIN Users U ON R.UserID = U.UserID WHERE U.UserName = ? AND R.TestID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setInt(2, testID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("checkExistedResult: " + e.getMessage());
        }

        return false;
    }
    
    
    // Method to get results for a specific user
    public List<Result> getUserResult(String UserID) {
        List<Result> resultList = new ArrayList<>();
        String query = "SELECT R.* FROM Result R INNER JOIN Users U ON R.UserID = U.UserID WHERE U.UserID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, UserID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Result result = new Result();
                    result.setResultID(resultSet.getInt("ResultID"));
                    result.setUserID(resultSet.getInt("UserID"));
                    result.setTestID(resultSet.getInt("TestID"));
                    result.setScore(resultSet.getInt("Score"));

                    resultList.add(result);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getUserResult: " + e.getMessage());
        }

        return resultList;
    }
    
    // Method to get the score for a specific user in a specific test
    public int getTestScore(int testID, int userID) {
        int score = 0; // Default value indicating no score found
        String query = "SELECT Score FROM Result WHERE TestID = ? AND UserID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);
            preparedStatement.setInt(2, userID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    score = resultSet.getInt("Score");
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getTestScore: " + e.getMessage());
        }

        return score;
    }
    
}
