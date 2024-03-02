/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
import dao.ResultDAO;
import dao.TestDAO;
import java.time.LocalDateTime;
import java.util.Date;

public class Tests {
    private int testID;
    private String testName;
    private LocalDateTime startTime;
    private Integer duration;
    private String description;
    private int status;
    private boolean isStarted;
    // Constructor, getters, and setters

    public Tests() {
    }

    public Tests(int testID, String testName, LocalDateTime startTime, Integer duration, String description) {
        this.testID = testID;
        this.testName = testName;
        this.startTime = startTime;
        this.duration = duration;
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    

    public boolean isIsStarted() {
        return isStarted;
    }

    public void setIsStarted(boolean isStarted) {
        this.isStarted = isStarted;
    }

    
    
    public int getNumberQuestion() {
        return new TestDAO().getTotalQuestions(testID);
    }


    public int getTotalPoint() {
        return new TestDAO().getTotalPoints(testID);
    }
  

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean checkRegistered(String username) {
        return new ResultDAO().checkExistedResult(username, testID);
    }
    
    public int getTestScore(int userId) {
        return new ResultDAO().getTestScore(testID, userId);
    }
    
    public boolean checkEnded() {
        return new TestDAO().checkTestIsEnd(testID);
    }
    
    @Override
    public String toString() {
        return "Tests{" + "testID=" + testID + ", testName=" + testName + ", startTime=" + startTime + ", duration=" + duration + ", description=" + description + '}';
    }
    
}

