<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "domain.Product" %>
<%@ page import = "java.sql.*" %>

<jsp:useBean id="pda" class="da.ProductDA"></jsp:useBean>

<%
    List<Product> products = null;
    pda.getConnection(); 
    products = pda.getAllProduct();   
%>
<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
<body>
    <h1>Product List</h1>
    <div class = "container">
        <%
            if(!products.isEmpty()){
                for(Product p : products){%>
                    <div class="card">
                        <img src ="images/<%= p.getProductImage() %>" style="max-width: 100px; max-height: 100px;">
                        <h1><%= p.getProductName() %></h1>
                        <p><%= p.getPrice() %></p>
                        <p><%= p.getDescription() %></p>
                        <p><button>Add to Cart</button></p>
                    </div>
                <%}
            }
        %>
    </div>
</body>
</html>
<%@include file="layouts/footer.jsp" %>  