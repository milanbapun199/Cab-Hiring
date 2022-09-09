/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cabhiering.servlets;

import com.cabhiering.dao.AdminDao;
import com.cabhiering.dao.TravellerDao;
import com.cabhiering.entities.Driver;
import com.cabhiering.entities.Rate;
import com.cabhiering.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class AssignDriver extends HttpServlet {

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
            out.println("<title>Servlet AssignDriver</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String travelId=request.getParameter("travelId");
            String travellerId=request.getParameter("travellerId");
            String source=request.getParameter("source");
            String destination=request.getParameter("destination");
            String driverId=request.getParameter("driverId");
          
            
            Driver driver=new Driver();
            driver.setDtravelid(travelId);
            driver.setdId(driverId);
            
            int r=new AdminDao(ConnectionProvider.getConnection()).insertAssignDriver(driver);
            if(r==1)
            {
                
                request.setAttribute("source", source);
                request.setAttribute("travelId", travelId);
                request.setAttribute("travellerId", travellerId);
                request.setAttribute("destination", destination);
                request.setAttribute("driverId", driverId);
              Rate rate=new Rate();
            rate.setSource(source);
            rate.setDestination(destination);
            
            
            double fare=new TravellerDao(ConnectionProvider.getConnection()).getFare(rate.getSource(), rate.getDestination());
            
            request.setAttribute("fare", fare);
         
                RequestDispatcher dispatcher=request.getRequestDispatcher("MailService");
                dispatcher.forward(request, response);
            }
            
            
            
            
            
            
           
            
            
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
