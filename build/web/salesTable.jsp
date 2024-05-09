<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@include file="layouts/header.jsp" %>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Orders> orderList = (List)session.getAttribute("orderList");
   List<OrderDetail> orderDetailList = (List)session.getAttribute("orderDetailList");
   ProductService productService = new ProductService();
   
    // Sort orderDetailList based on quantity sold
    for (int i = 0; i < orderDetailList.size(); i++) {
        for (int j = i + 1; j < orderDetailList.size(); j++) {
            int quantityI = orderDetailList.get(i).getQuantity();
            int quantityJ = orderDetailList.get(j).getQuantity();
                if (quantityI < quantityJ) {
                    // Swap elements if quantityI is less than quantityJ
                    OrderDetail temp = orderDetailList.get(i);
                    orderDetailList.set(i, orderDetailList.get(j));
                    orderDetailList.set(j, temp);
                }
        }
    }
%>
<style>
    .contentContainer {
        margin: 50px 0 0 250px;
        display: grid;
        position: relative;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <div class="contentContainer">
        <h2>Top 10 Sold Product</h2>
            <table>
                <tr class="header">
                    <td>Product Name</td>
                     <td>Price</td>
                    <td>Quantity Sold</td>
                    <td>Subtotal(RM)</td>
                </tr>
                <%
                   if(!orderList.isEmpty()){
                    // Display top 10 sold products
                    int count = 0;
                    double totalAmount = 0.0;
                    for (OrderDetail od : orderDetailList) {
                        if (count >= 10) {
                            break;
                        }

                        int productId = od.getProdId().getProdId();
                        int quantitySold = od.getQuantity();
                        Product prod = productService.getCurrentProductById(productId);
                %>
                <tr>
                    <td><%= prod.getProdName() %></td>
                    <td><%= prod.getPrice() %></td>
                    <td><%= quantitySold %></td>
                    <% 
                        double subtotal= prod.getPrice() * quantitySold;
                        totalAmount += subtotal;                        
                    %>
                    <td><%= subtotal %></td>
                </tr>
                <%
                        count++;
                    }
                %>
                <tr>
                    <td colspan="3">Total Amount(RM)</td>
                    <td><%= totalAmount %></td>
                </tr>
                <% } else { %>
                    <h3>No One Order Yet :C</h3>
                <% } %>
            </table>            
        </div>   
    </body>
</html>
