<%-- 
    Document   : edit_traveller_profile
    Created on : 20 May, 2022, 4:18:35 PM
    Author     : HP
--%>

<%@page import="com.cabhiering.entities.Traveller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profiles</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        
        <% Traveller traveller=(Traveller) request.getAttribute("edit"); %>
        
        
       
        
        
        <%@include file="traveller_navbar.jsp" %>
        <main class="secondary-background p-2"style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-bacground">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Update your Profile 
                        </div>
                        
                        <div class="card-body">
                            <form id="reg_form"action="TravellerUpdate" method="POST">
                                    
                                    <div class="form-group">
                                   <label for="exampleInputEmail1"> Name</label>
                                   <input type="text" class="form-control" name="traveller_name" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= traveller.gettName()%>">
                                  
                                 </div>
                                    
                                    
                                 <div class="form-group">
                                   <label for="exampleInputEmail1">Email address</label>
                                   <input type="email" class="form-control" name="traveller_email" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= traveller.gettEmail()%>" >
                                   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                 </div>
                                <div class="form-group">
                                   <label for="exampleInputEmail1">Mobile number</label>
                                   <input type="number" class="form-control" name="traveller_mob_num" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= traveller.gettMob() %>">
                                   
                                 </div>
                                    
                                    <div class="form-group">
                                   <label for="exampleInputPassword1">Password</label>
                                   <input type="text" name="traveller_pasword" class="form-control" id="exampleInputPassword1" value="<%= traveller.gettPassword()%>">
                                 </div>
                                    
                                 
                                 
                                   
                                    
                                
                                    <br>
<!--                                    <div class="container text-center " id="loader" style="display: none">
                                         <span class="fa fa-refresh fa-spin fa-3x"></span>
                                         <h4>Please wait...</h4>
                                    </div>-->
                                   
                                    <button id="submit_btn" type="submit" class="btn btn-primary">Update</button>
                               </form>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        
        
    </body>
</html>
