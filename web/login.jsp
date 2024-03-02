<%-- 
    Document   : login
    Created on : Feb 28, 2024, 12:14:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/stylelogin.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .gender-selection label{
                width: 45%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-link">
                <div class="logo">
                    <i class="bx bx-pencil"></i>
                    <span class="text">Online Testing</span>
                </div>
                <p class="side-big-heading">Create your account?</p>
                <p class="primary-bg-text">To keep track on your dashboard please login with your
                    personal infor</p>
                <a href="signup" class="loginbtn">Register now</a>

            </div>
            <form action="login" class="signup-form-container" method="post">
                <p class="big-heading">Login to your account</p>
                <div class="social-media-platform">
                    <a href="#"><i class="bx bx-sm bx bxl-facebook"></i></a>
                    <a href="#"><i class="bx bx-sm bx bxl-twitter"></i></a>
                    <a href="#"><i class="bx bx-sm bx bxl-github"></i></a>
                </div>

                <div>
                    <span style="color: #34ce57">${msg}</span>
                    <span style="color: red">${err}</span>
                </div>

                <div class="login-form-contents">
                    <div class="text-fields mail">
                        <label for="username"><i class="bx bx-user"></i></label>
                        <input type="text" name="username" id="username" placeholder="Enter username" value="${username == null ? cookie.username.value : username}">
                    </div>
                    <div class="text-fields password">
                        <label for="password"><i class="bx bx-lock-alt"></i></label>
                        <input type="password" name="password" id="password" placeholder="Enter password" value="${password == null ? cookie.password.value : password}">
                    </div>
                    <div class="button-container" style="justify-content: left; width: 80%; margin: 0; padding: 0; margin-bottom: 20px;">
                        <div class="gender-selection" style="display: flex; justify-content: space-between; align-items: center;">
                            <label for="male">
                                <input style="margin-right: 20px; width: 20px;" type="checkbox" name="remember" id="remember" ${cookie.remember != null ? 'checked' : ''}> 
                                <p>Remember me</p>
                            </label>
                            <label for="male" style="justify-content: end;">
                                <a href="#" style="margin-right: 45px;">Forgot password</a>
                            </label>
                        </div>
                    </div>
                </div>
                <input type="submit" value="Login" style="margin-left: 1%;" class="nextPage">
            </form>
        </div>
    </body>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</html>
