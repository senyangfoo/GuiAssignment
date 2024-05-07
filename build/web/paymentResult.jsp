<%-- 
    Document   : paymentResult
    Created on : 7 May 2024, 10:07:39 pm
    Author     : Abcong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Successfull</title>
    </head>
    <body>
        <jsp:include page="layouts/header.jsp" /> 
        <h2>${requestScope.title}</h2>
        <h2>${requestScope.msg}</h2>
        <div class="login-icon">
            <input type="button" class="register-link" onclick="window.location.href = 'ViewCart';"
             value="Back to Home" />
        </div>
    </body>
</html>
