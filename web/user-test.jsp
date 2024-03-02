<%-- 
    Document   : user-test
    Created on : Mar 1, 2024, 7:48:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Test Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            section {
                margin: 20px;
            }

            .test-container {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }

            .test-card {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                margin: 10px;
                padding: 15px;
                width: 300px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

            .test-card:hover {
                transform: scale(1.05);
            }

            footer {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/sidebar.js"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            <div class="header_img"> <img src="https://i.imgur.com/hczKIze.jpg" alt=""> </div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div>
                    <div class="nav_list">
                        <a href="#" class="nav_link">
                            <i class='bx bx-user nav_icon'></i>
                            <span class="nav_name">Users Test</span>
                        </a>
                        <a href="home" class="nav_link">
                            <i class='bx bx-home-alt nav_icon'></i>
                            <span class="nav_name">Home</span>
                        </a>
                    </div>
                </div>
                <a href="login" class="nav_link">
                    <i class='bx bx-log-out nav_icon'></i>
                    <span class="nav_name">SignOut</span>
                </a>
            </nav>
        </div>
        <!--Container Main start-->
        <div class="height-100 bg-light">
            <section>
                <h2>Registered Tests</h2>
                <div class="test-container">
                    <c:if test="${registerTestList == null || registerTestList.size() eq 0}">
                        <div class="col-lg-12 text-center" style="font-size: 2.0rem; padding: 50px 0; color: #84848d">
                            <p>Now tests were registered! Come to home and try now!</p>
                        </div>
                    </c:if>
                    <!-- Example test card, you can repeat this structure for each registered test -->
                    <c:forEach items="${registerTestList}" var="t">
                        <div class="test-card">
                            <p>${t.testName}</p>
                            <p>
                                <i class='bx bx-time'></i>
                                ${t.startTime.toString().replace('T', ' ')}:00</p></p>
                            <p>
                                <i class='bx bx-book-open'></i>
                                ${t.getNumberQuestion()} Questions
                            </p>
                            <p>
                                <i class='bx bxs-trophy'></i>
                                ${t.getTotalPoint()} Points
                            </p>
                            <p>Status: Registered</p>
                            <c:if test="${t.isIsStarted() && !t.checkEnded()}">
                                <a href="dotest?tid=${t.testID}"  class="btn btn-primary">Start Test</a>
                            </c:if>
                            <c:if test="${!t.isIsStarted()}">
                                <a  class="btn btn-primary">Not Started</a>
                            </c:if>    
                        </div>
                    </c:forEach>

                    <!-- Repeat for other registered tests -->
                </div>
            </section>

            <section>
                <h2>Completed Tests</h2>
                <div class="test-container">
                    <c:if test="${completedTestList == null || completedTestList.size() eq 0}">
                        <div class="col-lg-12 text-center" style="font-size: 2.0rem; padding: 50px 0; color: #84848d">
                            <p>Now tests were completed! Try to join our test!</p>
                        </div>
                    </c:if>
                    <c:forEach items="${completedTestList}" var="t">
                        <div class="test-card">
                            <p>${t.testName}</p>
                            <p>
                                <i class='bx bx-time'></i>
                                ${t.startTime.toString().replace('T', ' ')}:00</p>
                            <p>
                                <i class='bx bx-book-open'></i>
                                ${t.getNumberQuestion()} Questions
                            </p>
                            <p>
                                <i class='bx bxs-trophy'></i>
                                ${t.getTestScore(sessionScope.User.userID)} / ${t.getTotalPoint()} Points
                            </p>
                            <p>Status: Completed</p>
                            <a href="testfeedback?tid=${t.testID}"  class="btn btn-primary">View feedback</a>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="hhttps://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <footer class="text-center py-3 mt-9" style="padding-top: 50px; background-color: #696cff; color: white">
            <p>&copy; 2024 Online Test. All rights reserved.</p>
        </footer>
    </body>
</html>

