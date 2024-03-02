<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Room Management</title>
        <!-- Add Bootstrap CSS link -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Add DataTables CSS link -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

        <style>
            * {
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="container profile-container">
            <h1 class="text-center mb-4 mt-5">Question Management</h1>

            <c:if test="${param.success ne null}">
                <div class="alert alert-success" role="alert">
                    Update success!
                </div>
            </c:if>
            <c:if test="${param.fail ne null}">
                <div class="alert alert-danger" role="alert">
                    Update fail!
                </div>
            </c:if>

            <div class="w-100 text-right">
                <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addRoomModal">Add Question</button>
            </div>

            <table id="roomTable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Question ID</th>
                        <th>Test Name</th>
                        <th>Question Text</th>
                        <th>Points</th>
                        <th style="width: 200px" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${list}">
                        <tr>
                            <td>${q.questionID}</td>
                            <td>${q.getTestName()}</td>
                            <td>${q.questionText}</td>
                            <td>${q.points}</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#roomEditModal${q.questionID}">
                                    Edit
                                </button>
                            </td>
                        </tr>

                        <!-- Room Edit Modal -->
                    <div class="modal fade" id="roomEditModal${q.questionID}" tabindex="-1" role="dialog" aria-labelledby="roomEditModalLabel${q.questionID}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="roomEditModalLabel${q.questionID}">Edit Question</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form for editing room details -->
                                    <form action="managequestion?action=update" method="post">
                                        <input type="hidden" name="qid" value="${q.questionID}">
                                        <input type="hidden" name="tid" value="${tid}">
                                        <div class="form-group">
                                            <label for="name">Question Text: </label>
                                            <input type="text" class="form-control" name="questionText" value="${q.questionText}" required>
                                        </div>

                                        <c:forEach var="qo" items="${q.getQuestionOption()}">
                                            <div class="form-group">
                                                <label for="option${qo.optionName}">${qo.optionName}:</label>
                                                <input type="text" class="form-control" id="option${qo.optionName}" name="opt${qo.optionName}" value="${qo.optionText}" required>
                                                <input type="radio" name="correct" ${qo.isCorrect() ? 'checked' : ''} value="${qo.optionName}"> <span >Correct answer</span>
                                            </div>
                                        </c:forEach>


                                        <div class="form-group">
                                            <label for="size">Points:  </label>
                                            <input type="number" class="form-control" name="points" value="${q.points}" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Room Edit Modal -->

                </c:forEach>
                </tbody>
            </table>

        </div>

        <!-- Add Room Modal -->
        <div class="modal fade" id="addRoomModal" tabindex="-1" role="dialog" aria-labelledby="addRoomModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addRoomModalLabel">Add Question</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form for adding new room -->
                        <form action="managequestion?action=add" method="post">
                            <input type="hidden" name="tid" value="${tid}">
                            <div class="form-group">
                                <label for="name">Question Text: </label>
                                <input type="text" class="form-control" name="questionText" required>
                            </div>
                            <div class="form-group">
                                <label for="optionA">A:</label>
                                <input type="text" class="form-control" id="optionA" name="optA" required>
                                <input type="radio" name="correct" checked value="A"> <span >Correct answer</span>
                            </div>
                            <div class="form-group">
                                <label for="optionB">B:</label>
                                <input type="text" class="form-control" id="optionB" name="optB" required>
                                <input type="radio" name="correct"  value="B"> <span >Correct answer</span>
                            </div>
                            <div class="form-group">
                                <label for="optionC">C:</label>
                                <input type="text" class="form-control" id="optionC" name="optC" required>
                                <input type="radio" name="correct"  value="C"> <span >Correct answer</span>
                            </div>
                            <div class="form-group">
                                <label for="optionD">D:</label>
                                <input type="text" class="form-control" id="optionD" name="optD" required>
                                <input type="radio" name="correct"  value="D"> <span >Correct answer</span>
                            </div>
                            <div class="form-group">
                                <label for="size">Points:  </label>
                                <input type="number" class="form-control" name="points" value="${q.points}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Question</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-center py-3 mt-9" style="margin-top: 300px; background-color: #696cff; color: white">
            <p>&copy; 2024 Online Test. All rights reserved.</p>
        </footer>

        <!-- Include Bootstrap JS, Popper.js, and DataTables JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#roomTable').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
            });
        </script>

    </body>
</html>
