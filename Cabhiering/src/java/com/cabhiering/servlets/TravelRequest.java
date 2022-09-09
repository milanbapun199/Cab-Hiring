/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cabhiering.servlets;

import com.cabhiering.dao.TravellerDao;
import com.cabhiering.entities.MessageForInvalid;
import com.cabhiering.entities.TravellingRequest;
import com.cabhiering.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class TravelRequest extends HttpServlet {

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
            out.println("<title>Servlet TravelRequest</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession hs=request.getSession();
            String travellerId=(String) hs.getAttribute("travellerId");
            String source=request.getParameter("source");
            String destination=request.getParameter("destination");
            String date=request.getParameter("traveller_date");
            String time=request.getParameter("traveller_time");
             if(destination.equals(source))
            {
                 MessageForInvalid mfi=new MessageForInvalid();
                 mfi.setContent("Source and Destination can not be same....");
                 mfi.setType("error");
                 HttpSession hs1=request.getSession();
                 hs1.setAttribute("message", mfi);
                 
                 
                 response.sendRedirect("SourceDestination");
                
                
               
            } else
             {
            TravellingRequest travellingRequest=new TravellingRequest();
            travellingRequest.setTravellerId(travellerId);
            travellingRequest.setSourceAddress(source);
            travellingRequest.setDestinationAddress(destination);
            travellingRequest.setDate(date);
            travellingRequest.setTime(time);
            
            TravellerDao dao=new TravellerDao(ConnectionProvider.getConnection());
            out.println("<h1>"+dao.travellerRequestInsert(travellingRequest)+"</h1>");
            request.setAttribute("travelId", dao.retriveTravelId(travellingRequest));
            RequestDispatcher dispatcher=request.getRequestDispatcher("enteredtravelid.jsp");
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
