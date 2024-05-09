<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Product" %>
<%@include file="layouts/header.jsp" %>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Product> productList = (List)session.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {
                margin: 50px 0 0 250px;
                display: grid;
                position: relative;
            }
            button.addButton{
                position: relative;
                left: 80.85%;
                color: black;
                background-color: white;
                border-radius: 5px 5px 5px 5px;
                width: 200px;
                height: 50px;
                -webkit-text-stroke: 1px black; /* width and color */
                  transition-duration: 1s;
                transition-property: background-color;
            }
            button.addButton:hover{
                color: white;
                background-color: black;
                -webkit-text-stroke: 1px white; /* width and color */
                  transition-duration: 0.5s;
                transition-property: background-color;
            }
            table.prodTable{
                border: 3px solid black;
                border-collapse: collapse;
                width: 1200px;
                margin-top: 20px;
            }
            td,th{
                
                border: 1px solid black;
            }
            td.id{
                width: 50px;
                text-align: center;
            }
            td.img{
                width: 100px;
                text-align: center;
            }
            td.name{
                width: 200px;
                text-align: left;
            }
            td.desc{
                width: 450px;
                text-align: left;
            }
            td.cat{
                width: 150px;
                text-align: left;
            }
            td.price{
                width: 150px;
                text-align: left;
            }
            td.stock{
                width: 80px;
                text-align: center;
            }
            td.action{
                width: 80px;
                text-align: center;
            }
            tr{
                height: 45px;
            }
            tr.header{
                -webkit-text-stroke: 1px black; /* width and color */
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <button onclick="window.location.href = 'productAddEdit.jsp'" class="addButton">Add Product</button>
            <table class="prodTable">
                <tr class="header">
                    <td class="id">ID</td>
                    <td class="img">Image</td>
                    <td class="name">Name</td>
                    <td class="desc">Description</td>
                    <td class="cat">Category</td>
                    <td class="price">Price</td>
                    <td class="stock">Stock</td>
                    <td class="action">Action</td>
                </tr>
                <%
                    if(!productList.isEmpty()){
                        for(Product p : productList){%>
                <tr>
                    <td class="id"><%= p.getProdId()%></td>
                    <td class="img"><img src ="productImage/<%= p.getImage() %>" style="width: 100px;"></td>
                    <td class="name"><%= p.getProdName()%></td>
                    <td class="desc"><%= p.getDescription() %></td>
                    <td class="cat"><%= p.getCategory() %></td>
                    <td class="price">RM <%= String.format("%.2f", p.getPrice()) %></td>
                    <td class="stock"><%= p.getStock() %></td>
                    <td class="action"><a href="RetrieveProduct?productID=<%= p.getProdId()%>"><i class="material-icons" style="color: black;">&#xe254;</i></a> <a href="DeleteProduct?productID=<%= p.getProdId()%>" onclick="return confirm('Are u sure u want to DELETE this Product?')"><i class="material-icons" style="color: black;">&#xe872;</i></a></td>
                </tr>
                <%}
            }
                %>
            </table>
        </div>
    </body>
</html>
