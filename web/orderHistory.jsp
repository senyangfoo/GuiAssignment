<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@page  import="model.Orders" %>
<%@page  import="model.OrderDetail" %>
<%@page  import="model.ProductService" %>
<%@include file="layouts/header.jsp" %>
<%
   List<Orders> orderList = (List)session.getAttribute("custorderList");
   List<OrderDetail> orderDetailList = (List)session.getAttribute("custorderDetailList");
   ProductService productService = new ProductService();
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div class="contentContainer">
        <h2>Your Order History</h2>
            <table>
                <tr class="header">
                    <td>Product Name</td>
                    <td>Quantity</td>
                    <td>Price(RM)</td>
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
                    <td><%= quantitySold %></td>
                    <td><%= prod.getPrice() %></td>
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
                    <h3>You don't have any order</h3>
                <% } %>
            </table>            
        </div>   
    </body>
</html>
