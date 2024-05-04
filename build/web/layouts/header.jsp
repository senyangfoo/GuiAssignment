<%@page import="java.util.*"%>
<%@page import="model.Cart" %>
<%@page import="model.CartService" %>
<%@page  import="enums.prodCategory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //Login Status
    boolean loginStatus = false;
    if(session.getAttribute("login")!=null){
       loginStatus = (Boolean) session.getAttribute("login");
   }
    
   //Cart Status
   List<Cart> cartProduct = null;
   ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
   if (cart_list != null) {
       cartProduct = (List<Cart>) session.getAttribute("cartProduct");
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

            function increaseCartValue(prodId) {
                var input = document.getElementById(prodId);
                input.stepUp();
                updateValueCart(prodId, input.value);
            }

            function decreaseCartValue(prodId) {
                var input = document.getElementById(prodId);
                input.stepDown();
                updateValueCart(prodId, input.value);
            }

            function updateValueCart(prodId, value) {
                var input = document.getElementById(prodId);
                input.setAttribute('value', value);
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
                        <li><a href="">News & Events</a></li>
                        <li><a href="">Supports</a></li>
                        <li><a href="aboutUs.jsp">About Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header3">
                <div class="search" ><img src="images/search.svg" alt="avatar" class="search" id="search" onclick="openSearchBar()" draggable="false">
                    <div class="searchbarContainer" id="searchbarContainer"><input type="text" placeholder="Search..." onblur="closeSearchBar()" id="searchInput" class="searchInput"></div>
                </div>
                <div class="avatar"><img src="images/account_circle.svg" alt="avatar" class="avatar" draggable="false">
                    <div class="avatarmenu">
                        <ul>
                            <% if(loginStatus == false){ %>
                            <li><a href="Login.jsp">Log In</a></li>
                                <% } %>
                                <% if(loginStatus == true){ %>
                            <li><a href="UserProfile.jsp">My Profile</a></li>
                                <% } %>
                            <li><a href="">Order History</a></li>
                            <li><a href="">Track Order</a></li>
                                <% if(loginStatus == true){ %>
                            <li><a href="logout.jsp">Logout</a></li>
                                <% } %>
                        </ul>
                    </div>
                </div>
                <div><img src="images/shopping_cart.svg" alt="cart" class="cart" onclick="checkLoginStatus()" draggable="false"></div>
            </div>
            <div id="cart_drawer" class="cart_drawer">
                <div class="cart_drawer-content">
                    <div class="cart_drawer-headerContainer">
                        <a><img src="images/close.svg" alt="close" class="close" onclick="closeCartDrawer()"></a>
                        <h3>My Cart</h3>
                    </div>
                    <% if(loginStatus == true){ %>
                    <%
                    if (cartProduct != null) {
                        for (Cart cart : cartProduct) {
                    %>
                    <img src ="images/<%= cart.getImage() %>" width="100" height="100">
                    <div class="item_details">
                        <h4><%= cart.getProdName() %></h4>
                        <h4><%= cart.getQuantity() %></h4>
                        <div class="quantitySelector">
                            <button type="button" onclick="decreaseCartValue('quanCart_<%= cart.getProdId() %>')">-</button>
                            <input type="number" name="quantity" id="quanCart_<%= cart.getProdId() %>" min="1" max="10" value="<%= cart.getQuantity() %>" disabled>
                            <button type="button" onclick="increaseCartValue('quanCart_<%= cart.getProdId() %>')">+</button>
                        </div>
                        <p>Price: $<%= cart.getPrice() %></p>
                    </div>
                    <% }
                    } else {
                    %>
                    <div class="cart_empty">Your cart is empty.</div>
                    <% } %>
                    <% } %>   
                </div>
            </div>
        </div>
    </header>  
</html>
