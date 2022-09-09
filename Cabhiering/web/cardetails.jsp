<%-- 
    Document   : register_page
    Created on : 25 Apr, 2022, 9:17:17 AM
    Author     : HP
--%>

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
       
        <% 
        String driverEmail=(String)request.getAttribute("driverEmail");
        out.println(driverEmail);
        %>
        
        <%@include file="normal_navbar.jsp" %>
        <main class="secondary-background p-2"style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-bacground">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                           Enter Cab Details 
                        </div>
                        
                        <div class="card-body">
                            <form id="driver_reg_form"action="CabDetailServlet" method="POST">
                                <input type="hidden" name="driverEmail" value="<%=driverEmail %>">
                                    <div class="form-group">
                                   <label for="exampleInputEmail1">Cab No.</label>
                                   <input type="text" class="form-control" name="cabNum" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Cab no">
                                  
                                 </div>
                                    <div class="form-group">
                                   <label for="exampleInputEmail1">Registration No.</label>
                                   <input type="text" class="form-control" name="regdNum" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Registration No.">
                                  
                                 </div>
                                    <div class="form-group">
                                   <label for="exampleInputEmail1">Registration Date</label>
                                   <input type="date" class="form-control" name="regdDate" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Registration Date">
                                  
                                 </div>
                                    <div class="form-group">
                                   <label for="exampleInputEmail1">Permit Place</label>
                                   <input type="text" class="form-control" name="permitplace" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Permit Place">
                                  
                                 </div>
                                    
                                    
                                 
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
