<%-- 
    Document   : register_page
    Created on : 25 Apr, 2022, 9:17:17 AM
    Author     : HP
--%>

<%@page import="com.cabhiering.entities.MessageForInvalid"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver Register Page</title>
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background-size: cover;
                background-image: url('image/HD wallpaper_ selective photo of yellow sedan at Newyork Timesquare, New York City.jpg')
            }

            
        </style>
    </head>
    <body>
        
        <%@include file="normal_navbar.jsp" %>
        <main class="secondary-background p-2"style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-bacground">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Driver Register here
                        </div>
                         <% 
                            MessageForInvalid mfi=(MessageForInvalid)session.getAttribute("message");
                            if(mfi != null)
                            {
                                %>
                                
                                    <div class="alert alert-danger " role="alert">
                                        <%= mfi.getContent() %>
                                    </div>
                                <%
                                    
                                 session.removeAttribute("message");
                            }
                            
                            
                            %>
                        
                        <div class="card-body">
                            <form id="driver_reg_form"action="DriverRegistrationServlet" method="POST">
                                    
                                    <div class="form-group">
                                   <label for="exampleInputEmail1">Driver Name</label>
                                   <input type="text" class="form-control" name="driver_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
                                  
                                 </div>
                                    
                                    
                                 <div class="form-group">
                                   <label for="exampleInputEmail1">Email address</label>
                                   <input type="email" class="form-control" name="driver_email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                 </div>
                                
                                <div class="form-group">
                                   <label for="exampleInputEmail1">Mobile number</label>
                                   <input type="number" class="form-control" name="driver_number" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                 </div>
                                    
                                    <div class="form-group">
                                   <label for="exampleInputPassword1">Password</label>
                                   <input type="password" name="driver_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                 </div>
                                    
                                
                                   
                                    
                                 <div class="form-check">
                                     <input type="checkbox" class="form-check-input" name="driver_check" id="exampleCheck1">
                                   <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                 </div>
                                    <br>
                                    <div class="container text-center " id="loader" style="display: none" >
                                         <span class="fa fa-refresh fa-spin fa-3x"></span>
                                         <h4>Please wait...</h4>
                                    </div>
                                      
                                   
                                    <button id="submit_btn" type="submit" class="btn btn-primary">Submit</button>
                               </form>                           
                            
                        </div>
                        
                        
                        
                    </div>
                    
                </div>
            </div>
                
          
        </main>
        
        
        
        
        
        
        
        
        
         <!-- javascript -->
		<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="JS/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            
<!--        <script>
            $(document).ready(function() {
                console.log("loaded.....");
                
                
                
                $('#driver_reg_form').on('submit',function(event) {
                    event.preventDefault();
                    let form=new FormData(this);
                    
                    
                    $('#submit_btn').hide();
                    $('#loader').show();
                    
                    
                    
                    //send registerservlet: 
                    
                    $.ajax({
                        url: "DriverRegistrationServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            
                        
                    },
                    
                    
                        error: function (jqXHR, textStatus, errorThrown) {
                        
                        console.log(jqXHR);
                    },
                    
                    processData: false,
                    contentType: false
                    
                    
                    
                    });
                    
                    
                    
                    
                });
                
            });
        </script>     -->
            
    </body>
</html>
