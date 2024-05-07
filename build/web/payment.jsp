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
    String name = (String)request.getSession().getAttribute("name");
    String mail = (String)request.getSession().getAttribute("mail");
    String phoneNumber = (String)session.getAttribute("phoneNumber");
    String fullAddress= (String)session.getAttribute("fullAddress");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <script>
            function showPaymentForm(paymentMethod) {
                var paymentForms = document.querySelectorAll('.payment-form');
                paymentForms.forEach(function(form) {
                    form.style.display = 'none';
                });
                document.getElementById(paymentMethod + "-form").style.display = 'block';
            }
        </script>
    </head>
    <body>
        <h2>Shipping Details</h2>
        <p>Name: <%= name %></p>
        <p>Email: <%= mail %></p>
        <p>Phone Number: <%= phoneNumber %></p>
        <p>Ship to: <%= fullAddress %></p>
        <h2>Select Payment Method</h2>
        
        <input type="radio" name="method" value="debit" onclick="showPaymentForm('debit')"> Debit Card<br>
        <input type="radio" name="method" value="credit" onclick="showPaymentForm('credit')"> Credit Card<br>
        <input type="radio" name="method" value="ewallet" onclick="showPaymentForm('ewallet')"> E-Wallet<br>

        <form action="PaymentServlet/method=debit" method="POST" id="debit-form" class="payment-form" style="display:none;">
            <h2>Debit Card (Visa or MasterCard)</h2>
            <input type="radio" name="cardType" value="visa">Visa<br>
            <input type="radio" name="cardType" value="masterCard">MasterCard<br>
            
            <label for="card-number">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" required><br>

            <label for="card-holder">Name on Card:</label>
            <input type="text" id="cardName" name="cardName" required><br>

            <label for="expiry-date">Expiration Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/\d{2}" title="Please enter a valid expiration date in the format MM/YY" required><br>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" maxlength="3" pattern="\d{3}" required><br>

            <input type="submit" value="Submit Payment">
        </form>
        
        <form action="PaymentServlet/method=credit" method="POST" id="credit-form" class="payment-form" style="display:none;">
            <h2>Credit Card</h2>
            <input type="radio" name="cardType" value="visa">Visa<br>
            <input type="radio" name="cardType" value="masterCard">MasterCard<br>
            
            <label for="card-number">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" required><br>

            <label for="card-holder">Name on Card:</label>
            <input type="text" id="cardName" name="cardName" required><br>

            <label for="expiry-date">Expiration Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/\d{2}" title="Please enter a valid expiration date in the format MM/YY" required><br>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" maxlength="3" pattern="\d{3}" required><br>

            <input type="submit" value="Submit Payment">
        </form>
        
        <form action="PaymentServlet/method=ewallet" method="POST" id="ewallet-form" class="payment-form" style="display:none;">
            <h2>Ewallet</h2>
        </form>
       
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
