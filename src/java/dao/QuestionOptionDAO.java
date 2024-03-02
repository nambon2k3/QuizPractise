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
import model.QuestionOption;

/**
 *
 * @author Admin
 */
public class QuestionOptionDAO extends DBContext{
    // Method to create a new question option
    public boolean createQuestionOption(QuestionOption newQuestionOption) {
        String query = "INSERT INTO QuestionOption (QuestionID, OptionName, OptionText, IsCorrect) VALUES (?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newQuestionOption.getQuestionID());
            preparedStatement.setString(2, newQuestionOption.getOptionName());
            preparedStatement.setString(3, newQuestionOption.getOptionText());
            preparedStatement.setBoolean(4, newQuestionOption.isCorrect());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("createQuestionOption: " + e.getMessage());
            return false;
        }
    }

    // Method to update a question option
    public boolean updateQuestionOption(QuestionOption updatedQuestionOption) {
        String query = "UPDATE QuestionOption SET OptionText = ?, IsCorrect = ? WHERE QuestionID = ? and OptionName = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setString(1, updatedQuestionOption.getOptionText());
            preparedStatement.setBoolean(2, updatedQuestionOption.isCorrect());
            preparedStatement.setInt(3, updatedQuestionOption.getQuestionID());
            preparedStatement.setString(4, updatedQuestionOption.getOptionName());
            
            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateQuestionOption: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a question option
    public boolean deleteQuestionOption(int optionID) {
        String query = "DELETE FROM QuestionOption WHERE OptionID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, optionID);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteQuestionOption: " + e.getMessage());
            return false;
        }
    }

    // Method to get all question options for a specific question
    public List<QuestionOption> getAllOptionsForQuestion(int questionID) {
        List<QuestionOption> optionList = new ArrayList<>();
        String query = "SELECT * FROM QuestionOption WHERE QuestionID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, questionID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    QuestionOption option = new QuestionOption();
                    option.setOptionID(resultSet.getInt("OptionID"));
                    option.setQuestionID(resultSet.getInt("QuestionID"));
                    option.setOptionName(resultSet.getString("OptionName"));
                    option.setOptionText(resultSet.getString("OptionText"));
                    option.setIsCorrect(resultSet.getBoolean("IsCorrect"));

                    optionList.add(option);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllOptionsForQuestion: " + e.getMessage());
        }

        return optionList;
    }
    
    
    // Method to get options for a specific question
    public List<QuestionOption> getQuestionOptionsByQuestionId(int questionID) {
        List<QuestionOption> optionList = new ArrayList<>();
        String query = "SELECT * FROM QuestionOption WHERE QuestionID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, questionID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    QuestionOption option = new QuestionOption();
                    option.setOptionID(resultSet.getInt("OptionID"));
                    option.setQuestionID(resultSet.getInt("QuestionID"));
                    option.setOptionName(resultSet.getString("OptionName"));
                    option.setOptionText(resultSet.getString("OptionText"));
                    option.setIsCorrect(resultSet.getBoolean("IsCorrect"));

                    optionList.add(option);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getQuestionOptionsByQuestionId: " + e.getMessage());
        }

        return optionList;
    }
}
