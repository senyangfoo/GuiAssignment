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

            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <%
                if(p != null){%>
            <h2>Edit Product</h2>
            <form action="EditProduct?prodId=<%= p.getProdId()%>" method="POST">
                Product Name
                <input type="text" name="prodName" size="80" value="<%= p.getProdName()%>" required></br>
                Product Image File Name
                <input type="text" name="prodImage" size="100" value="<%=  p.getImage() %>" required></br>
                Product Category
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
                Product Description
                <input type="text" name="prodDesc" size="200" value="<%= p.getDescription() %>"></br>
                Product Price
                <input type="number" name="prodPrice" min="0" value="<%= String.format("%.2f", p.getPrice())%>" required></br>
                Product Stock
                <input type="number" name="prodStock" min="0" value="<%= p.getStock()%>" required></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {%>
                <h2>Add Product</h2>
                <form action="AddProduct" method="POST">
                    Product Name
                    <input type="text" name="prodName" size="80" required></br>
                    Product Image File Name
                    <input type="text" name="prodImage" size="100" required></br>
                    Product Category
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
                    Product Description
                    <input type="text" name="prodDesc" size="200"></br>
                    Product Price
                    <input type="number" name="prodPrice" min="0" size="52" required></br>
                    Product Stock
                    <input type="number" name="prodStock" min="0" size="10" required></br>
                    <input type="submit" value="Add" >
                 </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("product");
%>