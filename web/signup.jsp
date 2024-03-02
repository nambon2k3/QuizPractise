<%-- 
    Document   : signup
    Created on : Feb 28, 2024, 12:20:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Signup</title>
        <link rel="stylesheet" href="css/stylelogin.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <div class="container">
            <div class="login-link">
                <div class="logo">
                    <i class="bx bx-pencil"></i>
                    <span class="text">Online Testing</span>
                </div>
                <p class="side-big-heading">Already a member?</p>
                <p class="primary-bg-text">To keep track on your dashboard please login with your
                    personal infor</p>
                <a href="login" class="loginbtn">Login</a>

            </div>
            <form action="signup" class="signup-form-container" method="post">
                <p class="big-heading">
                    Create account
                </p>
                <div class="social-media-platform">
                    <a href="#"><i class="bx bx-sm bx bxl-facebook"></i></a>
                    <a href="#"><i class="bx bx-sm bx bxl-twitter"></i></a>
                    <a href="#"><i class="bx bx-sm bx bxl-github"></i></a>
                </div>
                <div>
                    <span style="color: red">${err}</span>
                </div>
                <div class="signup-form-content">
                    <div class="stage1-content">
                        <div class="button-container">
                            <div class="text-fields fname">
                                <label for="uname"><i class="bx bx-user"></i></label>
                                <input type="text" name="username" id="uname" placeholder="Enter username" value="${username}" required>
                            </div>
                            <div class="text-fields mail">
                                <label for="mail"><i class="bx bx-envelope"></i></label>
                                <input type="mail" name="phone" id="mail" placeholder="Enter your email" value="${email}" required>
                            </div>
                        </div>
                        <div class="button-container">
                            <div class="text-fields password">
                                <label for="password"><i class="bx bx-lock-alt"></i></label>
                                <input type="password" name="password" id="password" placeholder="Enter password" value="${password}" required>
                            </div>
                            <div class="text-fields confirmpassword">
                                <label for="confirmpassword"><i class="bx bx-lock-alt"></i></label>
                                <input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm password" value="${confirmPassword}" required>
                            </div>
                        </div>
                        <div class="button-container">
                            <div class="gender-selection" style="width: 50%;">
                                <p class="field-heading">
                                    Gender:
                                </p>
                                <label for="male">
                                    <input type="radio" name="gender" id="male" ${gender eq 'Male' ? 'checked' : ''} value="Male"> Male
                                </label>
                                <label for="female">
                                    <input type="radio" name="gender" id="female" ${gender ne 'Male' ? 'checked' : ''} value="Female">Female
                                </label>
                            </div>
                        </div>
                        <div class="tc-container">
                            <label for="tc" class="tc">
                                <input type="checkbox" name="tc" id="tc" required>
                                By submiting your details, you agree to the <a href="#">terms and conditions.</a>
                            </label>
                        </div>
                        <div class="pagination-btns">
                            <input type="submit" value="Sign up" class="nextPage stagebtn1b" >
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</html>
