<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer" %>
<%
    String name = (String)request.getSession().getAttribute("name");
     String mail = (String)request.getSession().getAttribute("mail");
     String password = (String)request.getSession().getAttribute("password");
 
%> 
<%@include file="layouts/header.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <style>
            .contentContainer {
                width: 100%;
                padding: 0;
            }

            .bgVideo {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                object-fit: cover;
            }

            .detailContainer {
                position: absolute;
                top: 25%;
                left: 37%;
                background-color: var(--secondary_white_color);
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(10px);
                width: 400px;
                height: 500px;
                border-radius: 20px;
                padding: 30px 20px;
                
                .button {
                    margin: 10px 0 0 0;
                    width: 100%;
                    height: 40px;
                    background-color: var(--primary_brown_color);
                    color: var(--primary_white_color);
                    font-size: var(--secondary-font-size);
                    cursor: pointer;
                }
            }
        </style>
    </head>
    <body class="contentContainer">
        <video autoplay muted loop id="bgVideo" class="bgVideo" draggable="false">
            <source src="images/background.mp4" type="video/mp4">
            <img src="images/background.png" style="width:100%" draggable="false">
        </video>
        <div class="detailContainer">
            <h2>User Profile</h2>
            <p>Name: <%= name %></p>
            <p>Mail: <%= mail %></p>

            <p>Password : <%= password %></p>
            <a href="UserEdit.jsp"><button class="button">Edit Profile</button></a>
        </div>
    </body>
</html>
