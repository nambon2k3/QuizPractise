/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Result {
    private int resultID;
    private int userID;
    private int testID;
    private int score;

    // Constructor, getters, and setters

    public Result() {
    }

    public Result(int resultID, int userID, int testID, int score) {
        this.resultID = resultID;
        this.userID = userID;
        this.testID = testID;
        this.score = score;
    }

    public int getResultID() {
        return resultID;
    }

    public void setResultID(int resultID) {
        this.resultID = resultID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Result{" + "resultID=" + resultID + ", userID=" + userID + ", testID=" + testID + ", score=" + score + '}';
    }
    
}
