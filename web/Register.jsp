<%@page import="model.Customer"%>
<%@page import="model.userDA"%>

<jsp:useBean id="user" class="model.Customer" scope="session"></jsp:useBean>
<jsp:useBean id="userDA" class="model.userDA" scope="application"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <title>Account Created</title>
        </head>
        <body>
        <% userDA.addRecord(user);%>
        <%= user.getCustName()%> has been added to the database<br/>
        
           <% response.sendRedirect("index.jsp"); %>
    </body>
</html>
