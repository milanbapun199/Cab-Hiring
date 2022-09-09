<%-- 
    Document   : travelstatus
    Created on : 24 May, 2022, 10:57:01 AM
    Author     : HP
--%>

<%@page import="com.cabhiering.entities.PaymentInfo"%>
<%@page import="com.cabhiering.helper.ConnectionProvider"%>
<%@page import="com.cabhiering.dao.TravellerDao"%>
<%@page import="com.cabhiering.entities.Rate"%>
<%@page import="com.cabhiering.entities.TravellingRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	//ArrayList ar=(ArrayList) request.getAttribute("tstatus"); 

	
	TravellingRequest travellingRequest=(TravellingRequest)request.getAttribute("travelStatus");
	//int amount= (Integer) request.getAttribute("amount");	
	String travelId = (String)request.getAttribute("travelId");
	
%>





		<table align= 'center' border='1' cellpadding='20'>
			
			
			<tr>	
			<th>Source Address</th>
			
           <th><%=travellingRequest.getSourceAddress()%></th>
			</tr>
			
			<tr>
			<th>Destination Address</th>
			<th><%=travellingRequest.getDestinationAddress()%></th>
			</tr>
			<tr>
			<th>Date</th>
			 <th><%=travellingRequest.getDate() %></th>
			</tr>
			
			
			<tr><th>Time</th>
			 <th><%=travellingRequest.getTime() %></th>
			</tr>
			
			<% 
                            Rate rate=new Rate();
                            rate.setSource(travellingRequest.getSourceAddress());
                            rate.setDestination(travellingRequest.getDestinationAddress());
                            TravellerDao dao=new TravellerDao(ConnectionProvider.getConnection());
                            double totalFare=dao.getFare(travellingRequest.getSourceAddress(), travellingRequest.getDestinationAddress());
                            PaymentInfo paymentInfo= new PaymentInfo();
                            paymentInfo.setTravelId(travelId);
                            paymentInfo.setAmount(totalFare);
                            paymentInfo.setpStatus("unpaid");
                            boolean info=dao.insertPaymentDetails(paymentInfo);
//                            out.println(info);
                        
                        
                        %>
                        <tr><th>Total Fare</th>
			 <th><%=totalFare  %></th>
                        
			</tr>
                        
                        <tr><th colspan="2"><a href='carddetails.jsp?amount=<%=totalFare%>&travelId=<%=travelId%>'> Make Payment</a></th>
		
			</tr>
                        
			</table>
    </body>
</html>
