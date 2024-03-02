/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.AnswerDAO;
import dao.QuestionOptionDAO;
import dao.TestDAO;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Questions {
    private int questionID;
    private int testID;
    private String questionText;
    private int points;

    // Constructor, getters, and setters

    public Questions() {
    }

    public Questions(int questionID, int testID, String questionText, int points) {
        this.questionID = questionID;
        this.testID = testID;
        this.questionText = questionText;
        this.points = points;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    
    public String getTestName() {
        return new TestDAO().getTestById(testID).getTestName();
    }
    
    public List<QuestionOption> getQuestionOption() {
        return new QuestionOptionDAO().getQuestionOptionsByQuestionId(questionID);
    }

    @Override
    public String toString() {
        return "Questions{" + "questionID=" + questionID + ", testID=" + testID + ", questionText=" + questionText + ", points=" + points + '}';
    }
    
}
