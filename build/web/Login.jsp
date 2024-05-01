<%@include file="layouts/header.jsp" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*;" %>
<%@page import = "model.Customer;" %>
<%@page import = "java.sql.*;" %>
<jsp:useBean id="customer" class="model.Customer" scope="session"></jsp:useBean>
<%@page import="model.Customer, java.util.*" %>

<!DOCTYPE html>
<% 
     loginStatus = false;
 Object loginStatusObj = session.getAttribute("login");
    if (loginStatusObj != null) {
        loginStatus = Boolean.parseBoolean(loginStatusObj.toString());
    }
%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <script src="https://kit.fontawesome.com/298f4ece43.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="login">
            <c:if test="${requestScope.errorMsg !=null}">                       
                        <div class="login-error" style="color: red;">
                             <p class="error">
                            
                           ${requestScope.errorMsg}</p>
                        </div>
                    </c:if>
            <form action="RetrieveUser" method="POST" >
            <div>Login</div>
            Username:
            <input type="text" name="name" placeholder="Username" required/><br/>
            Password:
            <input type="text" name="password" placeholder="Password" required/><br/>
            <input type="submit" value="Login" name="submit"/>
        </form>
        <input type="button" value="Back" onclick="location='index.jsp'" />
            <a  class="register" href="MainRegister.jsp"><input type="submit" value="Register"/></a>
        </div>
    </body>
</html>
