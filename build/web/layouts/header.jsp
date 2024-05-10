<%@page import="java.util.*"%>
<%@page import="model.Cart" %>
<%@page import="model.Product" %>
<%@page import="model.CartService" %>
<%@page  import="enums.prodCategory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //Login Status
    boolean loginStatus = false;
    boolean staffLogin = false;
    int cId = 0;
    int sId = 0;
    if(session.getAttribute("login")!=null){
       loginStatus = (Boolean) session.getAttribute("login");
       cId = (Integer) session.getAttribute("customerId");
   }
   if(session.getAttribute("staffLogin")!=null){
        staffLogin = (Boolean) session.getAttribute("staffLogin");
   }
    
    //Cart Status
    List<Cart> cartProduct = null;
    List<Product> cartProductList = null;
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
       cartProduct = (List<Cart>) session.getAttribute("cartProduct");
       cartProductList = (List<Product>) session.getAttribute("cartProductList");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Music & Muse</title>
        <script>
            function openCartDrawer() {
                document.getElementById("cart_drawer").classList.add("open");
                document.getElementById("overlay").classList.add("active");
            }

            function checkLoginStatus() {
                var loginstatus = <%= loginStatus %>;
                if (!loginstatus) {
                    window.location.href = "Login.jsp";
                } else {
                    openCartDrawer();
                }
            }

            function closeCartDrawer() {
                document.getElementById("cart_drawer").classList.remove("open");
                document.getElementById("overlay").classList.remove("active");
            }

            function showProductImage(id) {
                var element = document.getElementById(id);
                setTimeout(function () {
                    element.style.opacity = "0.2";
                    element.style.right = "0";
                }, 1);
            }

            function hideProductImage(id) {
                var element = document.getElementById(id);
                element.style.opacity = "0";
                element.style.right = "-10px";
            }

            function openSearchBar() {
                var searchbarContainer = document.getElementById("searchbarContainer");
                var searchInput = document.getElementById("searchInput");
                if (searchbarContainer.style.opacity === "0" || searchbarContainer.style.opacity === "") {
                    searchbarContainer.style.opacity = "100";
                    searchbarContainer.style.pointerEvents = "auto";
                    searchInput.focus();
                } else {
                    searchbarContainer.style.opacity = "0";
                }
            }

            function closeSearchBar() {
                var searchbarContainer = document.getElementById("searchbarContainer");
                searchbarContainer.style.opacity = "0";
            }

            function increaseCartValue(prodId, priceId, price) {
                var input = document.getElementById(prodId);
                var priceName = document.getElementById(priceId);
                var textNodes = priceName.childNodes;

                input.stepUp();
                updateValueCart(prodId, input.value);
//                for (var i = 0; i < textNodes.length; i++) {
//                    if (textNodes[i].nodeType === Node.TEXT_NODE) {
//                        textNodes[i].textContent = "RM " + price.toFixed(2) + " ";
//                    }
//                }

            }

            function decreaseCartValue(prodId, priceId, price) {
                var input = document.getElementById(prodId);
                var priceName = document.getElementById(priceId);
                var textNodes = priceName.childNodes;

                input.stepDown();
                updateValueCart(prodId, input.value);
//                for (var i = 0; i < textNodes.length; i++) {
//                    if (textNodes[i].nodeType === Node.TEXT_NODE) {
//                        textNodes[i].textContent = "RM " + price.toFixed(2) + " ";
//                    }
//                }
            }

            function updateValueCart(prodId, value) {
                var input = document.getElementById(prodId);
                input.setAttribute('value', value);
            }
            //admin login gateway
            var counter = 0;

            function clickCount() {
                counter++;

                if (counter === 5) {
                    alert("Unexpected Error accured!!");
                }
                if (counter === 10) {
                    window.location.href = 'AdminMain.jsp';
                }
            }
        </script>
        <style>
            /*header*/
            .HDcontainer {
                border-bottom: 1px solid var(--secondary_black_color);
                display: grid;
                grid-template-columns: 20% 60% 20%;
                height: 100px;
                max-height: 100px;
                position: relative;
                width: 100%;
                background-color: var(--primary_white_color);

                .header1 {
                    margin: auto auto auto 20%;
                    text-align: center;

                    img {
                        width: 100%;
                    }
                }

                .header2 {
                    nav {
                        background-color: white;
                    }

                    nav ul li {
                        float: left;
                        margin-right: 4%;
                    }

                    nav ul li a {
                        color: var(--primary_black_color);
                        display: block;
                        font-size: var(--primary_font_size);
                        line-height: 150%;
                        margin-top: 20px;
                        text-align: center;
                        text-decoration: none;
                        width: 100%;
                    }

                    nav ul li a:hover {
                        cursor: pointer;
                        text-decoration: underline;
                    }

                    ul,
                    ol {
                        list-style: none;
                    }
                }

                .header3 {
                    display: flex;
                    margin: 20px 0 20px 0;
                    text-align: center;

                    div:not(.avatarmenu, .searchbarContainer) {
                        margin: auto 0 auto 40px;
                        cursor: pointer;
                    }

                    img {
                        width: 150%;
                    }
                }
            }

            .HDcontainer::after {
                clear: both;
            }

            .cart_drawer {
                position: fixed;
                top: 0;
                right: -500px;
                width: 500px;
                height: 100%;
                background-color: var(--primary_white_color);
                transition: right 0.5s;
                z-index: 1000;
            }

            .cart_drawer.open {
                right: 0;
            }

            .cart_drawer-content {
                padding: 16px;
                height: 100%;
                width: 100%;

                .cart_drawer-headerContainer {
                    border-bottom: 2px solid var(--secondary_black_color);
                    display: grid;
                    grid-template-columns: 6% 94%;
                    padding: 0 0 16px 0 ;
                    h3 {
                        margin: auto auto auto auto ;
                    }
                }

                img.close {
                    width: 30px;
                    cursor: pointer;
                }

                .cart_empty {
                    position: absolute;
                    top: 50%;
                    width: 100%;
                    text-align: center;
                }

                .item_details {
                    padding: 10px 0;

                    .item {
                        max-height: 480px;
                        overflow: auto;

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

                            .cardContent {
                                display: grid;
                                grid-template-areas:
                                    'title title empty remove'
                                    'price price empty quantity';

                                .cardProdName {
                                    grid-area: title;
                                    margin: 0;
                                    font-size: var(--secondary-font-size);
                                }

                                .cardRemoveProd {
                                    grid-area: remove;
                                    margin: 0 0 auto auto;
                                    display: inline-block;
                                    width: 25px;

                                    img {
                                        display: block;
                                        width: 100%;
                                        height: auto;
                                    }
                                }

                                .cardPrice {
                                    grid-area: price;
                                    margin: auto auto 0 0;

                                    .cardEachPrice {
                                        margin: 0;
                                        font-size: var(--third-font-size);
                                    }

                                    .cardTotalPrice {
                                        margin: 0;
                                        font-size: var(--fourth-font-size);
                                    }
                                }

                                .cardQuantitySelector {
                                    grid-area: quantity;
                                    margin: auto 0 0 auto;

                                    input[type="number"] {
                                        width: 30px;
                                        background-color: var(--primary_white_color);
                                        font-size: var(--third-font-size);
                                        border: none;
                                        text-align: center;
                                        -moz-appearance: textfield;
                                    }

                                    input[type=number]::-webkit-inner-spin-button,
                                    input[type=number]::-webkit-outer-spin-button {
                                        -webkit-appearance: none;
                                        margin: 0;
                                    }

                                    button {
                                        cursor: pointer;
                                        width: 25px;
                                        height: 25px;
                                        border: none;
                                        border-radius: 10%;
                                        color: var(--third_grey_color);
                                        background-color: var(--secondary_grey_color);
                                        font-weight: bold;
                                    }
                                }
                            }
                        }
                    }

                    .summary {
                        position: absolute;
                        padding: 0 0 16px 0;
                        width: 93.5%;
                        bottom: 0;

                        button {
                            width: 100%;
                            height: 50px;
                            background-color: var(--primary_brown_color);
                            color: var(--primary_white_color);
                            font-size: var(--fourth-font-size);
                            cursor: pointer;
                        }

                        .subTotal {
                            display: grid;
                            grid-template-columns: auto auto;
                        }
                    }
                }
            }
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.3);
                z-index: 999;
                display: none;
            }

            .overlay.active {
                display: block;
            }

            div.avatar {
                position: relative;
            }

            .avatarmenu {
                position: absolute;
                background-color: var(--primary_white_color);
                opacity: 0;
                z-index: 1;
                white-space: nowrap;
                transition: opacity 0.2s ease, transform 0.2s ease;
                transform: translateY(-10px);
                pointer-events: none;
                box-shadow: 5px 5px 20px 0px var(--secondary_brown_color);
                border-radius: 0 6px 6px 6px;
                overflow: hidden;

                ul {
                    list-style-type: none;
                    padding: 0;
                    margin: 0;

                }

                li {
                    text-align: left;
                    border-radius: 6px;
                }

                li a {
                    display: block;
                    padding: 12px 30px 16px 10px;
                    text-decoration: none;
                    color: var(--primary_black_color);
                }

                a:hover {
                    background-color: var(--secondary_grey_color);
                    color: var(--primary_brown_color);
                    transform: scale(1.01);
                }

            }

            .avatar:hover .avatarmenu{
                pointer-events: auto;
                opacity: 1;
                transform: translateY(0);
            }

            div.products {
                position: relative;
            }

            .productsmenu {
                position: absolute;
                width: 100%;
                max-height: 230px;
                left: 0;
                padding: 20px 20px 20px 22%;
                background-color: var(--primary_white_color);
                opacity: 0;
                z-index: 1000;
                white-space: nowrap;
                transition: opacity 0.2s ease, transform 0.2s ease;
                transform: translateY(-10px);
                pointer-events: none;
                overflow: hidden;
                ul {
                    list-style-type: none;
                    padding: 0;
                    margin: 0;
                }

                li {
                    text-align: left;
                    clear: both;
                }

                li a {
                    text-decoration: none;
                    color: var(--primary_black_color);
                    text-decoration: none !important;
                    font-size: 18px !important;
                }

                a:hover {
                    color: var(--primary_brown_color);
                    transform: scale(1.03) translateX(2px);
                }

                .piano_product {
                    width: 35%;
                    opacity: 0;
                    position: absolute;
                    right: -10px;
                    bottom: -50%;
                    transition: opacity 0.2s ease, right 0.2s ease;
                }

                .guitar_product {
                    width: 35%;
                    opacity: 0;
                    position: absolute;
                    right: -10px;
                    bottom: -20%;
                    transition: opacity 0.2s ease, right 0.2s ease;
                }

                .drum_product {
                    width: 35%;
                    opacity: 0;
                    position: absolute;
                    right: -10px;
                    bottom: -20%;
                    transition: opacity 0.2s ease, right 0.2s ease;
                }

                .violin_product {
                    width: 35%;
                    opacity: 0;
                    position: absolute;
                    right: -10px;
                    bottom: -32%;
                    transition: opacity 0.2s ease, right 0.2s ease;
                }
            }

            .products:hover .productsmenu{
                pointer-events: auto;
                opacity: 100;
                transform: translateY(0);
            }

            .search {
                position: relative;

                .searchbarContainer {
                    position: absolute;
                    right: 0;
                    opacity: 0;
                    width: auto;
                    padding: 5px;
                    border: 1px solid var(--primary_black_color);
                    background-color: var(--primary_white_color);
                    border-radius: 6px 0 6px 6px;
                    transition: opacity 0.08s;
                    pointer-events: none;
                    transform: translateY(-8px) translateX(8px);

                    .searchInput {
                        font-size: var(--secondary-font-size);
                        float: right;
                        border: none;
                    }

                    .searchInput:focus {
                        border: none;
                        outline: none;
                    }
                }
            }
        </style>
    </head>
    <header>
        <div id="overlay" class="overlay" onclick="closeCartDrawer()"></div>
        <div class="HDcontainer">
            <div class="header1">
                <a href="index.jsp" ><img src="images/logo.png" alt="logo" class="logo" draggable="false"></a>
            </div>
            <div class="header2">
                <nav>
                    <ul>
                        <li class="products"><a href="ViewProduct">Products</a>
                            <div class="productsmenu">
                                <ul>
                                    <li><a href="product.jsp?selectedValue=<%= prodCategory.piano%>" onmouseover="showProductImage('piano_product')" onmouseout="hideProductImage('piano_product')">Pianos</a></li>
                                    <li><a href="product.jsp?selectedValue=<%= prodCategory.guitar%>" onmouseover="showProductImage('guitar_product')" onmouseout="hideProductImage('guitar_product')">Guitars</a></li>
                                    <li><a href="product.jsp?selectedValue=<%= prodCategory.drum%>" onmouseover="showProductImage('drum_product')" onmouseout="hideProductImage('drum_product')">Drums</a></li>
                                    <li><a href="product.jsp?selectedValue=<%= prodCategory.violin%>" onmouseover="showProductImage('violin_product')" onmouseout="hideProductImage('violin_product')">Violins</a></li>
                                </ul>
                                <img src="images/piano_product.png" class="piano_product" id="piano_product">
                                <img src="images/guitar_product.png" class="guitar_product" id="guitar_product">
                                <img src="images/drum_product.png" class="drum_product" id="drum_product">
                                <img src="images/violin_product.png" class="violin_product" id="violin_product">
                            </div>
                        </li>
                        <li><a href="NewsEvent.jsp">News & Events</a></li>
                        <li><a href="supports.jsp">Supports</a></li>
                        <li><a href="aboutUs.jsp">About Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header3">
                <div class="search" ><img src="images/search.svg" alt="avatar" class="search" id="search" onclick="openSearchBar()" draggable="false">
                    <div class="searchbarContainer" id="searchbarContainer">
                        <form action="SearchProduct" method="GET">
                            <input type="text" placeholder="Search..." onblur="closeSearchBar()" id="searchInput" class="searchInput" name="searchInput">
                        </form>
                    </div>
                </div>
                <div class="avatar"><img src="images/account_circle.svg" alt="avatar" class="avatar" draggable="false" onclick="clickCount()">
                    <div class="avatarmenu">
                        <ul>
                            <% if(loginStatus == false && staffLogin == false){ %>
                            <li><a href="Login.jsp">Log In</a></li>
                                <% }  %>
                                <% 
                                   String viewOrderLink = "";
                                   if(loginStatus == true){ 
                                   viewOrderLink = "ViewOrder?customerId=" + cId;
                                %>
                            <li><a href="UserProfile.jsp">My Profile</a></li>
                                <% } %>
                                <% if(staffLogin == true) { %>
                            <li><a href="StaffProfile.jsp">My Profile</a></li>
                                <% } %>
                                <% if(staffLogin == true){ %>
                            <li><a href="StaffMain.jsp">Console</a></li>
                                <% } %>
                                <% if(loginStatus == true){ %>
                            <li><a href="<%= viewOrderLink %>">Order History</a></li>
                                <% } %>
                                <% if(loginStatus == true || staffLogin == true){ %>
                            <li><a href="logout.jsp">Logout</a></li>
                                <% } %>
                        </ul>
                    </div>
                </div>
                <% if(staffLogin == false){ %>
                <div><img src="images/shopping_cart.svg" alt="cart" class="cart" onclick="checkLoginStatus()" draggable="false"></div>
            </div>
            <div id="cart_drawer" class="cart_drawer">
                <div class="cart_drawer-content">
                    <div class="cart_drawer-headerContainer">
                        <a><img src="images/close.svg" alt="close" class="close" onclick="closeCartDrawer()"></a>
                        <h3>My Cart</h3>
                    </div>
                    <% if(loginStatus == true){ %>
                    <% if (cartProduct != null) { %>
                    <div>
                    </div>
                    <div class="item_details">
                        <div class="item">
                            <% float subTotal = 0;%>
                            <%
                                for (Cart cart : cartProduct) {
                            %>
                            <div class="itemCard">
                                <div class="cardImage">
                                    <img src ="productImage/<%= cart.getImage() %>" width="100" height="100">
                                </div>
                                <div class="cardContent">
                                    <p class="cardProdName"><%= cart.getProdName() %></p>
                                    <a href="RemoveProductFromCart?productID=<%= cart.getProdId() %>" class="cardRemoveProd"><img src="images/delete.svg" alt="remove"></a>
                                    <div class="cardQuantitySelector">
                                        <a href="EditCart?productID=<%= cart.getProdId() %>&quantity=<%= (cart.getQuantity()-1) %>"><button type="button">-</button></a>
                                        <input type="number" name="quantity" id="quanCart_<%= cart.getProdId() %>" min="1" max="<%= cart.getStock() %>" value="<%= cart.getQuantity() %>" disabled>
                                        <a href="EditCart?productID=<%= cart.getProdId() %>&quantity=<%= (cart.getQuantity()+1) %>""><button type="button">+</button></a>
                                    </div>
                                    <div class="cardPrice">
                                        <p class="cardEachPrice">RM <%= String.format("%.2f", cart.getPrice()) %> <span style="font-size: var(--fifth-font-size); color: var(--third_black_color)">each</span></p>
                                        <p class="cardTotalPrice" id="priceCart_<%= cart.getProdId() %>">RM <%= String.format("%.2f", cart.getPrice()*cart.getQuantity())%> <span style="font-size: var(--third-font-size); color: var(--third_black_color)">total</span></p>
                                    </div>
                                </div>
                            </div>
                            <% subTotal += cart.getPrice()*cart.getQuantity();%>
                            <% } %>
                        </div>
                        <div class="summary">
                            <div class="subTotal">
                                <h3 style="text-align: left;">Subtotal:</h3>
                                <h3 style="text-align: right;">RM <%= String.format("%.2f", subTotal) %></h3>
                            </div>
                            <button onclick="location.href = 'Checkout.jsp';">Checkout</button>
                        </div>
                        <% } else {
                        %>
                        <div class="cart_empty">Your cart is empty</div>
                        <% } %>
                        <% } %>   
                    </div>
                </div>
            </div>
            <% } %>
    </header>  
</html>
