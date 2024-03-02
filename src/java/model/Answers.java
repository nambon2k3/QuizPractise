/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Answers {
    private int answerID;
    private int userID;
    private int testID;
    private int questionID;
    private char userAnswer;

    // Constructor, getters, and setters

    public Answers() {
    }

    public Answers(int answerID, int userID, int testID, int questionID, char userAnswer) {
        this.answerID = answerID;
        this.userID = userID;
        this.testID = testID;
        this.questionID = questionID;
        this.userAnswer = userAnswer;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
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

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public char getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(char userAnswer) {
        this.userAnswer = userAnswer;
    }

    @Override
    public String toString() {
        return "Answers{" + "answerID=" + answerID + ", userID=" + userID + ", testID=" + testID + ", questionID=" + questionID + ", userAnswer=" + userAnswer + '}';
    }
    
}

