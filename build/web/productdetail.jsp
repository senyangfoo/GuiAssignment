
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

            .prodImg {
                width: 100%;
            }

            .prodPrice {
                font-size: var(--primary_font_size);
            }

            .quantityContainer {
                margin: 60px 0 10px 0;
                display: grid;
                grid-template-areas:
                    'quantityText quantityText'
                    'quantitySelector stockText';

                .quantityText {
                    font-size: var(--third-font-size);
                    grid-area: quantityText;
                    margin: 0 0 0 0;
                }

                .quantitySelector {
                    grid-area:  quantitySelector;
                    margin: auto 0 auto 0;

                    input[type="number"] {
                        width: 50px;
                        font-size: var(--third-font-size);
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

            .addcart{

                input {
                    width: 70%;
                    height: 50px;
                    color: var(--primary_white_color);
                    background-color: var(--primary_brown_color);
                    cursor: pointer;
                    font-size: var(--secondary-font-size);
                }
            }

            .descContainer {
                margin: 60px 0 10px 0;

                .descTitle {
                    font-size: var(--primary_font_size);
                }

                .desc {
                    font-size: var(--third-font-size);
                }
            }
        }

        .ratingSalesContainer {
            display: flex;
            align-items: center;
        }

        .stars {
            display: inline-block;
            font-size: 24px;
        }

        .reviewContainer {
            width: 90%;

            .reviewTitle {
                font-size: var(--primary_font_size);
                border-bottom: 2px solid var(--primary_black_color);
                padding: 10px 0 5px 0;
            }

            .reviewContent {
                width: 100%;
                padding: 10px 10px 0 10px;
            }

            .timeUserName {
                font-size: var(--third-font-size);
                margin: 10px 0 10px 0;
                color: var(--third_black_color);
            }

            .text {
                font-size: var(--secondary-font-size);
            }

            .breakline {
                border-bottom: 1px solid var(--third_grey_color);
                padding: 0 0 30px 0;
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
        <form action="AddCart?productID=<%=p.getProdId()%>" method="post">
            <div class="contentContainer">
                <div class="prodContainer">
                    <img src ="images/<%= p.getImage() %>" class="prodImg">
                    <div class="detailContainer">
                        <h1 style="margin: 10px auto 0 auto"><%= p.getProdName()%></h1>
                        <div class="ratingSalesContainer">
                            <div class="stars" data-rating="0"></div>
                            <p>(0)</p>
                            <p style="padding: 0 10px">|</p>
                            <p>200 Sold</p>
                        </div>
                        <p class="prodPrice">RM <%= String.format("%.2f", p.getPrice())%></p>
                        <div class="quantityContainer">
                            <p class="quantityText">Quantity</p>
                            <div class="quantitySelector">
                                <button type="button" id="decrement">-</button>
                                <input type="number" name="quantity" id="quantity" min="1" max="<%=p.getStock()%>" value="1">
                                <button type="button" id="increment">+</button>
                            </div>
                            <p class="stockText"><%= p.getStock()%> item(s) left</p>
                        </div>
                        <div class="addcart"><input type="submit" value="Add To Cart"></div>
                        <div class="descContainer">
                            <p class="descTitle">Description</p>
                            <p class="desc"><%= p.getDescription() %></p>
                        </div>
                    </div>
                </div>
                <div class="reviewContainer">
                    <p class="reviewTitle">Reviews</p>
                    <div class="reviewContent">
                        <div class="stars" data-rating="5"></div>
                        <p class="timeUserName">5/5/2024 Mr Superman</p>
                        <p class="text">非常好鋼琴 使我琴鍵旋轉</p>
                        <div class="breakline"></div>
                    </div>
                </div>
            </div>
        </form>

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

    quantityInput.addEventListener('blur', function () {
        if (isNaN(this.value) || this.value.trim() === '' || this.value === '0') {
            this.value = 1;
            updateDecrementButtonState();
        } else if (this.value > <%=p.getStock()%>) {
            this.value = <%=p.getStock()%>;
            updateDecrementButtonState();
        }
    });

    function updateDecrementButtonState() {
        decrementButton.disabled = (quantityInput.value <= quantityInput.min);

        if (decrementButton.disabled) {
            decrementButton.style.color = 'var(--fourth_grey_color)';
        } else {
            decrementButton.style.color = 'var(--third_grey_color)';
        }
    }

    function updateValue(newValue) {
        quantityInput.setAttribute('value', newValue);
    }

    setInterval(function () {
        var newValue = quantityInput.value;
        updateValue(newValue);
    }, 1000);

    updateDecrementButtonState();

    const starsDivs = document.querySelectorAll('.stars');

    starsDivs.forEach(starsDiv => {
        const ratingValue = parseInt(starsDiv.dataset.rating);
        displayRating(starsDiv, ratingValue);
    });

    function displayRating(starsDiv, value) {
        const stars = '★★★★★';
        const emptyStars = '☆☆☆☆☆';
        starsDiv.textContent = stars.slice(0, value) + emptyStars.slice(value);
    }

    displayRating(ratingValue);
</script>
<%@include file="layouts/footer.jsp" %>  