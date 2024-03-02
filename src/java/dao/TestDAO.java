/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Questions;
import model.Tests;

/**
 *
 * @author Admin
 */
public class TestDAO extends DBContext {

    // Method to create a new test
    public boolean createTest(Tests newTest, String startTime) {
        String query = "INSERT INTO Tests (TestName, StartTime, Duration, [Description]) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newTest.getTestName());
            preparedStatement.setObject(2, startTime);
            preparedStatement.setInt(3, newTest.getDuration());
            preparedStatement.setString(4, newTest.getDescription());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("createTest: " + e.getMessage());

            return false;
        }
    }

    // Method to update test information
    public boolean updateTest(Tests updatedTest, String startTime) {
        String query = "UPDATE Tests SET TestName = ?, StartTime = ?, Duration = ?, Description = ?, status = ? WHERE TestID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, updatedTest.getTestName());
            preparedStatement.setObject(2, startTime);
            preparedStatement.setInt(3, updatedTest.getDuration());
            preparedStatement.setString(4, updatedTest.getDescription());
            preparedStatement.setInt(5, updatedTest.getStatus());
            preparedStatement.setInt(6, updatedTest.getTestID());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("updateTest: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a test
    public boolean deleteTest(int testID) {
        String query = "DELETE FROM Tests WHERE TestID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the deletion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("deleteTest: " + e.getMessage());
            return false;
        }
    }

    // Method to get all tests
    public List<Tests> getAllTests() {
        List<Tests> testList = new ArrayList<>();
        String query = "SELECT * FROM Tests";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Tests test = new Tests();
                test.setTestID(resultSet.getInt("TestID"));
                test.setTestName(resultSet.getString("TestName"));
                test.setStartTime(LocalDateTime.parse(resultSet.getString("StartTime").replaceAll("\\.0$", ""), formatter));
                test.setDuration(resultSet.getInt("Duration"));
                test.setDescription(resultSet.getString("Description"));
                test.setStatus(resultSet.getInt("status"));
                testList.add(test);
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getAllTests: " + e.getMessage());
        }

        return testList;
    }

    // Method to get all tests
    public List<Tests> getPagingTests(String searchName, String duration, String startDate, int index) {
        List<Tests> testList = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [Tests]\n"
                + "  WHERE status = 1 and duration >= ? and StartTime >= ? and TestName like '%" + searchName + "%'\n"
                + "  Order by TestID\n"
                + " Offset ? Rows fetch next 15 rows only";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            preparedStatement.setString(1, duration);
            preparedStatement.setString(2, startDate);
            preparedStatement.setInt(3, (index - 1) * 18);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Tests test = new Tests();
                    test.setTestID(resultSet.getInt("TestID"));
                    test.setTestName(resultSet.getString("TestName"));
                    test.setStartTime(LocalDateTime.parse(resultSet.getString("StartTime").replaceAll("\\.0$", ""), formatter));
                    test.setDuration(resultSet.getInt("Duration"));
                    test.setDescription(resultSet.getString("Description"));
                    test.setIsStarted(test.getStartTime().isBefore(LocalDateTime.now()));
                    testList.add(test);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getPagingTests: " + e.getMessage());
        }

        return testList;
    }

    // Method to get all tests
    public int countNumberTest(String searchName, String duration, String startDate, int index) {
        String query = "SELECT Count(*)"
                + "  FROM [Tests]\n"
                + "  WHERE status = 1 and duration >= ? and StartTime >= ? and TestName like '%" + searchName + "%'\n";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            preparedStatement.setString(1, duration);
            preparedStatement.setString(2, startDate);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {

                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("countNumberTest: " + e.getMessage());
        }
        return -1;
    }

    // Method to get the total number of questions for a specific test
    public int getTotalQuestions(int testID) {
        int totalQuestions = 0;
        String query = "SELECT COUNT(*) FROM Questions WHERE TestID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalQuestions = resultSet.getInt(1);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getTotalQuestions: " + e.getMessage());
        }

        return totalQuestions;
    }

    // Method to get the total points for a specific test
    public int getTotalPoints(int testID) {
        int totalPoints = 0;
        String query = "SELECT SUM(Points) FROM Questions WHERE TestID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalPoints = resultSet.getInt(1);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getTotalPoints: " + e.getMessage());
        }

        return totalPoints;
    }

    // Method to get questions for a specific test
    public List<Questions> getTestQuestions(int testID) {
        List<Questions> questionList = new ArrayList<>();
        String query = "SELECT * FROM Questions WHERE TestID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
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
            System.out.println("getTestQuestions: " + e.getMessage());
        }

        return questionList;
    }

    // Method to get a test by its ID
    public Tests getTestById(int testID) {
        Tests test = null;
        String query = "SELECT * FROM Tests WHERE TestID = ?";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, testID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    test = new Tests();
                    test.setTestID(resultSet.getInt("TestID"));
                    test.setTestName(resultSet.getString("TestName"));
                    test.setStartTime(LocalDateTime.parse(resultSet.getString("StartTime").replaceAll("\\.0$", ""), formatter));
                    test.setDuration(resultSet.getInt("Duration"));
                    test.setDescription(resultSet.getString("Description"));
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getTestById: " + e.getMessage());
        }

        return test;
    }

    // Method to get registered tests for a specific user
    public List<Tests> getRegisterTest(int userID) {
        List<Tests> registerTestList = new ArrayList<>();
        String query = "SELECT DISTINCT T.* FROM Tests T "
                + "INNER JOIN Result R ON T.TestID = R.TestID "
                + "WHERE R.UserID = ? AND T.StartTime > GETDATE()";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Tests test = new Tests();
                    test.setTestID(resultSet.getInt("TestID"));
                    test.setTestName(resultSet.getString("TestName"));
                    test.setStartTime(LocalDateTime.parse(resultSet.getString("StartTime").replaceAll("\\.0$", ""), formatter));
                    test.setDuration(resultSet.getInt("Duration"));
                    test.setDescription(resultSet.getString("Description"));

                    registerTestList.add(test);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getRegisterTest: " + e.getMessage());
        }

        return registerTestList;
    }

    // Method to get completed tests for a specific user
    public List<Tests> getListCompletedTest(int userID) {
        List<Tests> completedTestList = new ArrayList<>();
        String query = "SELECT DISTINCT T.* FROM Tests T "
                + "INNER JOIN Result R ON T.TestID = R.TestID "
                + "WHERE R.UserID = ? AND DATEADD(MINUTE, T.Duration, T.StartTime) < GETDATE();";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Tests test = new Tests();
                    test.setTestID(resultSet.getInt("TestID"));
                    test.setTestName(resultSet.getString("TestName"));
                    test.setStartTime(LocalDateTime.parse(resultSet.getString("StartTime").replaceAll("\\.0$", ""), formatter));
                    test.setDuration(resultSet.getInt("Duration"));
                    test.setDescription(resultSet.getString("Description"));

                    completedTestList.add(test);
                }
            }

        } catch (SQLException e) {
            // Handle exceptions (log or throw as needed)
            System.out.println("getListCompletedTest: " + e.getMessage());
        }

        return completedTestList;
    }

    public boolean checkTestIsEnd(int testId) {
        boolean isEnded = false;
        // SQL Server uses GETDATE() to fetch the current date and time
        String sql = "SELECT * FROM Tests WHERE TestID = ? AND DATEADD(MINUTE, duration, StartTime) < GETDATE()";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, testId);

            try ( ResultSet rs = ps.executeQuery()) {
                // If there's at least one row, the test has ended.
                isEnded = rs.next();
            }
        } catch (SQLException e) {
            System.out.println("checkTestIsEnd: " + e.getMessage());
        }
        return isEnded;
    }

}
