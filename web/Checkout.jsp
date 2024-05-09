<%@page import="java.util.*"%>
<%@page import="model.Cart" %>
<%@page import="model.CartService" %>
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
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Music & Muse</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="https://kit.fontawesome.com/298f4ece43.js" crossorigin="anonymous"></script>
        <style>
            .contentContainer {
                margin: 100px;
                display: grid;
                grid-gap: 20px;
                grid-template-columns: 55% 1fr;
                background-color: var(--primary_grey_color);

                .infoContainer {
                    padding: 10px;

                    .emailContainer{
                        padding: 0 0 20px 0;

                        .emailTitle {
                            margin: 0;
                            font-size: var(--third-font-size);
                        }

                        .email {
                            margin: 0;
                            font-size: var(--secondary-font-size);
                        }
                    }

                    .shipAdressContainer {

                        padding: 0 20px 0 0;

                        input, select {
                            border: 1px solid var(--third_grey_color);
                            outline: none;
                            margin: 0 0 20px 0;
                            height: 40px;
                            font-size: var(--fourth-font-size);

                        }

                        label {
                            font-size: var(--third-font-size);
                        }

                        .state, .phone, .address {
                            width: 100%;
                        }

                        .addressDetailContainer {
                            display: grid;
                            grid-template-areas:
                                'label label label'
                                'postcode city unitno';
                            grid-column-gap: 10px;

                            .postcode {
                                grid-area: postcode;
                                width: 100%;
                            }

                            .city {
                                grid-area: city;
                                width: 100%;
                            }

                            .unitno {
                                grid-area: unitno;
                                width: 100%;
                            }
                        }
                    }

                    .buttonContainer {
                        padding: 10px 0;

                        .back {
                            background-color: var(--primary_white_color);
                            color: var(--primary_brown_color);
                            border-color: var(--primary_brown_color);
                            width: 150px;
                            height: 40px;
                            font-size: var(--fourth-font-size);
                            cursor: pointer;
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
                    padding: 10px 30px 0 0;

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
                <form action="CheckOutServlet" method="POST" style="border-right: 1px solid var(--primary_black_color);" >
                    <h2>Checkout</h2>
                    <div class="emailContainer">
                        <p class="emailTitle">Email</p>
                        <p class="email"><%= mail %></p>
                    </div>
                    <div class="shipAdressContainer">
                        <h3>Shipping Address</h3>
                        <label>State</label>
                        <select id="state" name="state" required class="state">
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
                        </select>
                        <label>Phone Number</label>
                        <input type="tel" name="phoneNumber" placeholder="012345678" pattern="01[0-9]{9}" maxlength="11" required class="phone"><br/>
                        <label>Address</label>
                        <input type="text" name="address" class="address" required/><br/>
                        <div class="addressDetailContainer">
                            <label>Post Code</label>
                            <input type="text" name="postcode" class="postcode" pattern="\d{5}"  maxlength="5" required/>
                            <label>City</label>
                            <input type="text" name="city" class="city" required/>
                            <label>Unit No (optional)</label>
                            <input type="text" name="unitNo" class="unitno"/>
                        </div>
                    </div>
                    <div class="buttonContainer">
                        <button onclick="window.location.href = 'index.jsp'" class="back">Back</button>
                        <input type="submit" value="Payment" name="submit" class="submitButton"/>
                    </div>
                </form>
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
