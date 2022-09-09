

<%@page import="com.cabhiering.entities.MessageForInvalid"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>

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
        .btn-secondary {
            background-color: #1c94ff;
        }
        .btn_address
        {
            padding-left: 32px;
        }
            
        </style>
    </head>
    <body>
        
        
        
        
        
       
        
        
        
        
        <%@include file="traveller_navbar.jsp" %>
        <main class="secondary-background p-2"style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-bacground">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Traveling Request Form
                        </div>
                        
                        <% 
                             ArrayList ar1=(ArrayList) request.getAttribute("loc");
        java.time.LocalDate now=java.time.LocalDate.now();
        java.util.Date date=new java.util.Date();
		DateFormat dateFormat=new SimpleDateFormat("HH:mm");
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
                            <form id="reg_form"action="TravelRequest" method="POST">
                                    
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                              <label class="input-group-text" for="inputGroupSelect01">Source Address</label>
                                            </div>
                                            <select class="custom-select" id=" select1" name="source"  >
                                               <%
                                                for(int i=0;i<ar1.size();i++)
                                                {
                                               %>
				
                                                <option value='<%=ar1.get(i)%>'><%=ar1.get(i)%></option>				
                                                <%
                                                        }
                                                %>
                                            </select>
                                        </div>
                                            
                                            
                                <br>
                                
                                    
                                    
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                              <label class="input-group-text" for="inputGroupSelect01">Destination Address</label>
                                            </div>
                                           <select class="custom-select" id=" select2" name="destination"  >
                                               <%
                                                for(int i=0;i<ar1.size();i++)
                                                {
                                               %>
				
                                                <option value='<%=ar1.get(i)%>'><%=ar1.get(i)%></option>				
                                                <%
                                                        }
                                                %>
                                            </select>
                                        </div>
                               
                                <div class="form-group">
                                   <label for="exampleInputEmail1">Date :</label>
                                   <input type="date" class="form-control" name="traveller_date" id="dateControl" aria-describedby="emailHelp" min="<%=now %>" >
                                   
                                 </div>
                                    
                                    <div class="form-group">
                                   <label for="exampleInputPassword1">Time :</label>
                                   <input type="time" name="traveller_time" class="form-control" id="exampleInputPassword1" placeholder="Time" >
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        
            
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
