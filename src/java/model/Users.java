/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Users {
    private int userID;
    private String userName;
    private String email;
    private String password;
    private int userRole;
    private String gender;

    // Constructor, getters, and setters

    public Users() {
    }

    public Users(int userID, String userName, String email, String password, int userRole, String gender) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.gender = gender;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", email=" + email + ", password=" + password + ", userRole=" + userRole + ", gender=" + gender + '}';
    }
    
    
}

