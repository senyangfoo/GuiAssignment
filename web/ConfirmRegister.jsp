<%@page import="model.Customer"%>
<jsp:useBean id="user" class="model.Customer" scope="session"></jsp:useBean>
<jsp:setProperty name="user" property="*" />
<%@page import = "java.util.*;" %>
<%@page import = "model.Customer;" %>
<%@include file="layouts/header.jsp" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .bgVideo {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                object-fit: cover;
            }

            .confirmReg {
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

                p{
                    color: var(--promary_black_color);
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

                    .confirm {
                        background-color: var(--primary_brown_color);
                        color: var(--primary_white_color);
                    }
                    .cancel {
                        background-color: var(--primary_white_color);
                        color: var(--primary_brown_color);
                        border-color: var(--primary_brown_color);
                    }
                }
            }
        </style>
    </head>
    <body class="confirmRegContainer">
        <video autoplay muted loop id="bgVideo" class="bgVideo" draggable="false">
            <source src="images/background.mp4" type="video/mp4">
            <img src="images/background.png" style="width:100%" draggable="false">
        </video>
        <div class="confirmReg">
            <p>You entered the following data</p>

            <p>Name: <%= user.getCustName() %></p>
            <p>Mail: <%= user.getCustEmail() %></p>
            <p>Password : <%= user.getCustPassword() %></p>

            <form method="post" action="Register.jsp">
                <div class="buttonContainer">
                    <input type="submit" value="Confirm"  class="confirm">
                    <input type="button" value="Cancel" onclick="location = 'MainRegister.jsp'" class="cancel"/>
                </div>
            </form>
        </div>
    </body>
</html>
