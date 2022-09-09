<%-- 
    Document   : index
    Created on : 13 May, 2022, 9:22:03 AM
    Author     : HP
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.cabhiering.helper.ConnectionProvider" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/mycss/mystyle.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner_background
            {
                clip-path: polygon(30% 0%, 70% 0%, 100% 3%, 98% 91%, 70% 100%, 15% 95%, 0 100%, 0 0);
            }
           
        </style>
    </head>
    <body>
        <h1 class="text-light "style="background: #90caf9;text-align: center"> ONLINE CAB HIRING</h1>

        <%@include file="normal_navbar.jsp" %>
        <br>
        
        
        <div class="container-fluid p-0  m-0" >
            <div class="jumbotron primary-bacground text-light banner_background " style="background:#1565c0 ">
                <div class="container">
                    <h3 class="display-3">Welcome, Guys..</h3>
                    <p>Online Cab Hiring System is the discipline of planning, organizing, and managing resources to ring about the successful completion of specific project goals and objectives. It is sometimes conflated with program management, however technically a program is actually a higher level construct a group of related and somehow inter dependent projects.
                        A project is a temporary Endeavour, having a defined beginning and end usually constrained by date, but can be by funding or deliverables, undertaken to meet unique goals and objectives, usually to bring about beneficial change or added value. The temporary nature of projects stands in contrast to, which are repetitive, permanent or semi-permanent functional work to produce products or services. In practice, the management of these two systems is often found to be quite different, and as such requires the development of distinct technical skills and the adoption of separate management.</p>
                    
                    <a href="traveller_login.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"></span>Travller Login</a>
                    <a href="driver_login.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"></span> Driver Login</a>
                </div>
            </div>
            
            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!--javascript-->
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            
        </script>
    </body>
</html>
