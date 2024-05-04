<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@page  import="enums.prodCategory" %>
<%
   List<Product> productList = (List)session.getAttribute("productList");
%>
<%@include file="layouts/header.jsp" %>  
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var elements = document.querySelectorAll('.prodDesc');
        elements.forEach(function (el) {
            var text = el.textContent.trim();
            if (text.length > 30) {
                el.textContent = text.substring(0, 50) + '...';
            }
        });
    });

    function changeCategory() {
        var selectedCategory = document.getElementById("category").value;
        var products = document.getElementsByClassName("cardContainer");
        var emptyBox = document.querySelector(".emptyProduct");
        var productCount = 0;

        for (var i = 0; i < products.length; i++) {
            var category = products[i].getAttribute("data-category");
            if (selectedCategory === "all" || category === selectedCategory) {
                products[i].style.display = "block";
                productCount++;
            } else {
                products[i].style.display = "none";
            }
        }

        if (productCount <= 0) {
            emptyBox.style.display = "block";
        } else {
            emptyBox.style.display = "none";
        }
    }
</script>
<!DOCTYPE html>
<html>
    <style>
        .contentContainer {
            margin: 30px 50px 30px 50px;

            .titleContainer {
                border-bottom: 2px solid var(--primary_black_color);
                margin: 0 0 30px 0;
                display: grid;
                grid-template-columns: 1fr 1fr;
                justify-content: space-between;

                h2 {
                    margin: 0 0 10px 0;
                    justify-self: start;
                }

                .catogoryContainer {
                    justify-self: end;
                    width: 25%;

                    select {
                        font-size: var(--secondary-font-size);
                        color: var(--primary_black_color);
                        width: 100%;
                        padding: 5px;
                        border: none;
                        outline: none;
                        appearance: none;
                        -webkit-appearance: none;
                        -moz-appearance: none;
                        background-image: url('images/filter_alt.svg');
                        background-repeat: no-repeat;
                        background-position: right center;
                        padding-right: 20px;
                    }
                }
            }

            .productContainer {
                display: grid;
                grid-gap: 10px;
                grid-template-columns: repeat(5, 1fr);

                .cardContainer {
                    background-color: var(--primary_grey_color);
                    border-radius: 10px;
                    min-width: 200px;
                    height: 420px;
                    color: var(--primary_black_color) ;
                    text-decoration: none;
                    margin: 0 0 20px 0;
                    transition: transform .2s, box-shadow .2s;

                    .card {
                        .card_imgContainer {
                            overflow: hidden;
                            height: 300px;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                        }

                        .card_imgContainer img {
                            max-width: 100%;
                            max-height: 100%;
                            min-height: auto;
                            width: auto;
                            height: auto;
                            margin: auto;
                        }

                        .card_textContainer {
                            margin: 0 10px 0 10px;

                            .prodName {
                                margin: 10px 0 5px 0;
                                font-size: var(--secondary-font-size);
                                letter-spacing: 0.8px;
                            }

                            .prodDesc {
                                margin: 0 0 10px 0;
                                font-size: var(--third-font-size);
                                letter-spacing: 0.5px;
                                color: var(--third_black_color);
                            }

                            .prodPrice {
                                margin: 20px 0 20px 0;
                                font-size: var(--third-font-size);
                                letter-spacing: 0.5px;
                                color: var(--primary_brown_color);
                            }
                        }
                    }
                }

                .cardContainer:hover {
                    transform: scale(1.01);
                    box-shadow: 2px 2px 10px var(--secondary_brown_color);
                }
            }

            .emptyProduct {
                display: none;
                width: 100%;
                height: 250px;

                h2 {
                    text-align: center;
                }
            }
        }
    </style>
    <body>
        <div class="contentContainer">
            <div class="titleContainer">
                <h2>Product List</h2>
                <div class="catogoryContainer">
                    <select id="category" name="category" onchange="changeCategory()">
                        <%
                            for (prodCategory option: prodCategory.values()) {
                        %>
                        <option value="<%= option %>"><%= option %></option>
                        <% 
                         }
                        %>
                    </select>
                </div>
            </div>
            <div class = "productContainer">
                <%
                    if(!productList.isEmpty()){
                        for(Product p : productList){%>
                <a href="ProductDetailServlet?productID=<%= p.getProdId()%>" class="cardContainer" data-category='<%= p.getCategory() %>'>
                    <div class="card">
                        <div class="card_imgContainer">
                            <img src ="images/<%= p.getImage() %>">
                        </div>
                        <div class="card_textContainer">
                            <p class="prodName"><%= p.getProdName()%></p>
                            <p class="prodDesc"><%= p.getDescription() %></p>
                            <p class="prodPrice">RM <%= p.getPrice() %></p>
                        </div>
                    </div>
                </a>
                <%}
            }
                %>
            </div>
            <div class="emptyProduct"><h2>No products found!</h2></div>
        </div>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  