
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userDA" class="da.userDA" scope="application"></jsp:useBean>
<%! String front_id = "CUST";%>
<% 
    int count = 1000; 
    count = count + userDA.getQuantity();
    count++;
    String ID = front_id + count;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
    </head>
    <body>
        <div id="register">
        <h3>Register</h3>
        <form method="POST" action="ConfirmRegister.jsp" >
            <p><label>User ID</label>
                <input type="text" id="id" name="custId" size="40" readonly="readonly" value="<%=ID%>"/></p>
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

