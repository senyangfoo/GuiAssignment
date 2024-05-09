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
        <title>Music & Muse</title>
        <link rel="stylesheet" href="css/style.css">
        <script>
            function showPaymentForm(paymentMethod) {
                var paymentForms = document.querySelectorAll('.payment-form');
                paymentForms.forEach(function (form) {
                    form.style.display = 'none';
                });
                document.getElementById(paymentMethod + "-form").style.display = 'block';
            }
        </script>
        <style>
            .contentContainer {
                margin: 100px;
                display: grid;
                grid-gap: 20px;
                grid-template-columns: 50% 1fr;
                background-color: var(--primary_grey_color);

                .infoContainer {
                    margin: 10px;
                    border-right: 1px solid var(--primary_black_color);

                    .userInfoContainer {
                        padding: 0 0 20px 0;

                        .userName {
                            margin: 0;
                            font-size: var(--secondary-font-size);
                        }

                        .userDetail {
                            margin: 0;
                            font-size: var(--third-font-size);
                        }
                    }

                    .paymentDetailContainer {
                        padding: 0 20px 0 0;

                        .visaRadioContainer, .mastercardRadioContainer {
                            display: grid;
                            grid-template-columns: 2% 1fr;
                            grid-gap: 5px;

                            input {
                                margin: auto;
                            }

                            img{
                                width: 50px;
                                margin: auto auto auto 0;
                            }
                        }

                        .mastercardRadioContainer {
                            padding: 0 0 10px 0;
                        }

                        input[type="text"] {
                            border: 1px solid var(--third_grey_color);
                            outline: none;
                            margin: 0 0 20px 0;
                            height: 40px;
                            font-size: var(--fourth-font-size);

                        }

                        label {
                            font-size: var(--third-font-size);
                        }

                        .cardNum, .cardName {
                            width: 100%;
                        }

                        .gridContainer {
                            display: grid;
                            grid-template-areas:
                                'labelexp label labelccv'
                                'exp exp ccv';
                            grid-column-gap: 10px;
                            grid-template-columns: 70% 1fr;

                            .expLabel {
                                grid-area: labelexp;
                            }

                            .ccvLabel {
                                grid-area: labelccv;
                            }

                            .cardExp {
                                grid-area: exp;
                                width: 100%;
                            }

                            .cardCCV {
                                grid-area: ccv;
                                width: 100%;
                            }

                        }

                        .submitButton {
                            background-color: var(--primary_brown_color);
                            color: var(--primary_white_color);
                            width: 150px;
                            height: 40px;
                            font-size: var(--fourth-font-size);
                            cursor: pointer;
                        }
                    }
                }

                .prodDetailContainer {
                    padding: 10px 30px 10px 0;

                    .itemCard {
                        display: grid;
                        grid-template-columns: 20% 1fr;
                        grid-gap: 10px;
                        padding: 20px 5px 30px 5px;
                        border-bottom: 1px solid var(--primary_black_color);

                        .cardImage {
                            overflow: hidden;
                            justify-content: center;
                            align-items: center;

                            img {
                                max-width: 100%;
                                max-height: 100%;
                                min-height: auto;
                                width: auto;
                                height: auto;
                                margin: auto;
                            }
                        }

                        .item_details {

                            h4 {
                                margin: 0 0 10px 0;
                            }

                            p {
                                margin: 0;
                                font-size: var(--third-font-size);
                                margin: 0 0 2px 0;
                            }
                        }
                    }

                    .totalContainer {
                        display: grid;
                        grid-template-columns: 1fr 1fr;

                        .totalContainerTitle {
                            text-align: left;
                            margin: 10px 0;
                            font-size: var(--third-font-size);
                        }

                        .totalContainerValue {
                            text-align: right;
                            margin: 10px 0;
                            font-size: var(--fourth-font-size);
                        }

                        .bold {
                            font-weight: 600;
                        }
                    }
                }
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <div class="infoContainer">
                <div class="userInfoContainer">
                    <h2>Shipping Details</h2>
                    <p class="userName"><%= name %> (<%= mail %>)</p>
                    <p class="userDetail">+6 <%= phoneNumber %></p>
                    <p class="userDetail"><%= fullAddress %></p>
                </div>
                <h2>Select Payment Method</h2>

                <input type="radio" name="method" value="debit" onclick="showPaymentForm('debit')" class="debit"> Debit Card<br>
                <input type="radio" name="method" value="credit" onclick="showPaymentForm('credit')" class="credit"> Credit Card<br>
                <div class="paymentDetailContainer">

                    <form action="PaymentServlet?method=debit" method="POST" id="debit-form" class="payment-form" style="display:none;">
                        <h2>Debit Card (Visa or MasterCard)</h2>
                        <div class="visaRadioContainer"><input type="radio" name="cardType" value="visa" required><img src="images/visa.png" alt="visa"></div>
                        <div class="mastercardRadioContainer"><input type="radio" name="cardType" value="masterCard" required><img src="images/mastercard.png" alt="mastercard"></div>

                        <label for="card-number">Card Number</label>
                        <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" required class="cardNum">

                        <div class="gridContainer">
                            <label for="expiry-date" class="expLabel">Expiration Date</label>
                            <input type="text" id="expiryDate" name="expiryDate" class="cardExp" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/\d{2}" title="Please enter a valid expiration date in the format MM/YY" required>


                            <label for="cvv" class="ccvLabel">CCV</label>
                            <input type="text" id="ccv" name="ccv" maxlength="3" pattern="\d{3}" class="cardCCV" required>
                        </div>

                        <label for="card-holder">Name on Card</label>
                        <input type="text" id="cardName" name="cardName" required class="cardName">

                        <input type="submit" value="Place Order" class="submitButton">
                    </form>

                    <form action="PaymentServlet?method=credit" method="POST" id="credit-form" class="payment-form" style="display:none;">
                        <h2>Credit Card (Visa or MasterCard)</h2>
                        <div class="visaRadioContainer"><input type="radio" name="cardType" value="visa" required><img src="images/visa.png" alt="visa"></div>
                        <div class="mastercardRadioContainer"><input type="radio" name="cardType" value="masterCard" required><img src="images/mastercard.png" alt="mastercard"></div>

                        <label for="card-number">Card Number</label>
                        <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" required  class="cardNum">

                        <div class="gridContainer">
                            <label for="expiry-date" class="expLabel">Expiration Date</label>
                            <input type="text" id="expiryDate" name="expiryDate" class="cardExp" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/\d{2}" title="Please enter a valid expiration date in the format MM/YY" required>


                            <label for="cvv" class="ccvLabel">CCV</label>
                            <input type="text" id="ccv" name="ccv" maxlength="3" pattern="\d{3}" class="cardCCV" required>
                        </div>

                        <label for="card-holder">Name on Card</label>
                        <input type="text" id="cardName" name="cardName" required class="cardName">

                        <input type="submit" value="Place Order" class="submitButton">
                    </form>
                </div>
            </div>
            <div class="prodDetailContainer">
                <% if (cartProduct != null) { %>
                <h2>Product List</h2>
                <%
                    for (Cart cart : cartProduct) {
                %>
                <div class="itemCard">
                    <div class="cardImage">
                        <img src ="productImage/<%= cart.getImage() %>" width="100" height="100">
                    </div>
                    <div class="item_details">
                        <h4><%= cart.getProdName() %></h4>
                        <p>Quantity: <%= cart.getQuantity() %></p>
                        <p>Price: RM<%= String.format("%.2f", cart.getPrice()) %></p>
                        <p>Product Subtotal: RM<%= String.format("%.2f", cart.getPrice()*cart.getQuantity()) %></p>
                    </div>
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
                <div class="totalContainer">
                    <p class="totalContainerTitle">Subtotal</p>
                    <p class="totalContainerValue">RM <%= String.format("%.2f", subtotalPrice) %></p>
                    <p class="totalContainerTitle">Shipping Fee</p>
                    <p class="totalContainerValue"><%= (deliveryFee == 0.0) ? "Free" : "RM " + String.format("%.2f", deliveryFee) %></p>
                    <p class="totalContainerTitle bold">Total</p>
                    <p class="totalContainerValue bold"> RM <%= String.format("%.2f", total) %></p>
                </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
