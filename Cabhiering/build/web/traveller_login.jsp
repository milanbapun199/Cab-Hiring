<%-- 
    Document   : login_page
    Created on : 24 Apr, 2022, 5:43:48 PM
    Author     : HP
--%>


<%@page import="com.cabhiering.entities.MessageForInvalid"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
           <!--css-->
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
             body,html
            {
               height: 100%;
               margin: 0;
                
            }
            .bg
            {
                background-image: url('image/nick-fewings-MlZnEM4LUwY-unsplash.jpg');
                height: 100%;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            
             .secondary-background {
                 background: #0277bd;
            }
            .frgtpwd {
                margin-left: 90px;
            }
            .card{
                background: #e3f2fd;
            }
            
        </style>
    </head>
    <body class="bg" >
      
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center  " style="height: 92vh; ">
            <div class="container" ">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card"  >
                            <div class="card-header text-center primary-bacground" >
                                <span class="fa fa-user-plus fa-3x" style="color: #283593" ></span>
                                <p style="color: #283593">Login here</p>
                                
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
                            
                             
                            
                            <div class="card-body" >
                                <form action="TravellerLoginServlet" method="GET">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input name="traveller_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="traveller_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    
                                    <div > 
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <a  href="forgot_traveller_pwd.jsp" class="frgtpwd">Forgot password
                                            ?</a>

           
                                    </div
                                    
                                  </form>                              
                                
                                
                            </div>
                            
                            
                            <div class="card-footer">
                                
                            </div>
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
    </body>
</html>
