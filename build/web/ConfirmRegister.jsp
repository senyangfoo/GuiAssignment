<%@page import="model.Customer"%>
<jsp:useBean id="user" class="model.Customer" scope="session"></jsp:useBean>
<jsp:setProperty name="user" property="*" />
<%@page import = "java.util.*;" %>
<%@page import = "model.Customer;" %>
<%@include file="layouts/header.jsp" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Country</title>
    </head>
    <body>
        <p>You entered the following data</p>
        
        <p>Name: <%= user.getCustName() %></p>
        <p>Mail: <%= user.getCustEmail() %></p>
        <p>Password : <%= user.getCustPassword() %></p>

        <form method="post" action="Register.jsp">
            <input type="button" value="Cancel" onclick="location='MainRegister.jsp'" />
            <input type="submit" value="Confirm">
        </form>
    </body>
</html>
