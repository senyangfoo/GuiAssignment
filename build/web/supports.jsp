<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {
                position: relative;

                .help {
                    width: 100%;
                    height: 400px;
                    background-color: var(--primary_brown_color);
                    color: var(--primary_white_color);
                    margin: 0 0 300px 0;

                    .info {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        margin: 0;
                        text-align: center;

                        .helpTitle {
                            font-size: var(--sixth-font-size);
                        }

                        .questionTitle {
                            font-size: var(--primary_font_size);
                        }

                        .questionInput {
                            width: 800px;
                            height: 40px;
                            font-size: var(--secondary-font-size);
                            border-radius: 10px;
                        }
                    }
                }

            }
        </style>
        <script>
            function validateForm() {
                alert("Thank you, we will reply your Email in 1-3 working days. Thank You!");
                window.location.href="index.jsp";
                return false;
            }
        </script>
    </head>
    <body>
        <div class="contentContainer">
            <div class="help">
                <div class="info">
                    <h1 class="helpTitle">Help Center</h1>
                    <p class="questionTitle">We are here to help you</p>
                    <form onsubmit="return validateForm()">
                        <input type="text" class="questionInput" name="question" placeholder="Type your question here:">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  
