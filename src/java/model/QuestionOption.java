/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class QuestionOption {
    private int optionID;
    private int questionID;
    private String optionName;
    private String optionText;
    private boolean isCorrect;

    // Constructor, getters, and setters

    public QuestionOption() {
    }

    public QuestionOption(int optionID, int questionID, String optionName, String optionText, boolean isCorrect) {
        this.optionID = optionID;
        this.questionID = questionID;
        this.optionName = optionName;
        this.optionText = optionText;
        this.isCorrect = isCorrect;
    }

    public int getOptionID() {
        return optionID;
    }

    public void setOptionID(int optionID) {
        this.optionID = optionID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public String getOptionText() {
        return optionText;
    }

    public void setOptionText(String optionText) {
        this.optionText = optionText;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
    
    
    
}
