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


        <form id="test-form" action="submittest">
            <div style="display: flex; justify-content: center; flex: 1; margin-top: 50px;">
                <div class="question-container" id="question-container" style="width: 70%;">
                    <!-- Example question and options (modify as needed) -->
                    <c:set value="1" var="index"/>
                    <input type="hidden" name="tid" value="${tid}">
                    <c:forEach items="${list}" var="q">
                        <div class="question" id="question">
                            <div class="d-flex" style="justify-content: space-between">
                                <p>${q.questionText}</p>
                                <p>${q.points} Ponits</p>
                            </div>
                            <input class="answer" type="hidden" name="${q.questionID}" value="E">
                            <div class="options">
                                <c:forEach var="qo" items="${q.getQuestionOption()}">                                
                                    <div class="option" onclick="selectOption(this, ${index})">${qo.optionName}. ${qo.optionText}</div>
                                </c:forEach>
                            </div>
                            <c:set value="${index + 1}" var="index"/>
                        </div>
                    </c:forEach>



                    <!-- Add more questions as needed -->
                </div>
                <div style="width: 20%;">
                    <div class="question" id="question">
                        <span style="display: flex; justify-content: space-between;">
                            Time: <span class="timer" id="timer" style="color: black">${t.duration}:00</span>
                        </span>

                        <div>
                            <c:forEach var="i" begin="1" end="${list.size()}">
                                <p class="index" style="border: 1px solid black; padding: 8px; border-radius: 5px; margin-right: 5px; display: inline-block;">${i}</p>
                            </c:forEach>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" >Submit Test</button>
                </div>
            </div>
        </form>




        <footer>
            <p>&copy; 2024 Test Page</p>
        </footer>

        <script>
            // JavaScript for handling timer countdown
            let timerValue = ${t.duration} * 60; // 30 minutes in seconds
            let timerElement = document.getElementById('timer');
            let timerInterval = setInterval(updateTimer, 1000);

            function updateTimer() {
                let minutes = Math.floor(timerValue / 60);
                let seconds = timerValue % 60;
                timerElement.textContent = minutes + `:` + (seconds < 10 ? '0' : '') + seconds;

                if (timerValue <= 0) {
                    clearInterval(timerInterval);
                    alert('Time is up! Submit your test.');
                    submitTest();
                }

                timerValue--;
            }

            function selectOption(option, index) {
                let selectedOption = option;
                let selectedQuestion = selectedOption.closest('.question');
                let options = selectedQuestion.querySelectorAll('.option');
                let answers = selectedQuestion.querySelectorAll('.answer');
                let indexes = document.getElementsByClassName('index');
                indexes[index - 1].classList.add('selected');

                // Clear previous selections for this question
                options.forEach(opt => opt.classList.remove('selected'));
                answers[0].value = selectedOption.innerHTML.split(".")[0].toString();
                // Mark the selected option
                selectedOption.classList.add('selected');
            }

            function submitTest() {
                document.getElementById('test-form').submit();
            }
        </script>
    </body>
</html>

