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
            <h1>${t.testName}</h1>
        </header>


        <div class="question-container" id="question-container">
            <!-- Example question and options (modify as needed) -->
            <c:set value="1" var="index"/>
            <input type="hidden" name="tid" value="${tid}">
            <c:forEach items="${list}" var="q">
                <div class="question" id="question">
                    <p>${q.questionText}</p>
                    <input class="answer" type="hidden" name="${q.questionID}" value="E">
                    <div class="options">
                        <c:forEach var="qo" items="${q.getQuestionOption()}">                                
                            <div class="option" onclick="selectOption(this, ${index})">${qo.optionName}. ${qo.optionText}</div>
                        </c:forEach>
                    </div>
                    <c:set value="${index + 1}" var="index"/>
                </div>
            </c:forEach>
        </div>





        <footer>
            <p>&copy; 2024 Test Page</p>
        </footer>
    </body>
</html>

