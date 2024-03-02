/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tests;

/**
 *
 * @author Admin
 */
@WebServlet(name = "TestManagementController", urlPatterns = {"/managetest"})
public class TestManagementController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Instantiate DAO for accessing rooms
        TestDAO testDAO = new TestDAO();

        // Check if an action parameter is present in the request
        String action = request.getParameter("action");

        // Perform actions based on the provided action parameter
        switch (action) {
            case "add":
                addTest(request, response, testDAO);
                break;
            case "update":
                updateTest(request, response, testDAO);
                break;
            default:
                // Handle unknown actions
                break;
        }

    }

    private void addTest(HttpServletRequest request, HttpServletResponse response, TestDAO testDAO) throws IOException {
        // Retrieve room details from the request
        String testName = request.getParameter("testName");
        String startTime = request.getParameter("startTime");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String description = request.getParameter("description");
        Tests newTest = new Tests(1, testName, null, duration, description);
        // Perform the room addition
        boolean success = testDAO.createTest(newTest, startTime);
        // Redirect to the room list with a success or failure parameter
        if (success) {
            response.sendRedirect("admin?success");
        } else {
            response.sendRedirect("admin?fail");
        }
    }

    private void updateTest(HttpServletRequest request, HttpServletResponse response, TestDAO testDAO) throws IOException {
        // Retrieve test details from the request
        int testId = Integer.parseInt(request.getParameter("testId"));
        String testName = request.getParameter("testName");
        String startTime = request.getParameter("startTime");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));
        Tests newTest = new Tests(testId, testName, null, duration, description);
        newTest.setStatus(status);
        // Perform the room addition
        boolean success = testDAO.updateTest(newTest, startTime);
        // Redirect to the room list with a success or failure parameter
        if (success) {
            response.sendRedirect("admin?success");
        } else {
            response.sendRedirect("admin?fail");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
