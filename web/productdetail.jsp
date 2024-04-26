
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<%
    Product p = (Product) session.getAttribute("product");
%>
<style>
    .contentContainer {
        margin: 30px 50px 30px 50px;

        .prodContainer {
            display: grid;
            grid-gap: 30px;
            grid-template-columns: 45% 55%;
            overflow: hidden;

            .prodImg {
                width: 100%;
            }

            .prodPrice {
                font-size: var(--primary_font_size);
            }

            .quantityContainer {
                margin: 50px 0 10px 0;
                display: grid;
                grid-template-areas:
                    'quantityText quantityText'
                    'quantitySelector stockText';

                .quantityText {
                    font-size: var(--third-font-size);
                    grid-area: quantityText;
                }

                .quantitySelector {
                    grid-area:  quantitySelector;

                    input[type="number"] {
                        width: 50px;
                        text-align: center;
                        border: none;
                        -moz-appearance: textfield;
                    }

                    input[type=number]::-webkit-inner-spin-button,
                    input[type=number]::-webkit-outer-spin-button {
                        -webkit-appearance: none;
                        margin: 0;
                    }

                    input[type="number"]:focus {
                        border: none;
                        outline: none;
                    }

                    button {
                        cursor: pointer;
                        width: 30px;
                        height: 30px;
                        border: none;
                        color: var(--third_grey_color);
                        background-color: var(--secondary_grey_color);
                        font-weight: bold;
                    }
                }

                .stockText {
                    grid-area: stockText;
                    font-size: var(--third-font-size);
                }
            }

            .addCart {
                width: 70%;
                height: 50px;
                color: var(--primary_white_color);
                background-color: var(--primary_brown_color);
                cursor: pointer;
            }

            .descContainer {
                margin: 50px 0 10px 0;
                
                .descTitle {
                    font-size: var(--primary_font_size);
                }
                
                .desc {
                    font-size: var(--third-font-size);
                }
            }
        }
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
    </head>
    <body>
        <div class="contentContainer">
            <div class="prodContainer">
                <img src ="images/<%= p.getImage() %>" class="prodImg">
                <div class="detailContainer">
                    <h1><%= p.getProdName()%></h1>
                    <p class="prodPrice">RM <%= p.getPrice() %></p>
                    <div class="quantityContainer">
                        <p class="quantityText">Quantity</p>
                        <div class="quantitySelector">
                            <button id="decrement">-</button>
                            <input type="number" id="quantity" min="1" max="10" value="1">
                            <button id="increment">+</button>
                        </div>
                        <p class="stockText"><%= p.getStock()%> item(s) left</p>
                    </div>
                    <button class="addCart">Add to Cart</button>
                    <div class="descContainer">
                        <p class="descTitle">Description</p>
                        <p class="desc"><%= p.getDescription() %></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    var decrementButton = document.getElementById('decrement');
    var quantityInput = document.getElementById('quantity');

    decrementButton.addEventListener('click', function () {
        quantityInput.stepDown();
        updateDecrementButtonState();
    });

    document.getElementById('increment').addEventListener('click', function () {
        quantityInput.stepUp();
        updateDecrementButtonState();
    });

    quantityInput.addEventListener('input', function () {
        if (isNaN(this.value) || this.value.trim() === '') {
            this.value = 1;
        }
    });

    if (quantityInput.value.trim() === '') {
        quantityInput.value = 1;
    }

    function updateDecrementButtonState() {
        decrementButton.disabled = (quantityInput.value <= quantityInput.min);

        if (decrementButton.disabled) {
            decrementButton.style.color = 'var(--fourth_grey_color)';
        } else {
            decrementButton.style.color = 'var(--fourth_grey_color)';
        }
    }

    updateDecrementButtonState();
</script>