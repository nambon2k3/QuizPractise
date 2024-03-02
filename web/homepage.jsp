<%-- 
    Document   : homepage
    Created on : Feb 28, 2024, 12:14:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Testing Website</title>
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
                        <a href="usertest" class="nav_link">
                            <i class='bx bx-user nav_icon'></i>
                            <span class="nav_name">User Test</span>
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
            <div class="row">
                <div class="banner col-lg-12">
                    <img style="width: 100%; height: 400px; object-fit: cover;"
                         src="https://static.wixstatic.com/media/17aa8a_8b30385a628245f292700dc8d734edd6~mv2.png/v1/fill/w_1200,h_640,al_c,q_90/file.jpg"
                         alt="">
                </div>

                <div class="container">
                    <div class="filter-container">
                        <div class="container mt-4 ">
                            <form action="#" style="margin-left: 120px;">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="duration">Duration (Min)</label>
                                        <input type="number" class="form-control" id="duration" placeholder="eg: 50, 60 ... (mins)" name="duration" value="${duration}">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="startDate">Start Date (From)</label>
                                        <input type="date" class="form-control" id="startDate" name="startDate" value="${startDate}">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="search">Search name:</label>
                                        <input type="text" class="form-control" id="search" name="searchContent" placeholder="eg: Test for Java..." value="${searchContent}">
                                    </div>
                                    <div class="col-md-3">
                                        <div>
                                            <label class="d-block">&nbsp;</label>
                                            <button type="submit" class="btn btn-primary btn-block ">Apply Filters</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card-container">
                        <c:forEach items="${listTest}" var="t">
                            <div href="#" class="card">
                                <div class="card-body">
                                    <h5 class="card-title" style="margin: 0; font-weight: bold">${t.testName}</h5>
                                    <p class="card-text">${t.description}</p>
                                </div>
                                <div style="margin: auto; border: 1px solid; width: 80%; border-radius: 30px; padding: 10px 0">
                                    <h5 style="text-align: left; padding-left: 10%; font-size: 1rem;"><i
                                            class='bx bx-timer'></i> ${t.duration} mins</h5>
                                    <h5 style="text-align: left; padding-left: 10%; font-size: 1rem;"><i class='bx bx-time'></i>
                                        ${t.startTime.toString().replace('T', ' ')}:00</h5>
                                    <h5 style="text-align: left; padding-left: 10%; font-size: 1rem;"><i
                                            class='bx bx-book-open'></i>
                                        ${t.getNumberQuestion()} Questions</h5>
                                    <h5 style="text-align: left; padding-left: 10%; font-size: 1rem;"><i
                                            class='bx bxs-trophy'></i>
                                        ${t.getTotalPoint()} Points</h5>
                                </div>
                                <div>
                                    <c:if test="${t.checkEnded()}">
                                        <a class="btn btn-primary mt-2 mb-2" style="background-color: #84848d; border: 0">Ended</a>
                                    </c:if>
                                    <c:if test="${t.isIsStarted() && !t.checkEnded()}">
                                        <a href="dotest?tid=${t.testID}" class="btn btn-primary mt-2 mb-2">Join now</a>
                                    </c:if>
                                    <c:if test="${!t.isIsStarted() && !t.checkRegistered(sessionScope.User.userName) && !t.checkEnded()}">
                                        <a href="registest?tid=${t.testID}" class="btn btn-primary mt-2 mb-2">Register Me</a>
                                    </c:if>
                                    <c:if test="${t.checkRegistered(sessionScope.User.userName) && !t.isIsStarted() && !t.checkEnded()}">
                                        <a class="btn btn-primary mt-2 mb-2" style="background-color: #84848d; border: 0">Registered</a>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>                        
                    </div>
                    <div class="col-lg-12 d-flex justify-content-center" style="margin: 40px 0">
                        <div class="room-pagination">
                            <c:if test="${index ne 1 && listTest.size() ne 0}">
                                <a href="home?index=${index + 1}&startDate=${startDate}&searchContent=${searchContent}&duration=${duration}ity}">Previous <i class="fa fa-long-arrow-left"></i></a>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.endPage}" var="page">
                                <a href="home?index=${page}&startDate=${startDate}&searchContent=${searchContent}&duration=${duration}" ${page == index ? 'style="background-color: #DFA974; color: white"' : ''}>${page}</a>
                            </c:forEach>
                            <c:if test="${index ne endPage && listTest.size() ne 0}">
                                <a href="home?index=${index + 1}&startDate=${startDate}&searchContent=${searchContent}&duration=${duration}">Next <i class="fa fa-long-arrow-right"></i></a>
                                </c:if>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Footer -->
            <footer class="text-center py-3 mt-9" style="padding-top: 50px; background-color: #696cff; color: white">
                <p>&copy; 2024 Online Test. All rights reserved.</p>
            </footer>
        </div>
        <!--Container Main end-->

        <c:if test="${msg ne null}">
            <script>
                window.alert("Register successfully!");
            </script>
        </c:if>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="hhttps://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
