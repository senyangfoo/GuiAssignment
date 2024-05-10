<%-- 
    Document   : AdminLogin.jsp
    Created on : May 7, 2024, 12:35:35 AM
    Author     : khtee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            .contentContainer {
                width: 100%;
                overflow: hidden;

                .bgVideo {
                    position: absolute;
                    width: 100%;
                    max-width: 100%;
                    height: 100%;
                    overflow: hidden;
                    object-fit: cover;
                    transform: scale(1.5);
                    filter: opacity(0.2);
                }

                .formContainer {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    margin: 0;
                    text-align: center;
                }

                .inputContainer {
                    display: grid;
                    grid-template-columns: 30% 1fr;
                    grid-gap: 5px;
                    text-align: right;

                    input {
                        width: 100%;
                    }
                }
            }
        </style>
    </head>
    <body class="contentContainer">
        <video autoplay muted loop id="bgVideo" class="bgVideo" draggable="false">
            <source src="images/fellas.mp4" type="video/mp4">
        </video>
        <div class="formContainer">
            <h1>Admin Login</h1>
            <form action="j_security_check" method="POST">
                <div class="inputContainer">
                    <label>ID:</label>
                    <input type="text" name="j_username"/>
                    <label>Password:</label>
                    <input type="password" name="j_password"/>
                </div>
                <input type="submit" value="Login"/>
                <a href="MainRegister.jsp"><button>Back</button></a>
            </form>
        </div>
    </body>
</html>
