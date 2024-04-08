<%-- 
    Document   : header
    Created on : 24 Mar 2024, 2:17:31 PM
    Author     : foose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Music & Muse</title>
        <style>
            /*header*/
            .HDcontainer {
                border-bottom: 1px solid var(--secondary_background_color);
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
                    nav ul li {
                        float: left;
                        margin-right: 4%;
                    }

                    nav ul li a {
                        color: var(--primary_font_color);
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
                    }

                    img {
                        width: 150%;
                    }
                }
            }

            .HDcontainer::after {
                clear: both;
            }
        </style>
    </head>
    <header>
        <div class="HDcontainer">
            <div class="header1">
                <a href="index.jsp" ><img src="images/logo.png" alt="logo" class="logo"></a>
            </div>
            <div class="header2">
                <nav>
                    <ul>
                        <li><a href="">Products</a></li>
                        <li><a href="">News & Events</a></li>
                        <li><a href="">Supports</a></li>
                        <li><a href="">About Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header3">
                <a href="" ><img src="images/search.svg" alt="avatar" class="search"></a>
                <a href="" ><img src="images/account_circle.svg" alt="avatar" class="avatar"></a>
                <a href="" ><img src="images/shopping_cart.svg" alt="cart" class="cart"></a>
            </div>
        </div>
    </header>  
</html>
