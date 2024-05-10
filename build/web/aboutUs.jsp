<%@include file="layouts/header.jsp" %>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Your Music Instrument Store</title>
        <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    </head>
    <style>
        header h1 {
            font-family: bold;
            font-size: 50px;
        }
        .detail {
            display: flex; /* Use flexbox to arrange sections */
            justify-content: space-between; /* Align sections to left, center, and right */
            margin: 0 auto; /* Center the container */
            max-width: 1200px; /* Limit the maximum width of the container */
        }
        .detail section {
            flex: 1; /* Each section takes equal space */
            border: 3px #DEB887 solid;

        }
        .detail h2 {
            font-family: bold;
            text-align: center;
            text-decoration: underline;
            text-decoration-color: cyan;
        }

        footer {
            text-align: center;
        }
        .history {
            display: flex;
            align-items: center; /* Vertically center the content */
            justify-content: space-between; /* Space between content and image */
            div {
                display: block;
                text-align: center;
                margin: 0 200px 0 200px;
                border: 3px #DEB887 solid;

            }
            h2 {
                text-align: center;
            }

        }
        .history img {
            max-width: 40%; /* Adjust the width of the image as needed */
            margin-left: 20px; /* Add some space between the text and image */
            padding-right: 200px;
        }
        /* Styles for the container */
        /* Styles for the container */
        /* Styles for the container */
        .type {
            display: block;
        }

        /* Styles for individual sections */
        .type > div {
            clear: both; /* Ensure each div starts on a new line */
            margin-bottom: 20px;
            overflow: hidden; /* Clear float and contain floated elements */
            border: 3px #DEB887 solid;

        }

        /* Styles for left images */
        .left-section {
            float: left;
            width: 300px; /* Set the width */
            margin-right: 15px;
        }

        /* Styles for right images */
        .right-section {
            float: right;
            width: 300px; /* Set the width */
            margin-left: 15px;
        }

        /* Clear floats */
        .type::after {
            content: "";
            display: table;
            clear: both;
        }
        .detail section ul,li{
            list-style: none;
        }

        /* Define consistent font family */
        body {
            font-family: Arial, sans-serif;
        }

        /* Consistent border style and color */
        .detail section, .history div, .type > div {
            border: 3px solid #DEB887;
        }

        /* Padding and margin adjustments */
        .detail {
            margin: 20px auto;
            padding: 20px;
        }

        .detail section {
            padding: 20px;
        }

        .history {
            margin: 20px auto;
            padding: 20px;
        }

        .history div {
            margin: 20px;
            padding: 20px;
        }

        .type {
            margin: 20px auto;
            padding: 20px;
        }

        .type > div {
            margin-bottom: 40px;
            padding: 20px;
        }

        /* Button styling */
        button {
            background-color: #DEB887;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #D2A679;
        }

        /* Image styling */
        img {
            max-width: 100%;
            height: auto;
        }

        /* Responsive design */
        @media only screen and (max-width: 768px) {
            .detail, .history, .type {
                flex-direction: column;
            }
            .detail section, .history div, .type > div {
                margin: 10px auto;
            }
        }

    </style>
    <body>
        <main>
            <header>
                <h1><center>About Us</center></h1>
            </header>

            <div class="detail">
                <section>
                    <h2>Our Mission</h2>
                    <p>Welcome to Rhythm & Muse. We claim to be the best online music instrument store in the Country. At Rhythm & Muse, we harmonize the worlds of rhythm and inspiration, we provide you with a seamless shopping experience and a wide range of instruments to suit your passion for music, such as pianos, guitars, drums, violins and more. Besides giving consumers an easier way to consume musical instruments on our website, we also host many exciting activities and events from time to time. Plus, with our secure online payment methods, you can shop with a peace of mind, knowing that your transactions are safe and convenient. No need to worry about logistics issues, our efficient shipping methods guarantee that your instrument arrives safely and swiftly at your doorstep. So what are you waiting for? come and join us and discover the perfect instrument to accompany your musical journey.
                        oh and is there any changes u want to make on the project? If not then I will start screenshot the pages</p>
                </section>
                <section>
                    <h2>Our Story</h2>
                    <p>Founded by music enthusiasts, our store was created with one goal: to provide top-notch instruments and exceptional service.</p>
                </section>
                <section>
                    <h2>What Sets Us Apart</h2>
                    <ul>
                        <li>Quality Assurance: Each instrument is carefully selected for superior sound and performance.</li>
                        <li>Expertise: Our friendly team offers expert advice and support to make your shopping experience enjoyable.</li>
                        <li>Community Engagement: We believe in fostering a vibrant musical community through workshops and events.</li>
                    </ul>
                </section>
            </div>
            <div class="history">
                <div>
                    <h2>Musical Instrument History</h2>
                    <p>The history of musical instruments dates back thousands of years, with evidence of early instruments found in archaeological sites around the world. From simple percussion instruments like drums and rattles to sophisticated string and wind instruments, music has played a significant role in human culture and expression. Over time, musical instruments have evolved and diversified, reflecting advancements in technology, culture, and artistic expression.</p>
                    <button>Learn More</button>
                </div>
                <img src="images/K-on.jpeg" alt="alt"/>
            </div>

            <div class="type">
                <div>
                    <img src="images/string.png" alt="left_image" class="left-section">
                    <h2>String Instruments</h2>
                    <p>These produce sound by vibrating strings. Examples include the guitar, violin, cello, harp, and sitar.</p>
                    <button>Learn More</button>
                </div>

                <div style="text-align: right;">
                    <img src="images/percussion.jpg" alt="right_image" class="right-section">
                    <h2>Percussion Instruments</h2>
                    <p>These produce sound by being struck, shaken, or scraped. They include drums, cymbals, xylophones, maracas, and tambourines.</p>
                    <button>Learn More</button>

                </div>


                <div>
                    <img src="images/keyboard.jpg" alt="left_image" class="left-section">
                    <h2>Keyboard Instruments</h2>
                    <p>These produce sound by pressing keys that trigger strings, pipes, or electronic oscillators. Examples include the piano, organ, synthesizer, and accordion.</p>
                    <button>Learn More</button>
                </div>


                <div style="text-align: right;">
                    <img src="images/electronic.jpg" alt="right_image" class="right-section">

                    <h2>Electronic Instruments</h2>
                    <p>These produce sound using electronic circuits or digital technology. Examples include synthesizers, drum machines, and digital keyboards.</p>
                    <button>Learn More</button>
                </div>

            </div>
        </main>
    </body>
</html>
<%@include file="layouts/footer.jsp" %>  