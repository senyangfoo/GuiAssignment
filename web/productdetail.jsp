
<%@page import="domain.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Product p = (Product) session.getAttribute("product");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
    </head>
    <body>
          <img src ="images/<%= p.getImage() %>" style="max-width: 100px; max-height: 100px;">
          <h1><%= p.getProdName()%></h1>
          <p><%= p.getPrice() %></p>
          <p><%= p.getDescription() %></p>
    </body>
</html>
\