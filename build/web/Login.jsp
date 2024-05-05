<%@include file="layouts/header.jsp" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*;" %>
<%@page import = "model.Customer;" %>
<%@page import = "java.sql.*;" %>
<jsp:useBean id="customer" class="model.Customer" scope="session"></jsp:useBean>
<%@page import="model.Customer, java.util.*" %>

<!DOCTYPE html>
<% 
     loginStatus = false;
 Object loginStatusObj = session.getAttribute("login");
    if (loginStatusObj != null) {
        loginStatus = Boolean.parseBoolean(loginStatusObj.toString());
    }
%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/298f4ece43.js" crossorigin="anonymous"></script>
        <style>
            .loginContainer {
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

            .login {
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
                        margin: auto auto auto auto;
                    }

                    .titleBack img {
                        cursor: pointer;
                        transition: background-color .2s ease, border-radius .2s ease;
                        border-radius: 50%;
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

                .submitButton {
                    margin: 10px 0 0 0;
                    width: 100%;
                    height: 40px;
                    background-color: var(--primary_brown_color);
                    color: var(--primary_white_color);
                    font-size: var(--secondary-font-size);
                    cursor: pointer;
                }
                
                .register {
                    text-align: center;
                    text-decoration: none;
                    color: var(--primary_black_color);
                    
                    :hover {
                        text-decoration: underline;
                    }
                }         
            }
        </style>
    </head>
    <body class="loginContainer">
        <video autoplay muted loop id="bgVideo" class="bgVideo" draggable="false">
            <source src="images/background.mp4" type="video/mp4">
            <img src="images/background.png" style="width:100%" draggable="false">
        </video>
        <div class="login">
            <div class="titleContainer">
                <a href="index.jsp" class="titleBack"><img src="images/arrow_back.svg"></a>
                <h2>Login</h2>        
            </div>
            <c:if test="${requestScope.errorMsg !=null}">                       
                <div class="login-error" style="color: red;">
                    <p class="error">

                        ${requestScope.errorMsg}</p>
                </div>
            </c:if>
            <form action="RetrieveUser" method="POST" >
                <label class="labelField">Username</label>
                <input type="text" name="name" class="inputField" required/><br/>
                <label class="labelField">Password</label>
                <input type="password" name="password" class="inputField" required/><br/>
                <input type="submit" value="Login" name="submit" class="submitButton"/>
            </form>
                <a  class="register" href="MainRegister.jsp"><p>Don't have an account? Register</p></a>
                 <a  class="register" href="StaffLogin.jsp"><p>Staff Login</p></a>
        </div>
    </body>
</html>
