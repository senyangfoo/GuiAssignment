
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userDA" class="model.userDA" scope="application"></jsp:useBean>
    <%@include file="layouts/header.jsp" %>  

<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
    </head>
    <body>
        <div id="register">
        <h3>Register</h3>
        <form method="POST" action="ConfirmRegister.jsp" >
            <p><label>Username:</label>
                <input type="text" id="userName" name="custName" size="40" required/></p>
            <p><label>Email:</label>
                <input type="text" id="userMail" name="custEmail" size="40" required/></p>
            <p><label>Password:</label>
                <input type="password" name="custPassword" size="40" required/></p>
            <p><label>Confirm Password</label>
                <input type="password" name="confirmPass" size="40" required/></p>

            <p><input type="submit" value="Create" />
                <input type="reset" value="Reset" /></p>
        </form>
            <input type="button" value="Back" onclick="location='Main.html'" />
            <a  class="login" href="Login.html"><input type="submit" value="Login"/></a>
        </div>
    </body>
</html>

