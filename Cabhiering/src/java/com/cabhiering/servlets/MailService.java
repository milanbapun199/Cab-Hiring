/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cabhiering.servlets;

import com.cabhiering.dao.AdminDao;
import com.cabhiering.entities.PaymentInfo;
import com.cabhiering.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class MailService extends HttpServlet {

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
            out.println("<title>Servlet MailService</title>");            
            out.println("</head>");
            out.println("<body>");
           
            String travellerId=(String) request.getAttribute("travellerId");
            String travelId=(String) request.getAttribute("travelId");
            String destination=(String) request.getAttribute("destination");
            String driverId=(String) request.getAttribute("driverId");
            String source=(String) request.getAttribute("source");
            Double fare=(double) request.getAttribute("fare");
            
            PaymentInfo info=new PaymentInfo();
            
            info.setTravelId(travelId);
            info.setpStatus("UNPAID");
            info.setAmount(fare);
            
            int r=new AdminDao(ConnectionProvider.getConnection()).insertToPaymentInfo(info);
            
            String message="Hello dear this is from cabhiring"
                    + "You have got a journy from "+source+ " to "+destination+ " and cost of this "+fare+ " rupees and your travellId is "+travelId+ " ";
            String from="cabhiringforcab@gmail.com";
            String to=travellerId;
            String subject="Regarding for booking cab";
            
            String host="smtp.gmail.com";
            Properties properties=System.getProperties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.ssl.enable", true);
            properties.put("mail.smtp.auth", true);
            
            //step !;- to get the session object..........
            
            Session session=Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("cabhiringforcab@gmail.com","zwtwbuocxcrvbpmj");
                }
                
                
                
            });
            session.setDebug(true);
            
            
//            step-2: compose the message


            MimeMessage mimeMessage=new MimeMessage(session);
            
            try {
                
                //from email id
                mimeMessage.setFrom(from);
                
                //adding recipient
                mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                
                
                //adding subject message
                mimeMessage.setSubject(subject);
                
                //add text to message
                mimeMessage.setText(message);
                
                //send
                //step-3 send the message using transport Class
                Transport.send(mimeMessage);
                
                response.sendRedirect("adminassigndriversuccessfully.jsp");
                
                
            } catch (Exception e) {
                
                e.printStackTrace();
                out.println(" unsuccessful");
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
