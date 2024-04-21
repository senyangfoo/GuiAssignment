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
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "domain.Product" %>
<%@ page import = "java.sql.*" %>

<jsp:useBean id="pda" class="da.ProductDA"></jsp:useBean>

<%
    List<Product> products = null;
    pda.getConnection(); 
    products = pda.getAllProduct();   
%>
<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<html>
    <style>
        .contentContainer {
            margin: 30px 50px 30px 50px;

            .titleContainer {
                border-bottom: 2px solid var(--primary_black_color);
                margin: 0 0 30px 0;

                h2 {
                    margin: 0 0 10px 0;
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
        }
    </style>
    <body>
        <div class="contentContainer">
            <div class="titleContainer">
                <h2>Product List</h2>
            </div>
            <div class = "productContainer">
                <%
                    if(!products.isEmpty()){
                        for(Product p : products){%>
                <a href="ProductDetailServlet?productID=<%= p.getProdId()%>" class="cardContainer" >
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
        </div>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  