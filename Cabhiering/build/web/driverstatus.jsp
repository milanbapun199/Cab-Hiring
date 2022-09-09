<%-- 
    Document   : driverstatus
    Created on : 25 Jun, 2022, 8:32:30 AM
    Author     : HP
--%>

<%@page import="com.cabhiering.entities.Traveller"%>
<%@page import="com.cabhiering.entities.Driver"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
     
        <% 
            String dId=(String) request.getAttribute("did");
            ArrayList list=(ArrayList) request.getAttribute("dStatus");
            String driverName=(String) request.getAttribute("driverName");
            
//            out.println(dId);
        
        %>
        
        
        <nav class="navbar navbar-expand-lg navbar-dark " style="background: #1565c0">
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
              <a class="nav-link " >Hii..<%= driverName %> </a>
      </li>
          
         
       
      <li class="nav-item">
        <a class="nav-link " href="#">Contact us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="#">Log out</a>
      </li>
      
    
    
  </div>
</nav>
        
        
            <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">Travel Id</th>
                            <th scope="col">Source Address</th>
                            <th scope="col">Destination Address</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Traveler Email</th>
                            <th scope="col">Traveler Phone Number</th>
                            <th scope="col">Payment Status</th>
                          </tr>
                        </thead>
                        <tbody>
			<%
			for(int a=0;a<list.size();a++)
			{
				Driver dr=(Driver)list.get(a);
			%>
			
		<tr>
                        <th scope="row"><%=dr.getDtravelid()%></th>
                        <th><%=dr.getSource() %></th>
                        <th><%=dr.getDestination() %></th>
                        <th><%=dr.getDate() %></th>
                        <th><%=dr.getTime() %></th>
                        <th><%=dr.getdEmail()%></th>
                         <th><%=dr.getTravellerMob()%></th>
                        <th><%=dr.getTravellerPaymentStatus()%></th>
                        <%
                                Traveller tr=new Traveller();
                                HttpSession hs=request.getSession();
                                tr.settEmail(dr.getdEmail());

                        %>
                       
                 </tr>
         
			<%
			} 
			%>
                        
                        </tbody>            
	</table>

                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>
