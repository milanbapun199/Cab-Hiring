<%-- 
    Document   : enterestravelid
    Created on : 24 May, 2022, 10:11:41 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
body{
		background-color:pink;
}
</style>
    </head>
    <body>
        <% 
        String travelId=(String) request.getAttribute("travelId");
        
        %>
        <form action="TravelStatus" method="get">
			<table border="1" align="center" cellpadding="20">
				<tr><th>Enter your travelid</th>
                                    <th align="left"><input type="text" name="travelid" value="<%=travelId %>" size="30"></th>
				</tr>
				
				<tr>
					<th colspan="2"><input type="submit" size="30"></th>
				</tr>
				
				
			
			</table>


		</form>
    </body>
</html>
