<%-- 
    Document   : AdminLogin.jsp
    Created on : May 7, 2024, 12:35:35 AM
    Author     : khtee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <h1>Admin Login</h1>
        <form action="j_security_check" method="POST">
            <label>ID:<input type="text" name="j_username"/></label></br>
            <label>Password:<input type="password" name="j_password"/></label></br>
        <input type="submit" value="Login"/>
        <a href="MainRegister.jsp"><button>Back</button></a>
        </form>
    </body>
</html>
