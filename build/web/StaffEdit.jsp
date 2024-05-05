<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = (String)request.getSession().getAttribute("name");
     String mail = (String)request.getSession().getAttribute("mail");
     String password = (String)request.getSession().getAttribute("password");
 
%> 
<%@include file="layouts/header.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Profile</title>
    </head>
    <body>
         <c:if test="${requestScope.errorMsg !=null}">                       
                <div class="login-error" style="color: red;">
                    <p class="error">

                        ${requestScope.errorMsg}</p>
                </div>
            </c:if>
        <form action="EditStaff" method="POST">
        <h1>Staff Profile</h1>
         <p>Name: <input type="text" name="name" value="<%= name %>"></p>
          <p>Mail: <input type="text" name="mail" value="<%= mail %>"></p>

        <p>Password : <input type="text" name="password" value="<%= password %>"></p>
        <input type="submit" value="Confirm">
        </form>
          <a href="StaffProfile.jsp"><button>Back</button></a>
    </body>
</html>
