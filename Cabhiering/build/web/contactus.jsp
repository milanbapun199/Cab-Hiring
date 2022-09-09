<%-- 
    Document   : contactus
    Created on : 10 Aug, 2022, 10:19:52 PM
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
        String email=(String)request.getAttribute("travellerId");
        out.println(email);
        %>
        
    </body>
</html>
