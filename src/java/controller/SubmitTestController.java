/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.QuestionDAO;
import dao.ResultDAO;
import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Answers;
import model.Questions;
import model.Result;
import model.Tests;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SubmitTestController", urlPatterns = {"/submittest"})
public class SubmitTestController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitTestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitTestController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Users user = (Users) request.getSession().getAttribute("User");
        int tid = Integer.parseInt(request.getParameter("tid"));
        List<Questions> listQuestion = new QuestionDAO().getAllQuestionsForTest(tid);
                
        AnswerDAO answerDAO = new AnswerDAO();
        
        int total = 0;
        
        for (Questions questions : listQuestion) {
            String answer = request.getParameter(questions.getQuestionID() + "");
            Answers answers = new Answers(0, user.getUserID(), tid, questions.getQuestionID(), answer.charAt(0));
            answerDAO.getUserSubmitAnswer(user.getUserID(), questions.getQuestionID(), answers);
            if(answerDAO.checkCorrectAnswer(questions.getQuestionID(), answer)) {
                total += questions.getPoints();
            }
        }
        System.out.println(total);
        Result result = new Result(0, user.getUserID(), tid, total);
        if (!new ResultDAO().checkExistedResult(user.getUserName(), tid)) {
            new ResultDAO().createResult(result);
        } else {
            new ResultDAO().updateResult(result);
        }
        response.sendRedirect("usertest");

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
