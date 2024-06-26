<script>
    function scrollToContainer() {
        var container = document.getElementById('contentContainer');

        container.scrollIntoView({behavior: 'smooth'});
    }
    setInterval(function () {
        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('Animation');
                }
            });
        });

        observer.observe(document.querySelector('.productAnim'));
        observer.observe(document.querySelector('.salesAnim'));
//        observer.observe(document.querySelector('.eventsAnim'));
    }, 1);
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Function to call the servlet
        function callServlet() {
            $.ajax({
                url: 'ViewTopSalesIndex',
                success: function (data) {
                    console.log("success");
                },
                error: function () {
                    // Handle error
                    console.error('Failed to call servlet');
                }
            });
        }

        callServlet();
    });
</script>
<script>
    var refreshFlag = sessionStorage.getItem('refreshFlag');
    if (!refreshFlag) {
        setTimeout(function () {
            location.reload(true);
        }, 100);
        sessionStorage.setItem('refreshFlag', 'true');
    }
    setTimeout(function () {
        sessionStorage.removeItem('refreshFlag');
    }, 1000);
</script>
<script src="javascripts/slideEventHandler.js"></script>
<script>window.onload = auto();</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/header.jsp" %>  
<%@page  import="enums.prodCategory" %>
<%@page  import="model.Product" %>
<%@page  import="model.Orders" %>
<%@page  import="model.OrderDetail" %>
<%@page  import="model.ProductService" %>
<%   
   List<Orders> orderList = (List)session.getAttribute("orderList");
   List<OrderDetail> orderDetailList = (List)session.getAttribute("orderDetailList");
   ProductService productService = new ProductService();
   
    // Sort orderDetailList based on quantity sold
    for (int i = 0; i < orderDetailList.size(); i++) {
        for (int j = i + 1; j < orderDetailList.size(); j++) {
            int quantityI = orderDetailList.get(i).getQuantity();
            int quantityJ = orderDetailList.get(j).getQuantity();
                if (quantityI < quantityJ) {
                    // Swap elements if quantityI is less than quantityJ
                    OrderDetail temp = orderDetailList.get(i);
                    orderDetailList.set(i, orderDetailList.get(j));
                    orderDetailList.set(j, temp);
                }
        }
    }
%>
<!DOCTYPE html>
<html>
    <style>
        /*slideshow*/
        .slideContainer {
            display: inline-block;
            overflow: hidden;
            position: relative;

            button {
                background-color: transparent;
                border: 2px solid var(--primary_white_color);
                border-radius: 30px;
                color: var(--primary_white_color);
                cursor: pointer;
                font-size: var(--primary_font_size);
                padding: 15px 32px;
                position: absolute;
                transition: background-color 0.3s, color 0.3s;
            }

            button:hover {
                background-color: var(--primary_white_color);
                color: var(--primary_black_color);
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
                color: var(--primary_white_color);
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
                background-color: var(--secondary_black_color);
            }

            .dot {
                background-color: var(--secondary_black_color);
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
                background-color: var(--primary_black_color);
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

        .contentContainer{
            margin: 50px 50px 30px 50px;

            .productContainer{
                display: grid;
                grid-gap: 10px;
                grid-template-columns: repeat(4, 1fr);
                margin: 0 0 50px 0;

                .iconContainer{
                    overflow: hidden;
                    position: relative;
                    display: inline-block;

                    h2{
                        bottom: 25px;
                        color: var(--primary_white_color);
                        left: 15px;
                        margin: 0;
                        position: absolute;
                    }
                }

                img {
                    transition: transform 0.3s ease, filter 0.3s ease;
                    width: 100%;
                }

                img:hover {
                    filter: brightness(85%);
                    transform: scale(1.05);
                }
            }

            .topSalesContainer{
                display: grid;
                grid-gap: 10px;
                grid-template-columns: 20% 80%;
                margin: 0 0 50px 0;
            }

            .NewsEvenstContainer{
                display: grid;
                grid-gap: 10px;
                grid-template-columns: 20% 80%;
                margin: 0 0 50px 0;
            }

            .Animation {
                .Anim1 {
                    animation: slideFadeIn .8s;
                }
                .Anim2 {
                    animation: slideFadeIn 1s;
                }
                .Anim3 {
                    animation: slideFadeIn 1.2s;
                }
                .Anim4 {
                    animation: slideFadeIn 1.4s;
                }
            }
        }

        @keyframes slideFadeIn {
            0% {
                transform: translateY(10%);
                opacity: 0;
            }
            20% {
                opacicy: 0.2;
            }
            80% {
                transform: translateY(0%);
                opacity: 1;
            }
        }
    </style>
    <body onload="refreshPage()">
        <div class="slideContainer">
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()"><img src="images/piano.png" alt="piano"/><button class="buttonLeft" onclick="scrollToContainer()">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/guitar.png" alt="guitar"/><button class="buttonRight" onclick="scrollToContainer()">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/violin.png" alt="violin"/><button class="buttonLeft" onclick="scrollToContainer()">View Products</button></div>
            <div class="fadeAnimation imgSlide" onmouseover="pause()" onmouseout="resume()" style="display: none"><img src="images/drum.png" alt="drum"/><button class="buttonLeft" onclick="scrollToContainer()">View Products</button></div>

            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <div style="text-align:center; margin:10px 0 0 0;">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
            </div>
        </div>
        <div class="contentContainer" id="contentContainer">
            <div class="productAnim">
                <h2 class="Anim1">Products</h2>
                <div class="productContainer">
                    <div class="iconContainer Anim1"><a href="product.jsp?selectedValue=<%= prodCategory.piano%>"><img src="images/piano_icon.png" alt="piano_icon"/><h2>Pianos</h2></a></div>
                    <div class="iconContainer Anim2"><a href="product.jsp?selectedValue=<%= prodCategory.guitar%>"><img src="images/guitar_icon.png" alt="guitar_icon"/><h2>Guitars</h2></a></div>
                    <div class="iconContainer Anim3"><a href="product.jsp?selectedValue=<%= prodCategory.drum%>"><img src="images/drum_icon.png" alt="drum_icon"/><h2>Drums</h2></a></div>
                    <div class="iconContainer Anim4"><a href="product.jsp?selectedValue=<%= prodCategory.violin%>"><img src="images/violin_icon.png" alt="violin_icon"/><h2>Violins</h2></a></div>
                </div>
            </div>
            <div class="salesAnim">
                <h2 class="Anim1">Top Sales</h2>
                <% 
                    if(!orderList.isEmpty()){
                    
                    int count = 0;
                    double totalAmount = 0.0;
                    for (OrderDetail od : orderDetailList) {
                        if (count >= 1) {
                            break;
                        }

                        int productId = od.getProdId().getProdId();
                        Product prod = productService.getCurrentProductById(productId);
                %>
                <div class="topSalesContainer Anim1">
                    <img src="productImage/<%= prod.getImage() %>" style="width:100%;"/>
                    <div>
                        <h3><%= prod.getProdName() %></h3>
                        <p><%= prod.getDescription() %></p>
                    </div>
                </div>
                <%
                        count++;
                    }
                %>
                <% } else { %>
                <h3>No One Order Yet :C</h3>
                <% } %>
            </div>
            <!--                <div class="eventsAnim">
                                <h2 class="Anim1">News & Upcoming Events</h2>
                                <div class="NewsEvenstContainer Anim1">
                                    <img src="images/null_icon.png" width="100%"/>
                                    <div>
                                        <h3>Item Name</h3>
                                        <p>Description</p>
                                    </div>
                                </div>
                            </div>-->
        </div>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  