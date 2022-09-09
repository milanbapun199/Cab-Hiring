/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cabhiering.servlets;

import com.cabhiering.dao.DriverDao;
import com.cabhiering.entities.Driver;
import com.cabhiering.entities.MessageForInvalid;
import com.cabhiering.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */

@MultipartConfig
public class DriverRegistrationServlet extends HttpServlet {

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
            
        
            String check=request.getParameter("driver_check");
            
            if(check == null)
            {
                out.println("You have not cheked term and conditions");
            }
            else
            {
                String driverName=request.getParameter("driver_name");
                String driverEmail=request.getParameter("driver_email");
                String driverMob=request.getParameter("driver_number");
                String driverPassword=request.getParameter("driver_password");
                
                
                //create driver object set all data to that object
                
                Driver driver=new Driver(driverName, driverEmail, driverMob, driverPassword);
                
                //create driverdao object
                DriverDao  driverDao= new DriverDao(ConnectionProvider.getConnection());
                if(driverDao.insertDriver(driver))
                {
                    
                   request.setAttribute("driverEmail", driverEmail);
                    RequestDispatcher dispatcher=request.getRequestDispatcher("cardetails.jsp");
                    dispatcher.forward(request, response);
                    
                }
                else
                {
                   MessageForInvalid mfi=new MessageForInvalid();
                 mfi.setContent("driver already exist please try with another emailId");
                 mfi.setType("error");
                 HttpSession hs=request.getSession();
                 hs.setAttribute("message", mfi);
                 
                 
                 response.sendRedirect("traveller_registration.jsp");
                }
                
            }
            
            
            
            
            
            
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
