/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionDAO;
import dao.QuestionOptionDAO;
import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.QuestionOption;
import model.Questions;

/**
 *
 * @author Admin
 */
@WebServlet(name = "QuestionManagementController", urlPatterns = {"/managequestion"})
public class QuestionManagementController extends HttpServlet {

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
        QuestionDAO questionDAO = new QuestionDAO();

        // Check if an action parameter is present in the request
        String action = request.getParameter("action");

        // Perform actions based on the provided action parameter
        switch (action) {
            case "add":
                addQuestion(request, response, questionDAO);
                break;
            case "update":
                updateQuestion(request, response, questionDAO);
                break;
            default:
                // Handle unknown actions
                break;
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

    private void addQuestion(HttpServletRequest request, HttpServletResponse response, QuestionDAO questionDAO) throws IOException, ServletException {
        // Retrieve question details from the request
        String questionText = request.getParameter("questionText");
        //int testId = Integer.parseInt(request.getParameter("tid"));
        String testId = request.getParameter("tid");
        String optA = request.getParameter("optA");
        String optB = request.getParameter("optB");
        String optC = request.getParameter("optC");
        String optD = request.getParameter("optD");
        String optCorrect = request.getParameter("correct");
        String points = request.getParameter("points");

        //System.out.println(questionText + " - " + testId + " - " + optA + " " + optB + " " + optC + " " + optD + " " + optCorrect + " " + points);
        Questions questions = new Questions(0, Integer.parseInt(request.getParameter("tid")), questionText, Integer.parseInt(points));

        int questionAddedId = questionDAO.getQuestionId() + 1;

        boolean success = questionDAO.createQuestion(questions);
        if (success) {
            request.setAttribute("tid", testId);
            request.setAttribute("optA", optA);
            request.setAttribute("optB", optB);
            request.setAttribute("optC", optC);
            request.setAttribute("optD", optD);
            request.setAttribute("correct", optCorrect);
            request.setAttribute("questionAddedId", questionAddedId);
            request.getRequestDispatcher("manageoption").forward(request, response);
        } else {
            response.sendRedirect("viewtestquestion?fail&tid=" + testId);
        }
    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response, QuestionDAO questionDAO) throws IOException {
        // Retrieve question details from the request
        int questionId = Integer.parseInt(request.getParameter("qid"));
        int testId = Integer.parseInt(request.getParameter("tid"));
        String questionText = request.getParameter("questionText");
        String optA = request.getParameter("optA");
        String optB = request.getParameter("optB");
        String optC = request.getParameter("optC");
        String optD = request.getParameter("optD");
        String optCorrect = request.getParameter("correct");
        int points = Integer.parseInt(request.getParameter("points"));

        Questions questions = new Questions(questionId, testId, questionText, points);

        QuestionOption optionA = new QuestionOption(0, questionId, "A", optA, optCorrect.equals("A"));
        QuestionOption optionB = new QuestionOption(0, questionId, "B", optB, optCorrect.equals("B"));
        QuestionOption optionC = new QuestionOption(0, questionId, "C", optC, optCorrect.equals("C"));
        QuestionOption optionD = new QuestionOption(0, questionId, "D", optD, optCorrect.equals("D"));

        QuestionOptionDAO questionOptionDAO = new QuestionOptionDAO();
        questionOptionDAO.updateQuestionOption(optionA);
        questionOptionDAO.updateQuestionOption(optionB);
        questionOptionDAO.updateQuestionOption(optionC);
        questionOptionDAO.updateQuestionOption(optionD);

        boolean success = questionDAO.updateQuestion(questions);

        if (success) {
            response.sendRedirect("viewtestquestion?success&tid=" + testId);
        } else {
            response.sendRedirect("viewtestquestion?fail&tid=" + testId);
        }
    }

}
