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
        <title>User Profile</title>
    </head>
    <body>
        <form action="EditUser" method="POST">
        <h1>User Profile</h1>
         <p>Name: <input type="text" name="name" value="<%= name %>"></p>
          <p>Mail: <input type="text" name="mail" value="<%= mail %>"></p>

        <p>Password : <input type="text" name="password" value="<%= password %>"></p>
        <input type="submit" value="Confirm">
        </form>
          <a href="UserProfile.jsp"><button>Back</button></a>
    </body>
</html>
