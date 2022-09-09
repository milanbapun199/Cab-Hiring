<%@page import="com.cabhiering.entities.TravellingRequest"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
body{
		background-color: #bbdefb;
}
h1,h2{
		color:blue;
}
</style>
</head>
<body>
<%
	ArrayList ar=(ArrayList) request.getAttribute("showDetails"); 
	
	
%>

<table class="table table-striped table">
                  <thead>
                    <tr>
                      <th scope="col">Travel Id</th>
                      <th scope="col">Source Address</th>
                      <th scope="col">Destination Address</th>
                      <th scope="col">Date </th>
                      <th scope="col">Time </th>
                      <th scope="col">Traveler Id </th>
                      <th scope="col">Driver Assign </th>
                    </tr>
                  </thead>
                  <tbody>
			<%
			for(int a=0;a<ar.size();a++)
			{
				TravellingRequest tr=(TravellingRequest)ar.get(a);
			%>
			
			<tr>
                            <th scope="row"><%=tr.getTravelId()%></th>
			 <th><%=tr.getSourceAddress()%></th>
          	 <th><%=tr.getDestinationAddress()%></th>
         	  <th><%=tr.getDate() %></th>
         	  <th><%=tr.getTime() %></th>
         	   <th><%=tr.getTravellerId()%></th>
                   
                   
         	   
         	   
         	  <th scope="col"><a href='AvailableDrivers?date=<%=tr.getDate()%>&travelid=<%=tr.getTravelId()%>&travellerid=<%=tr.getTravellerId()%>&source=<%=tr.getSourceAddress()%>&destination=<%=tr.getDestinationAddress()%>'>assign driver</a></th>
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