<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@include file="layouts/header.jsp" %>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Product> productList = (List)session.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {
                margin: 50px 0 0 250px;
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <button onclick="window.location.href = 'productAdd.jsp'" class="addButton">Add Product</button>
            <table class="prodTable">
                <tr>
                    <td>ID</td>
                    <td>Image</td>
                    <td>Name</td>
                    <td>Description</td>
                    <td>Category</td>
                    <td>Price</td>
                    <td>Stock</td>
                </tr>
                <%
                    if(!productList.isEmpty()){
                        for(Product p : productList){%>
                <tr>
                    <td><%= p.getProdId()%></td>
                    <td><img src ="images/<%= p.getImage() %>" style="width: 100px;"></td>
                    <td><%= p.getProdName()%></td>
                    <td><%= p.getDescription() %></td>
                    <td><%= p.getCategory() %></td>
                    <td>RM <%= String.format("%.2f", p.getPrice()) %></td>
                    <td><%= p.getStock() %></td>
                </tr>
                <%}
            }
                %>
            </table>
        </div>
    </body>
</html>
