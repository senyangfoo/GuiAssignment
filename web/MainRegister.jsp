
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userDA" class="model.userDA" scope="application"></jsp:useBean>
<%@include file="layouts/header.jsp" %>  

<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
    </head>
    <style>
        .bgVideo {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            object-fit: cover;
        }

        .register {
            position: absolute;
            top: 25%;
            left: 36%;
            background-color: var(--secondary_white_color);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(10px);
            width: 450px;
            height: 550px;
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

            .buttonContainer {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));

                input {
                    width: 200px;
                    height: 40px;
                    font-size: var(--secondary-font-size);
                    cursor: pointer;
                }

                .create {
                    background-color: var(--primary_brown_color);
                    color: var(--primary_white_color);
                }
                .reset {
                    background-color: var(--primary_white_color);
                    color: var(--primary_brown_color);
                    border-color: var(--primary_brown_color);
                }
            }

            .login {
                text-align: center;
                text-decoration: none;
                color: var(--primary_black_color);

                :hover {
                    text-decoration: underline;
                }
            }
        }
    </style>
    <body  class="regContainer">
        <video autoplay muted loop id="bgVideo" class="bgVideo" draggable="false">
            <source src="images/background.mp4" type="video/mp4">
            <img src="images/background.png" style="width:100%" draggable="false">
        </video>
        <div id="register" class="register">
            <div class="titleContainer">
                <a href="index.jsp" class="titleBack"><img src="images/arrow_back.svg"></a>
                <h2>Register</h2>        
            </div>
            <c:if test="${requestScope.errorMsg !=null}">                       
                <div class="login-error" style="color: red;">
                    <p class="error">

                        ${requestScope.errorMsg}</p>
                </div>
            </c:if>
            <form method="POST" action="RegisterUser" >
                <label class="labelField">Username</label>
                <input type="text" id="userName" name="name" size="40" class="inputField" required/><br/>
                <label class="labelField">Email</label>
                <input type="text" id="userMail" name="mail" size="40" class="inputField" required/><br/>
                <label class="labelField">Password</label>
                <input type="password" name="password" size="40"  class="inputField" required/><br/>
                <label class="labelField">Confirm Password</label>
                <input type="password" name="confirmPass" size="40" class="inputField" required/>

                <div class="buttonContainer">
                    <input type="submit" value="Create" class="create"/>
                    <input type="reset" value="Reset" class="reset"/>
                </div>
            </form>
            <a  class="login" href="Login.jsp"><p>Login</p></a>
        </div>
    </body>
</html>

