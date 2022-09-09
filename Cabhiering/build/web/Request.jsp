<%-- 
    Document   : Request
    Created on : 28 Jun, 2022, 2:38:17 PM
    Author     : HP
--%>

<%@page import="com.cabhiering.entities.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%
	ArrayList ar=(ArrayList) request.getAttribute("getAllDetails"); 
	
	
%>

<table align= 'center' border='1' cellpadding='20'>
			
			<tr>
			<th>Travel Id</th>
			<th>Traveler Id</th>
			<th>Source Address</th>
			<th>Destination Address</th>	
			<th>Travel Date</th>
			<th>Time</th>
			<th>Driver assign</th>
			<th>Payment status</th>
			</tr>
			<%
			for(int a=0;a<ar.size();a++)
			{
				Admin ad=(Admin)ar.get(a);
			%>
			
			<tr>
			 <th><%=ad.getTravelId()%></th>
			<th><%=ad.getTravellerId()%></th>
         	   <th><%=ad.getSource() %></th>
         	   <th><%=ad.getDestination() %></th>
         	   <th><%=ad.getDate() %></th>
         	   <th><%=ad.getTime() %></th>
         	   <th><%=ad.getDriverId()%></th>
         	   <th><%=ad.getPaymentStatus()%></th>
         	   
         	 
			</tr>
			
			<%
			} 
			%>

</table>
        
        
    </body>
</html>
