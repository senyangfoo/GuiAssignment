<%@include file="layouts/header.jsp" %>  
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product p = (Product) session.getAttribute("product");
%>
<style>
    .rating {
        display: inline-block;
    }

    .rating input {
        display: none;
    }

    .rating label {
        cursor: pointer;
        width: 50px;
        height: 50px;
        margin: 0;
        padding: 0;
        font-size: 50px;
        line-height: 50px;
        text-align: center;
        color: #ddd;
        float: right; /* Align stars from right to left */
    }

    .rating label:before {
        content: '★';
    }

    .rating input:checked ~ label {
        color: #f90;
    }

    /* Optional styling for better appearance */
    .rating label:hover,
    .rating label:hover ~ label {
        color: #f90;
    } 
</style>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="SubmitReviewServlet?productID=<%= p.getProdId()%>" method="post">
            <img src ="images/<%= p.getImage() %>" width="200px" height="200px"><br/>
            <fieldset class="rating">
                <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star"></label>
                <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 stars"></label>
                <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 stars"></label>
                <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 stars"></label>
                <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 stars"></label>
            </fieldset><br/>
            <label for="comment">Comment:</label><br>
            <textarea name="comment" rows="4" cols="50"></textarea><br>
            <input type="submit" value="Submit Review">
        </form>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  