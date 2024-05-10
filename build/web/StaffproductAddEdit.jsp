<%@page  import="enums.prodCategory" %>
<%@include file="layouts/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product p = (Product) session.getAttribute("product");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {
                margin-top: 10%;
                position: fixed;
                display: grid;
                border: 3px solid black;
                margin-left: 25%;
                height: 300px;
                width: 700px;
                justify-content: center;
                text-align: center;
                h2{
                    text-align: center;
                }
                input.input{
                    float: right;
                    width: 35em;
                }
                label{
                    float: left;
                }
               
  
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <%
                if(p != null){%>
            <h2>Edit Product</h2>
            <form action="StaffEditProduct?prodId=<%= p.getProdId()%>" method="POST">
                <label>Product Name</label>
                <input class="input" type="text" name="prodName" size="70" value="<%= p.getProdName()%>" required></br>
                <label>Product Image File Name</label>
                <input class="input" type="text" name="prodImage" size="100" value="<%=  p.getImage() %>" required></br>
                <label>Product Category</label>
                <select name="prodCategory">
                    <%
                       int count = 0;
                       for (prodCategory option: prodCategory.values()) {
                            if (count > 0) {
                    %>
                    <option value="<%= option.name() %>" <%= option.name().equals(p.getCategory()) ? "selected" : "" %>><%= option.name() %></option>
                    <% 
                            }
                        count++;
                     }
                    %>
                </select></br>
                <label>Product Description</label>
                <input class="input" type="text" style="height: 80px;" name="prodDesc" size="70" value="<%= p.getDescription() %>"></br></br></br></br>
                <label>Product Price</label>
                <input class="input" type="number" name="prodPrice" min="0" value="<%= String.format("%.2f", p.getPrice())%>" required></br>
                <label>Product Stock</label>
                <input class="input" type="number" name="prodStock" min="0" value="<%= p.getStock()%>" required></br></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {%>
                <h2>Add Product</h2>
                <form action="StaffAddProduct" method="POST" enctype="multipart/form-data">
                    <label>Product Name</label>
                    <input class="input" type="text" name="prodName" size="70" required></br>
                    <label>Product Image File</label>
                    <input type="file" name="prodImage" accept="image/*" required></br>
                    <label>Product Category</label>
                    <select name="prodCategory"">
                        <%
                           int count = 0;
                           for (prodCategory option: prodCategory.values()) {
                                if (count > 0) {
                        %>
                        <option value="<%= option %>"><%= option %></option>
                        <% 
                                }
                            count++;
                         }
                        %>
                    </select></br>
                    <label>Product Description</label>
                    <input class="input" style="height: 80px;" type="text" name="prodDesc" size="70"></br></br></br></br>
                    <label>Product Price</label>
                    <input class="input" type="number" name="prodPrice" min="0" size="0" required></br>
                    <label>Product Stock</label>
                    <input class="input" type="number" name="prodStock" min="0" size="0" required></br></br>
                    <input type="submit" value="Add" >
                 </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("product");
%>
