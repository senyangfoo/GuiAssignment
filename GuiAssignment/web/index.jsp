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