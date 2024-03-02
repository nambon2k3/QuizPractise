/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.QuestionDAO;
import dao.QuestionOptionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.QuestionOption;

/**
 *
 * @author Admin
 */
@WebServlet(name="QuestionOptrionManagement", urlPatterns={"/manageoption"})
public class QuestionOptrionManagementController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        QuestionDAO questionDAO = new QuestionDAO();
        String testId = request.getParameter("tid");
        int questionAddedId = questionDAO.getQuestionId();
        String optA = request.getParameter("optA");
        String optB = request.getParameter("optB");
        String optC = request.getParameter("optC");
        String optD = request.getParameter("optD");
        String optCorrect = request.getParameter("correct");
        QuestionOption optionA = new QuestionOption(0, questionAddedId, "A", optA, optCorrect.equals("A"));
        QuestionOption optionB = new QuestionOption(0, questionAddedId, "B", optB, optCorrect.equals("B"));
        QuestionOption optionC = new QuestionOption(0, questionAddedId, "C", optC, optCorrect.equals("C"));
        QuestionOption optionD = new QuestionOption(0, questionAddedId, "D", optD, optCorrect.equals("D"));
        
        QuestionOptionDAO questionOptionDAO = new QuestionOptionDAO();
        boolean success = questionOptionDAO.createQuestionOption(optionA);
        success = questionOptionDAO.createQuestionOption(optionB) && success;
        success = questionOptionDAO.createQuestionOption(optionC) && success;
        success = questionOptionDAO.createQuestionOption(optionD) && success;
        
        if (success) {
            response.sendRedirect("viewtestquestion?success&tid=" + testId);
        } else {
            response.sendRedirect("viewtestquestion?fail&tid=" + testId);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
