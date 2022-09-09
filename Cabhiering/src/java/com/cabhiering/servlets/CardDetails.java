/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cabhiering.servlets;

import com.cabhiering.dao.TravellerDao;
import com.cabhiering.entities.PaymentInfo;
import com.cabhiering.entities.Rate;
import com.cabhiering.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class CardDetails extends HttpServlet {

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
            out.println("<title>Servlet CardDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            
            String tid = request.getParameter("tid");
//		String driverid = request.getParameter("driverid");
		
		String cardno=request.getParameter("cardno");
		String pin=request.getParameter("pin");
		String expmonth=request.getParameter("expmonth");
		String expyear=request.getParameter("expyear");
		String cardholdername=request.getParameter("cardholdername");
		double amount=Double.parseDouble(request.getParameter("amount"));
//                out.println(amount);

                Rate r=new Rate();
                
                
                r.setCardNumber(cardno);
		r.setPin(pin);
		r.setExpMonth(expmonth);
		r.setExpYear(expyear);
		r.setCardHolderName(cardholdername);
                
                TravellerDao dao=new TravellerDao(ConnectionProvider.getConnection());
                int bal=dao.insertTravellerCardDetails(cardno, pin, expmonth, expyear);
                response.sendRedirect("paymentsuccess.jsp");
                
                if(bal==-1)
                {
                    out.println("invalid card details");
                }
                else if(bal != -2)
                {
                    if(amount > bal)
                    {
                        out.println("insufficient balance");
                    }
                    else
                    {
                        double netBalance=bal-amount;
                        r.setBalance(netBalance);
                         
                        
                        
                        int i=dao.updateBalance(cardno, String.valueOf(netBalance));
                         
                        if(i !=0)
                        {
                            
                            PaymentInfo info=new PaymentInfo();
                            info.setTravelId(tid);
                            info.setpStatus("paid");
                            int updatePaymentInfo=dao.updatePaymentInfo(info);
                        }
                    }
                    
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
