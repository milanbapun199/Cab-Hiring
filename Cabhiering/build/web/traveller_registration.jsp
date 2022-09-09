

<%@page import="com.cabhiering.entities.MessageForInvalid"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Traveller Register Page</title>
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
/*            .banner_background
            {
               clip-path: polygon(30% 0%, 70% 0%, 100% 3%, 98% 91%, 70% 100%, 15% 95%, 0 100%, 0 0);
            }*/
            

            body,html
            {
               height: 100%;
               margin: 0;
                
            }
            .bg
            {
                background-image: url('image/david-hurley-nmRncUvyeLc-unsplash.jpg');
                height: 100%;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .card{
                background: #e3f2fd;
                opacity: 0.9;
            }
        </style>
    </head>
    <body class="bg">
        <%@include file="normal_navbar.jsp" %>
        <main class="secondary-background p-2"style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-bacground">
                            <span class="fa fa-user-circle fa-3x" style="color: #283593"></span>
                            <br>
                            <p style="color: #283593">Traveler Register here</p> 
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
                            <form id="reg_form"action="TravellerRegistrationServlet" method="POST">
                                    
                                    <div class="form-group">
                                   <label for="exampleInputEmail1"> Name</label>
                                   <input type="text" class="form-control" name="traveller_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
                                  
                                 </div>
                                    
                                    
                                 <div class="form-group">
                                   <label for="exampleInputEmail1">Email address</label>
                                   <input type="email" class="form-control" name="traveller_email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                 </div>
                                <div class="form-group">
                                   <label for="exampleInputEmail1">Mobile number</label>
                                   <input type="number" class="form-control" name="traveller_mob_num" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                 </div>
                                    
                                    <div class="form-group">
                                   <label for="exampleInputPassword1">Password</label>
                                   <input type="password" name="traveller_pasword" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                 </div>
                                    
                                 <div class="form-group">
                                   <label for="exampleInputPassword1">Gender</label>
                                   <br>
                                   <input type="radio"  id="gender" name="traveller_gender" value="male">male
                                   <input type="radio"  id="gender" name="traveller_gender" value="female">female
                                 </div>
                                 
                                   
                                    
                                 <div class="form-check">
                                     <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                                   <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                 </div>
                                    <br>
<!--                                    <div class="container text-center " id="loader" style="display: none">
                                         <span class="fa fa-refresh fa-spin fa-3x"></span>
                                         <h4>Please wait...</h4>
                                    </div>-->
                                   
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
            $(document).ready(function (){
                console.log("loaded.....");
                $('#reg_form').on('submit',function (event){
                    event.preventDefault();
                    let form=new FormData(this);
                    //send RegisterServlet
                    
//                    $("#submit_btn").hide();
//                    
//                    $("#loader").show();
                    
                    $.ajax({
                       url: "RegisterServlet",
                       type: 'POST',
                       data:form,
                       success: function (data, textStatus, jqXHR) {
                        console.log(data);
                         $("#submit_btn").show();
                          $("#loader").hide();
                          if(data.trim()==='done')
                          {
                              swal("Registered successfully.We are going to redirect login page..")
                            .then((value) => {
                              window.location="login_page.jsp";
                            });
                          }
                          else {
                              swal(data);
                          }
                          
                    },
                    
                    error: function (jqXHR, textStatus, errorThrown) {
                         $("#submit_btn").hide();
                    $("#loader").show();
                        swal("Something went wrong ...Try again");
                            
                    },
                    processData: false,
                    contentType: false
                    });
                    
                });
            });
        </script>      -->
            
    </body>
</html>
