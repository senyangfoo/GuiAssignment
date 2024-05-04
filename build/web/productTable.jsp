<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%
   List<Product> productList = (List)session.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Table</title>
    </head>
    <body>
        <table>
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
                <td>RM <%= p.getPrice() %></td>
                <td><%= p.getStock() %></td>
            </tr>
            <%}
        }
            %>
        </table>
    </body>
</html>
