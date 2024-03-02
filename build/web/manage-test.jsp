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

        <%@ include file="header.jsp"%>

        <div class="container profile-container">
            <h1 class="text-center mb-4 mt-5">Test Management</h1>

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
                <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addRoomModal">Add Test</button>
            </div>

            <table id="roomTable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Test ID</th>
                        <th>Test Name</th>
                        <th>Start Time</th>
                        <th>Duration</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th style="width: 200px" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="test" items="${listTest}">
                        <tr>
                            <td>${test.testID}</td>
                            <td>${test.testName}</td>
                            <td style="width: 150px">${test.startTime.toString().replace('T', ' ')}:00</td>
                            <td>${test.duration}</td>
                            <td>${test.description}</td>
                            <td>${test.status}</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#roomEditModal${test.testID}">
                                    Edit
                                </button>
                                <a class="btn btn-secondary" href="viewtestquestion?tid=${test.testID}">View detail</a>
                            </td>
                        </tr>

                        <!-- Room Edit Modal -->
                    <div class="modal fade" id="roomEditModal${test.testID}" tabindex="-1" role="dialog" aria-labelledby="roomEditModalLabel${test.testID}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="roomEditModalLabel${test.testID}">Edit Test</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form for editing room details -->
                                    <form action="managetest?action=update" method="post">
                                        <input type="hidden" name="testId" value="${test.testID}">
                                        <div class="form-group">
                                            <label for="name">Test Name: </label>
                                            <input type="text" class="form-control" name="testName" value="${test.testName}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="price">Start Time: </label>
                                            <input type="datetime" class="form-control" name="startTime" value="${test.startTime.toString().replace('T', ' ')}:00" pattern="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}[.0]?$" title=" must match yyyy-MM-dd hh:mm:ss" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="size">Duration: </label>
                                            <input type="number" class="form-control" name="duration" value="${test.duration}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="capacity">Description: </label>
                                            <input type="text" class="form-control" name="description" value="${test.description}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="img">Status: </label>
                                            <select id="img" name="status" class="form-control">
                                                <option value="1" ${test.status == 1 ? 'selected' : ''}>Public</option>
                                                <option value="0" ${test.status == 0 ? 'selected' : ''}>Save Draft</option>
                                            </select>
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
                        <h5 class="modal-title" id="addRoomModalLabel">Add Test</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form for adding new room -->
                        <form action="managetest?action=add" method="post">
                            <div class="form-group">
                                <label for="name">Test Name: </label>
                                <input type="text" class="form-control" name="testName" value="${test.testName}" required>
                            </div>

                            <div class="form-group">
                                <label for="price">Start Time: </label>
                                <input type="datetime" class="form-control" name="startTime" value="${test.startTime}" required placeholder="yyyy-MM-dd hh:mm:ss">
                            </div>

                            <div class="form-group">
                                <label for="size">Duration: </label>
                                <input type="number" class="form-control" name="duration" value="${test.duration}" required>
                            </div>

                            <div class="form-group">
                                <label for="capacity">Description: </label>
                                <input type="text" class="form-control" name="description" value="${test.description}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Test</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-center py-3 mt-9" style="margin-top: 50px; background-color: #696cff; color: white">
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
