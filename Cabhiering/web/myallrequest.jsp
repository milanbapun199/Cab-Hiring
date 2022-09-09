<%-- 
    Document   : myallrequest
    Created on : 21 Jun, 2022, 6:11:03 PM
    Author     : HP
--%>

<%@page import="com.cabhiering.helper.ConnectionProvider"%>
<%@page import="com.cabhiering.dao.DriverDao"%>
<%@page import="com.cabhiering.entities.Driver"%>
<%@page import="com.cabhiering.entities.PaymentInfo"%>
<%@page import="com.cabhiering.entities.TravellerRequest"%>
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
        <style>
            body{
		background-color: #bbdefb;
}
h1,h2{
		color:blue;
}
        </style>
    </head>
    <%
	ArrayList ar=(ArrayList) request.getAttribute("myAllrequest");
	
	
%>

<table class="table table-striped table">
                  <thead>
                    <tr>
                      <th scope="col">Travel Id</th>
                      <th scope="col">Source Address</th>
                      <th scope="col">Destination Address</th>
                      <th scope="col">Date </th>
                      <th scope="col">Time </th>
                      <th scope="col">driver id </th>
                      <th scope="col">driver Mob.</th>
                      <th scope="col">Pstatus</th>
                    </tr>
                  </thead>
                  <tbody>
			<%
			for(int a=0;a<ar.size();a++)
			{
				TravellerRequest tr = (TravellerRequest)ar.get(a);
			%>
			
			<tr>
                            <th scope="row"><%=tr.getTravelid()%></th>
                            
                                 <%  PaymentInfo pi=new PaymentInfo();
			pi.setTravelId(tr.getTravelid());
			double amount=pi.getAmount(); 
			
			
			Driver dr=new Driver();
			dr.setDtravelid(tr.getTravelid());
                        DriverDao dao=new DriverDao(ConnectionProvider.getConnection());
                        
                        
			
			
			%>
			 <th><%=tr.getSource() %></th>
          	 <th><%=tr.getDestination()%></th>
         	  <th><%=tr.getDate() %></th>
         	  <th><%=tr.getTime() %></th>
         	
                    <%
         	  	if(tr.getPstatus()!=null)
         	  	{
         	  		%>
                  <th><%=dao.getMobAndDriverId(dr).getdEmail()%></th>
         	  		<th><%=dao.getMobAndDriverId(dr).getdMobile()%></th>
         	  	<% } else { %>
         	  		<th>Not assigned</th>
         	  		<th>Not assigned</th>
         	  	<% } %>
         	    <%
         	  	if(tr.getPstatus()==null)
         	  	{
         	  %>
         	  <th>Driver Not Assigned</th>   	  
         	  <%
         	  	}
         	  	else if(tr.getPstatus().equals("Paid"))
         	  	{
         	  %>
         	  	<th><%=tr.getPstatus()%></th>
         	  <%} 
         	  	else
         	  	{
         	  		
         	  %>
         	  <th><a href='carddetails.jsp?tid=<%=tr.getTravelid()%>&amount=<%=amount%>&DriverId=<%=dr.getdId()%>'>Pay</a></th>
         	  <%}
         	   }%>
			</tr>

                   
                   
         	   
         	   
         	 
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
