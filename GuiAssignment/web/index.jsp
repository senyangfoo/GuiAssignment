<%-- 
    Document   : index
    Created on : 24 Mar 2024, 1:35:15 PM
    Author     : foose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<html>
    <script src="javascripts/slideEventHandler.js"></script>
    <script>window.onload = auto();</script>
    <style>
        /*slideshow*/
        .slideContainer {
            display: inline-block;
            overflow: hidden;
            position: relative;

            button {
                background-color: transparent;
                border: 2px solid var(--primary_background_color);
                color: var(--primary_background_color);
                cursor: pointer;
                font-size: var(--primary_font_size);
                padding: 15px 32px;
                position: absolute;
                transition: background-color 0.3s, color 0.3s;
            }

            button:hover {
                background-color: var(--primary_background_color);
                color: var(--primary_font_color);
            }

            img {
                margin-top: -200px;
                width: 100%;
            }

            .buttonLeft {
                left: 3.5%;
                top: 76%;
            }

            .buttonRight {
                right: 33%;
                top: 76%;
            }

            .prev,
            .next {
                border-radius: 0 3px 3px 0;
                color: var(--primary_background_color);
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                margin-top: -22px;
                padding: 16px;
                position: absolute;
                top: 50%;
                transition: 0.3s ease;
                user-select: none;
                width: auto;
            }

            .next {
                border-radius: 3px 0 0 3px;
                right: 0;
            }

            .prev:hover,
                .next:hover {
                background-color: var(--secondary_background_color);
            }

            .dot {
                background-color: var(--secondary_background_color);
                display: inline-block;
                border-radius: 50%;
                cursor: pointer;
                height: 15px;
                margin: 0 2px;
                transition: background-color 0.1s ease;
                width: 15px;
            }

            .active,
            .dot:hover {
                background-color: var(--primary_font_color);
            }

            .fadeAnimation {
                animation-duration: 0.5s;
                animation-name: fadeAnimation;
            }

        }

        @keyframes fadeAnimation {
            from {
                opacity: .8
            }

            to {
                opacity: 1
            }
        }
    </style>
    <body>
        <div class="slideContainer">
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()"><img src="images/piano.png" alt="piano"/><button class="buttonLeft">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/guitar.png" alt="guitar"/><button class="buttonRight">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/violin.png" alt="violin"/><button class="buttonLeft">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/drum.png" alt="drum"/><button class="buttonLeft">View Products</button></div>

            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
            </div>
        </div>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  