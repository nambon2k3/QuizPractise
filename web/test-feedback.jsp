<%-- 
    Document   : test
    Created on : Mar 2, 2024, 12:36:39 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Test Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                height: 100vh;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                justify-content: space-between
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
                width: 100%;
            }

            .timer {
                text-align: right;
                font-size: 18px;
                margin-bottom: 10px;
                color: #333;
            }

            .question-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100%;
            }

            .question {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                width: 80%;
                max-width: 600px;
                margin-bottom: 20px;
            }

            .options {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }

            .option {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            .option.selected, .index.selected {
                background-color: #3498db; /* Blue color for selected options */
                color: #fff;
            }

            .submit-btn {
                background-color: #2ecc71;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            footer {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Test Feedback</h1>
        </header>


        <div class="question-container" id="question-container">
            <!-- Example question and options (modify as needed) -->
            <c:forEach items="${list}" var="q">
                <div class="question" id="question">
                    <div class="d-flex" style="justify-content: space-between">
                                <p>${q.questionText}</p>
                                <p>${q.points} Ponits</p>
                            </div>
                    <div class="options">

                        <c:forEach var="qo" items="${q.getQuestionOption()}">
                            <c:set value="${null}" var="tmp"/>
                            <c:forEach items="${listAnswer}" var="a">
                                <c:if test="${a.questionID == q.questionID}">
                                    <c:set value="${a}" var="tmp"/>
                                </c:if> 
                            </c:forEach>
                            
                            <c:if test="${tmp!= null && tmp.questionID == q.questionID && String.valueOf(tmp.userAnswer) == qo.optionName}">
                                <div class="option" ${qo.isCorrect() ? 'style="background-color: #34ce57;"' : 'style="background-color: red;"'}>${qo.optionName}. ${qo.optionText}</div>
                            </c:if> 
                            <c:if test="${tmp == null || (tmp.questionID == q.questionID && String.valueOf(tmp.userAnswer) != qo.optionName)}">
                                <div class="option">${qo.optionName}. ${qo.optionText}</div>
                            </c:if> 

                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
            <a href="usertest"  class="btn btn-primary">Go back</a>
        </div>





        <footer>
            <p>&copy; 2024 Test Page</p>
        </footer>
    </body>
</html>

