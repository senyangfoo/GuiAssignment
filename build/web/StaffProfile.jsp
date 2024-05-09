<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = (String)request.getSession().getAttribute("name");
     String mail = (String)request.getSession().getAttribute("mail");
     String password = (String)request.getSession().getAttribute("password");
 
%> 
<%@include file="layouts/header.jsp" %>

<%
if (staffLogin == false){
%>
<script>

    function run() {
        window.location.href = 'Login.jsp';
    }
    run();
</script>

<% }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Profile</title>
    </head>
    <body>
        <h1>Staff Profile</h1>
         <p>Name: <%= name %></p>
          <p>Mail: <%= mail %></p>

        <p>Password : <%= password %></p>
        <a href="StaffEdit.jsp"><button>Edit Profile</button></a>
    </body>
</html>
