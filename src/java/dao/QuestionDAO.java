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
import model.Questions;

/**
 *
 * @author Admin
 */
public class QuestionDAO extends DBContext{
    // Method to create a new question
    public boolean createQuestion(Questions newQuestion) {
        String query = "INSERT INTO Questions (TestID, QuestionText, Points) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newQuestion.getTestID());
            preparedStatement.setString(2, newQuestion.getQuestionText());
            preparedStatement.setInt(3, newQuestion.getPoints());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("createQuestion: " + e.getMessage());
            return false;
        }
    }

    // Method to update question information
    public boolean updateQuestion(Questions updatedQuestion) {
        String query = "UPDATE Questions SET TestID = ?, QuestionText = ?, Points = ? WHERE QuestionID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, updatedQuestion.getTestID());
            preparedStatement.setString(2, updatedQuestion.getQuestionText());
            preparedStatement.setInt(3, updatedQuestion.getPoints());
            preparedStatement.setInt(4, updatedQuestion.getQuestionID());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateQuestion: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a question
    public boolean deleteQuestion(int questionID) {
        String query = "DELETE FROM Questions WHERE QuestionID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, questionID);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteQuestion: " + e.getMessage());
            return false;
        }
    }

    // Method to get all questions for a specific test
    public List<Questions> getAllQuestionsForTest(int testID) {
        List<Questions> questionList = new ArrayList<>();
        String query = "SELECT * FROM Questions WHERE TestID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Questions question = new Questions();
                    question.setQuestionID(resultSet.getInt("QuestionID"));
                    question.setTestID(resultSet.getInt("TestID"));
                    question.setQuestionText(resultSet.getString("QuestionText"));
                    question.setPoints(resultSet.getInt("Points"));

                    questionList.add(question);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllQuestionsForTest: " + e.getMessage());
        }

        return questionList;
    }
    
    public int getQuestionId() {
        String query = "select max(questionid) from questions";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getQuestionId: " + e.getMessage());
        }
        return -1;
    }
    
    
}
