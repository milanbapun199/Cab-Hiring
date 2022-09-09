<%-- 
    Document   : carddetails
    Created on : 24 May, 2022, 3:55:44 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
            double amount=Double.parseDouble( request.getParameter("amount"));
            String travelid=request.getParameter("travelId");
//            String driverId=request.getParameter("driverId");
        
        %>
        
        
        <h1>
<center>Make Payment</center></h1>
<form action ="CardDetails">
<input type="hidden" name="tid" value="<%=travelid%>" >
<!--<input type="hidden" name="driverId" value="driverId" >-->

<table border="1" align="center" cellpadding="20">
<tr>
<th>Card No</th>
<th align="left"><input type="text" name="cardno" size="30"></th>
</tr>
<tr>
<th>Pin</th>
<th align="left"><input type="password" name="pin" size="30"></th>
</tr>

<tr>
<th>Expiry Month</th>
<th align="left"><input type="text" name="expmonth" size="30"></th>
</tr>

<tr>
<th>Expiry Year</th>
<th align="left"><input type="text" name="expyear" size="30"></th>
</tr>
<tr>
<th>Cardholder Name</th>
<th align="left"><input type="text" name="cardholdername" size="30"></th>
</tr>

<input type="hidden" name="amount" value="<%=amount %>" ></th>


<tr>
<th colspan="2"><input type="submit" value="Submit"size="50"></th>
</tr>

</table>
</form>
    </body>
</html>
