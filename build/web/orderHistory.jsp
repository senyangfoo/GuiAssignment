<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@page  import="model.Orders" %>
<%@page  import="model.OrderDetail" %>
<%@page  import="model.ProductService" %>
<%@include file="layouts/header.jsp" %>
<%
   List<Orders> orderList = (List)session.getAttribute("custorderList");
   List<OrderDetail> orderDetailList = (List)session.getAttribute("custorderDetailList");
   ProductService productService = new ProductService();
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer{
                margin: 100px 100px 300px 100px;
                display: grid;
                grid-gap: 20px;
                grid-template-columns: 1fr;
                background-color: var(--primary_grey_color);
                padding: 20px;

                .itemCard {
                    display: grid;
                    grid-template-columns: 20% 1fr 10%;
                    grid-gap: 10px;
                    padding: 20px 5px 30px 5px;
                    border-bottom: 1px solid var(--primary_black_color);

                    .cardImage {
                        overflow: hidden;
                        justify-content: center;
                        align-items: center;

                        img {
                            max-width: 100%;
                            max-height: 100%;
                            min-height: auto;
                            width: auto;
                            height: auto;
                            margin: auto;
                        }
                    }

                    .itemSoldDetails {

                        h3 {
                            margin: 0 0 10px 0;
                        }

                        p {
                            margin: 0;
                            font-size: var(--fourth-font-size);
                            margin: 10px 0 2px 0;
                        }
                    }

                }

                .totalContainer {
                    display: grid;
                    width: 90%;
                    grid-template-columns: 90% 1fr;
                    margin: auto;

                    p {
                        text-align: right;
                        margin: 10px 0;
                        font-size: var(--fourth-font-size);
                        font-weight: 600;
                    }
                }
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <h2>Order History</h2>
            <%
               if(!orderList.isEmpty()){
                // Display top 10 sold products
                int count = 0;
                double totalAmount = 0.0;
                for (OrderDetail od : orderDetailList) {
                    if (count >= 10) {
                        break;
                    }

                    int productId = od.getProdId().getProdId();
                    int quantitySold = od.getQuantity();
                    Product prod = productService.getCurrentProductById(productId);
            %>
            <div class="itemCard"> 
                <div class="cardImage">
                    <img src="productImage/<%= prod.getImage() %>">
                </div>
                <div class="itemSoldDetails">
                    <h3><%= prod.getProdName() %></h3>
                    <p>x<%= quantitySold %></p>
                    <% 
                        double subtotal= prod.getPrice() * quantitySold;
                        totalAmount += subtotal;                        
                    %>
                </div>
                <div class="itemSoldPrice">
                    <p><%= String.format("%.2f", prod.getPrice()) %> <span style="font-size: var(--third-font-size); color: var(--third_black_color)">each</span></p>
                    <p><%= String.format("%.2f", subtotal) %> <span style="font-size: var(--fourth-font-size); color: var(--third_black_color)">total</span></p>
                </div>
            </div> 
            <%
                    count++;
                }
            %>
            <div class="totalContainer">
                <p>Total Amount(RM)</p>
                <p><%= String.format("%.2f", totalAmount) %></p>
            </div>
            <% } else { %>
            <h3>You don't have any order</h3>
            <% } %>           
        </div>   
    </body>
</html>
<%@include file="layouts/footer.jsp" %>