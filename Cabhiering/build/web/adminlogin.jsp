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
            body
            {
                background-size: cover;
                background-image: url('image/Taxista vip _ Vector Premium.jpg')
            }
            .banner_bacground
            {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 98% 98%, 64% 71%, 33% 100%, 0 100%, 0 0);
            }
            
        </style>
    </head>
    <body >
      
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center  " style="height: 92vh; ">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center primary-bacground">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p> Admin Login here</p>
                                
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
                                <form action="AdminLoginServlet" method="POST">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">User Name</label>
                                      <input name="username" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username">
                                      
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="adminpassword" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    
                                    <div class="container text-center"> 
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
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
            <script src="JS/myjs.js" type="text/javascript"></script>
    </body>
</html>
