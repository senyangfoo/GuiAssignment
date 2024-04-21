<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function openCartDrawer() {
        document.getElementById("cart_drawer").classList.add("open");
        document.getElementById("overlay").classList.add("active");
    }

    function closeCartDrawer() {
        document.getElementById("cart_drawer").classList.remove("open");
        document.getElementById("overlay").classList.remove("active");
    }
</script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Music & Muse</title>
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

                    a {
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
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
                display: none;
            }

            .overlay.active {
                display: block;
            }
        </style>
    </head>
    <header>
        <div id="overlay" class="overlay" onclick="closeCartDrawer()"></div>
        <div class="HDcontainer">
            <div class="header1">
                <a href="index.jsp" ><img src="images/logo.png" alt="logo" class="logo"></a>
            </div>
            <div class="header2">
                <nav>
                    <ul>
                        <li><a href="product.jsp">Products</a></li>
                        <li><a href="">News & Events</a></li>
                        <li><a href="">Supports</a></li>
                        <li><a href="">About Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header3">
                <a href="" ><img src="images/search.svg" alt="avatar" class="search"></a>
                <a href="" ><img src="images/account_circle.svg" alt="avatar" class="avatar"></a>
                <a><img src="images/shopping_cart.svg" alt="cart" class="cart" onclick="openCartDrawer()"></a>
            </div>
            <div id="cart_drawer" class="cart_drawer">
                <div class="cart_drawer-content">
                    <div class="cart_drawer-headerContainer">
                        <a><img src="images/close.svg" alt="close" class="close" onclick="closeCartDrawer()"></a>
                        <h3>My Cart</h3>
                    </div>
                </div>
            </div>
        </div>
    </header>  
</html>
