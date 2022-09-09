
<%@page import="com.cabhiering.entities.Driver"%>
<% 
Driver driver=(Driver) session.getAttribute("currentDriver");

if(driver==null)
{
response.sendRedirect("driver_login.jsp");
}



%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%=  driver.getdName()%>
        <br>
         <%=  driver.getdMobile()%>
        <br>
        
        <%=  driver.getdEmail()%>
        <br>
        <%=  driver.getdId()  %>
        <br>

    </body>
</html>
