<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

.card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
      
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
</style>
</head>
<body>


<% 
		ArrayList ar1=(ArrayList) request.getAttribute("drivers");

		String travelId=(String)request.getAttribute("travelId");
		String travellerId=(String)request.getAttribute("travellerId");
		String source=(String)request.getAttribute("source");
		String destination=(String)request.getAttribute("destination");
%>
	
	<form action='AssignDriver'>
	
	<input type="hidden" name="travelId" value="<%=travelId%>">
	<input type="hidden" name="travellerId" value="<%=travellerId%>">
	<input type="hidden" name="source" value="<%=source%>">
	<input type="hidden" name="destination" value="<%=destination%>">
        
        <div class="card">
      
        <h1>Available Drivers</h1> 
        
        <select name="driverId">
			
			<%
				for(int i=0;i<ar1.size();i++)
				{
			%>
				
				<option value='<%=ar1.get(i)%>'><%=ar1.get(i)%></option>				
			<%
				}
			%>	
		</select>	
        
        <button>Submit</button>
      </div>                
	  
	  </form>
            	
</body>

</html>