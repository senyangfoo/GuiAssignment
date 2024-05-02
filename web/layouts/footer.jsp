<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        footer {
            max-height: 250px;
            padding: 20px 20px 20px 20px;
            overflow: hidden;
            background-image: url('images/woodcolor.png');
            background-size: cover;

            .FTContainer {
                height: 250px;
                width: 100%;
                display: grid;
                grid-template-columns: 30% 15% 15% 15% 15% 10%;
                grid-gap: 10px;

                h3{
                    color: var(--primary_white_color);
                }

                ul {
                    list-style: none;
                    padding: 0;

                    li {
                        padding: 0 0 10px 0;
                    }

                    li a {
                        color: var(--primary_white_color);
                        text-decoration: none;
                        font-size: var(--third-font-size);
                        color: var(--primary_grey_color);
                    }

                    li a:hover {
                        text-decoration: underline;
                    }
                }

                .footer1 {
                    a img {
                        width: 380px;
                        float: right;
                    }
                }

                .footer5 {
                    img{
                        width: 40px;
                        margin-right: 10px;
                        border-radius: 50%;
                    }
                }
            }
        }
    </style>
    <footer>
        <div class="BgImg">
            <div class="FTContainer">
                <div class="footer1">
                    <a href="index.jsp" draggable="false"><img src="images/logo_white.png" alt="logo" class="logo" draggable="false"></a>
                </div>
                <div class="footer2">
                    <h3>Products</h3>
                    <ul>
                        <li><a href="">Pianos</a></li>
                        <li><a href="">Guitars</a></li>
                        <li><a href="">Drums</a></li>
                        <li><a href="">Violins</a></li>
                    </ul>
                </div>
                <div class="footer3">
                    <h3>Services</h3>
                    <ul>
                        <li><a href="">News & Events</a></li>
                        <li><a href="">Supports</a></li>
                        <li><a href="">About Us</a></li>
                    </ul>
                </div>
                <div class="footer4">
                    <h3>Contacts</h3>
                    <ul>
                        <li><a href="tel:+601112345678">+6012 345 6789</a></li>
                        <li><a href="mailto:Tarc@gmail.com">MusicMuse@gmail.com</a></li>
                        <li><a href="https://www.google.com/maps?q=TARUMT,+KL,+Malaysia">TARUMT, KL, Malaysia</a></li>
                    </ul>
                </div>
                <div class="footer5">
                    <h3>Socials</h3>
                    <ul>
                        <li><a href="https://www.youtube.com/watch?v=NhHb9usKy6Q"><img src="images/ig.jpg" alt="Instagram"></a><a href="https://www.youtube.com/watch?v=NhHb9usKy6Q"><img src="images/facebook.png" alt="Instagram"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</html>
