<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer" %>
<%
    String username = (String)request.getAttribute("username");
  String password = (String)request.getAttribute("password");
  session.setAttribute("name", username);
  session.setAttribute("password", password);
%> 
<%@include file="layouts/header.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        <h1>User Profile</h1>
         <p>Name: <%= username %></p>

        <p>Password : <%= password %></p>
    </body>
</html>
