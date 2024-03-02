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
import model.Answers;

/**
 *
 * @author Admin
 */
public class AnswerDAO extends DBContext {

    // Method to create a new answer
    public boolean createAnswer(Answers newAnswer) {
        String query = "INSERT INTO Answers (UserID, TestID, QuestionID, UserAnswer) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newAnswer.getUserID());
            preparedStatement.setInt(2, newAnswer.getTestID());
            preparedStatement.setInt(3, newAnswer.getQuestionID());
            preparedStatement.setString(4, String.valueOf(newAnswer.getUserAnswer()));

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("createAnswer: " + e.getMessage());
            return false;
        }
    }

    // Method to update an answer
    public boolean updateAnswer(Answers updatedAnswer) {
        String query = "UPDATE Answers SET UserAnswer = ? WHERE [UserID] = ? AND [QuestionID] = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(2, updatedAnswer.getUserID());
            preparedStatement.setInt(3, updatedAnswer.getQuestionID());
            preparedStatement.setString(1, updatedAnswer.getUserAnswer() + "");

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateAnswer: " + e.getMessage());
            return false;
        }
    }

    // Method to delete an answer
    public boolean deleteAnswer(int answerID) {
        String query = "DELETE FROM Answers WHERE AnswerID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, answerID);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteAnswer: " + e.getMessage());
            return false;
        }
    }

    // Method to get all answers for a specific user
    public List<Answers> getAllAnswersForUser(int userID) {
        List<Answers> answerList = new ArrayList<>();
        String query = "SELECT * FROM Answers WHERE UserID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Answers answer = new Answers();
                    answer.setAnswerID(resultSet.getInt("AnswerID"));
                    answer.setUserID(resultSet.getInt("UserID"));
                    answer.setTestID(resultSet.getInt("TestID"));
                    answer.setQuestionID(resultSet.getInt("QuestionID"));
                    answer.setUserAnswer(resultSet.getString("UserAnswer").charAt(0));

                    answerList.add(answer);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllAnswersForUser: " + e.getMessage());
        }

        return answerList;
    }

    // Method to get answers for a specific question
    public List<Answers> getListAnswerByTestId(int testID, int userId) {
        List<Answers> answerList = new ArrayList<>();
        String query = "SELECT * FROM Answers WHERE TestID = ? And UserID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);
            preparedStatement.setInt(2, userId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Answers answer = new Answers();
                    answer.setAnswerID(resultSet.getInt("AnswerID"));
                    answer.setUserID(resultSet.getInt("UserID"));
                    answer.setTestID(resultSet.getInt("TestID"));
                    answer.setQuestionID(resultSet.getInt("QuestionID"));
                    answer.setUserAnswer(resultSet.getString("UserAnswer").charAt(0));

                    answerList.add(answer);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getListAnswerByQuestionId: " + e.getMessage());
        }

        return answerList;
    }

    // Method to check if an answer exists for a given user and question
    public boolean checkExistedAnswer(int userId, int questionId) {
        String query = "SELECT COUNT(1) FROM Answers WHERE UserID = ? AND QuestionID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, questionId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0; // Return true if count is more than 0
                }
            }
        } catch (SQLException e) {
            System.out.println("checkExistedAnswer: " + e.getMessage()); // Handle exceptions appropriately
        }

        return false; // Return false if no answer was found or if an exception occurred
    }

    public void getUserSubmitAnswer(int userId, int questionId, Answers answer) {
        if (checkExistedAnswer(userId, questionId)) {
            this.updateAnswer(answer);
        } else {
            this.createAnswer(answer);
        }
    }

    public boolean checkCorrectAnswer(int questionId, String userAnswer) {
        boolean isCorrect = false;
        String sql = "SELECT * FROM QuestionOption WHERE QuestionID = ? AND OptionName = ? AND IsCorrect = 1";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, questionId);
            ps.setString(2, userAnswer);
            try ( ResultSet rs = ps.executeQuery()) {
                // If there's at least one row, the answer is correct.
                isCorrect = rs.next();
            }
        } catch (SQLException e) {
            System.out.println("checkCorrectAnswer: " + e.getMessage());
        }
        return isCorrect;
    }
}
