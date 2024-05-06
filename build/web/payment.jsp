<%@page import="java.util.*"%>
<%@page import="model.Cart" %>
<%@page import="model.CartService" %>
<%@page  import="enums.prodCategory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //Login Status
    boolean loginStatus = false;
    boolean staffLogin = false;
    if(session.getAttribute("login")!=null){
       loginStatus = (Boolean) session.getAttribute("login");
   }
   if(session.getAttribute("staffLogin")!=null){
        staffLogin = (Boolean) session.getAttribute("staffLogin");
   }
   
   //Cart Status
   List<Cart> cartProduct = null;
   double subtotalPrice = 0;
   double deliveryFee = 0;
   double total=0;
   ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
   if (cart_list != null) {
       cartProduct = (List<Cart>) session.getAttribute("cartProduct");
       subtotalPrice = (double) session.getAttribute("totalPrice");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>
        <% if (cartProduct != null) { %>
        <h2>Product List</h2>
        <%
            for (Cart cart : cartProduct) {
        %>
        <img src ="images/<%= cart.getImage() %>" width="100" height="100">
        <div class="item_details">
            <h4><%= cart.getProdName() %></h4>
            <p>Quantity: <%= cart.getQuantity() %></p>
            <p>Price: RM<%= String.format("%.2f", cart.getPrice()) %></p>
            <p>Product Subtotal: RM<%= String.format("%.2f", cart.getPrice()*cart.getQuantity()) %></p>
        </div>
        <% } %>
        <%
            if(subtotalPrice >= 1000){
               deliveryFee = 0.0; 
               total = subtotalPrice;
            } else {
               deliveryFee = 25.0;
               total = subtotalPrice + deliveryFee;
            }
         %>
        <p>Subtotal: RM <%= String.format("%.2f", subtotalPrice) %></p>
        <p>Shipping Fee: <%= (deliveryFee == 0.0) ? "Free" : "RM " + String.format("%.2f", deliveryFee) %></p>
        <p>Total: RM <%= String.format("%.2f", total) %></p>
        <% } %>
    </body>
</html>
