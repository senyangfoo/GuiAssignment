<%@page import="java.util.*"%>
<%@page import="model.Cart" %>
<%@page import="model.CartService" %>
<%@page  import="enums.prodCategory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
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
    String mail = (String)request.getSession().getAttribute("mail");
    String fullAddress= (String)session.getAttribute("fullAddress");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/298f4ece43.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <form action="CheckOutServlet" method="POST" >
                <h2>Shipping Info</h2>
                <p>Email: <%= mail %></p>
                <label>Phone Number: </label>
                <input type="tel" name="phoneNumber" placeholder="012345678" pattern="01[0-9]{9}" maxlength="11" required><br/>
                <label>Address: </label>
                <input type="text" name="address" class="inputField" required/><br/>
                <label>Post Code: </label>
                <input type="text" name="postcode" class="inputField" pattern="\d{5}"  maxlength="5" required/><br/>
                <label>City: </label>
                <input type="text" name="city" class="inputField" required/><br/>
                <label>Unit No (optional): </label>
                <input type="text" name="unitNo" class="inputField"/><br/>
                <label>State: </label>
                <select id="state" name="state" required>
                    <option value="" selected disabled>Select State</option>
                    <option value="Johor">Johor</option>
                    <option value="Kedah">Kedah</option>
                    <option value="Kelantan">Kelantan</option>
                    <option value="Melaka">Melaka</option>
                    <option value="Negeri Sembilan">Negeri Sembilan</option>                        
                    <option value="Pahang">Pahang</option>
                    <option value="Perak">Perak</option>
                    <option value="Perlis">Perlis</option>
                    <option value="Pulau Pinang">Pulau Pinang</option>
                    <option value="Sabah">Sabah</option>
                    <option value="Sarawak">Sarawak</option>
                    <option value="Selangor">Selangor</option>
                    <option value="Terengganu">Terengganu</option>
                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                    <option value="Labuan">Labuan</option>
                    <option value="Putrajaya">Putrajaya</option>  
                </select><br/>
                
                <a href="index.jsp">Back<a/>
                <input type="submit" value="Payment" name="submit" class="submitButton"/>
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
