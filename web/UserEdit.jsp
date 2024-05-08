<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                .titleContainer {
                    display: grid;
                    grid-template-columns: 6% 94%;
                    padding: 0 0 10px 0;

                    h2 {
                        color: var(--primary_black_color);
                        margin: auto auto auto 10px;
                    }

                    .titleBack img {
                        cursor: pointer;
                        transition: background-color .2s ease, border-radius .2s ease;
                        border-radius: 50%;
                        margin: 5px 0 0 0;
                    }

                    .titleBack img:hover {
                        background-color:  var(--secondary_white_color);
                        border-radius: 50%;
                    }

                }

                .inputField {
                    width: 100%;
                    padding: 10px;
                    background-color: var(--primary_white_color);
                    font-size: var(--secondary-font-size);
                    border: 1px solid var(--primary_white_color);
                    border-radius: 5px;
                    outline: none;
                    margin: 0 0 20px 0;
                    transition: border .1s ease;
                }

                .inputField:focus {
                    border: 1px solid var(--primary_black_color);
                }

                .labelField {
                    color: var(--primary_black_color);
                    font-size: var(--secondary-font-size);
                }

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
            <div class="titleContainer">
                <a href="UserProfile.jsp" class="titleBack"><img src="images/arrow_back.svg"></a>
                <h2>User Profile</h2>
            </div>
            <c:if test="${requestScope.errorMsg !=null}">                       
                <div class="login-error" style="color: red;">
                    <p class="error">

                        ${requestScope.errorMsg}</p>
                </div>
            </c:if>
            <form action="EditUser" method="POST">
                <label class="labelField">Username</label>
                <input type="text" name="name" value="<%= name %>" class="inputField" required>
                <label class="labelField">Email</label>
                <input type="text" name="mail" value="<%= mail %>" class="inputField" required>
                <label class="labelField">Password</label>
                <input type="text" name="password" value="<%= password %>" class="inputField" required>
                <input type="submit" value="Confirm" class="button">
            </form>
        </div>
    </body>
</html>
