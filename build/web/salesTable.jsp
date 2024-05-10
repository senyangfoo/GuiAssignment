<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.Product"%>
<%@page import="model.Orders"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.ProductService"%>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");
   List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
   ProductService productService = new ProductService();
   
   // Map to store merged order details by product ID
   Map<Integer, OrderDetail> mergedOrderDetails = new LinkedHashMap<>();

   // Merge order details by product ID
   for (OrderDetail od : orderDetailList) {
       int productId = od.getProdId().getProdId();
       if (mergedOrderDetails.containsKey(productId)) {
           OrderDetail mergedDetail = mergedOrderDetails.get(productId);
           mergedDetail.setQuantity(mergedDetail.getQuantity() + od.getQuantity());
           // You may need to update other fields as well if needed
       } else {
           mergedOrderDetails.put(productId, od);
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
                   if (!mergedOrderDetails.isEmpty()) {
                    // Display top 10 sold products
                    int count = 0;
                    double totalAmount = 0.0;
                    for (Map.Entry<Integer, OrderDetail> entry : mergedOrderDetails.entrySet()) {
                        if (count >= 10) {
                            break;
                        }

                        OrderDetail od = entry.getValue();
                        Product prod = productService.getCurrentProductById(od.getProdId().getProdId());
                %>
                <tr>
                    <td><%= prod.getProdName() %></td>
                    <td><%= prod.getPrice() %></td>
                    <td><%= od.getQuantity() %></td>
                    <% 
                        // Calculate subtotal by multiplying price and quantity
                        double subtotal = prod.getPrice() * od.getQuantity();
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
