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
import java.util.List;
import model.Tests;

/**
 *
 * @author Admin
 */
@WebServlet(name="HomeController", urlPatterns={"/home"})
public class HomeController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        
        TestDAO testDAO = new TestDAO();
        
        String indexPage = request.getParameter("index");
        String startDate = request.getParameter("startDate");
        String searchContent = request.getParameter("searchContent");
        String duration = request.getParameter("duration");
        //Check for null value of indexPage
        if (indexPage == null) {
            indexPage = 1 + "";
        }
        int index = Integer.parseInt(indexPage);
        
        //Check for null value of startDate
        if (startDate == null) {
            startDate = "";
        }
        
        //Check for null value of searchContent
        if (searchContent == null) {
            searchContent = "";
        }
        
        //Check for null value of searchContent
        if (duration == null) {
            duration = "0";
        }
        
        //Get total test
        int totalTest = testDAO.countNumberTest(searchContent, duration, startDate, index);
        //Find the index of last page
        int endPage = totalTest / 18;
        //Increase 1 page
        if (totalTest % 18 != 0) {
            endPage++;
        }
        List<Tests> listTest = testDAO.getPagingTests(searchContent, duration, startDate, index);
        
        
        //Set data attribute
        request.setAttribute("startDate", startDate);
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("duration", duration);
        request.setAttribute("index", index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listTest", listTest);
        request.setAttribute("msg", request.getParameter("msg"));
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
