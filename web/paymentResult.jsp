<%-- 
    Document   : paymentResult
    Created on : 7 May 2024, 10:07:39 pm
    Author     : Abcong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5; URL=ViewCart">
        <title>Payment Successfull</title>
        <style>
            .contentContainer {
                margin: 200px;
                text-align: center;

                .paymentSuccessContainer {
                    img {
                        width: 100px;
                    }

                    a {
                        text-align: center;
                        text-decoration: underline;
                        color: var(--primary_black_color);
                    }
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="layouts/header.jsp" /> 
        <div class="contentContainer">
            <div class="paymentSuccessContainer">
                <img src="images/check_circle.svg">
                <h1>${requestScope.title}</h1>
                <h3>${requestScope.message}</h3>
                <p>Redirecting back to home in 5 seconds...</p>
                <a href="ViewCart">Back to Home</a>
            </div>
        </div>
    </body>
</html>
