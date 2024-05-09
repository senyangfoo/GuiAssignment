<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String currentPage = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            .sidenav {
                height: 100%;
                position: fixed;
                width: 220px;
                top: 100px;
                background-color: var(--primary_brown_color);
                padding-top: 50px;
                z-index: 1;
            }

            .sidenav a {
                padding: 15px 26px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                letter-spacing: .5px;
                display: block;
                margin: auto auto;

                img {
                    vertical-align: middle;
                    width: 30px;
                    margin: 0 20px 0 0;
                    filter: invert(100%);
                }
            }

            .sidenav a.active {
                background-color: var(--primary_white_color);
                color: var(--primary_brown_color);

                img {
                    filter: invert(14%) sepia(5%) saturate(770%) hue-rotate(341deg) brightness(105%) contrast(87%);
                }
            }
             .sidenav a.logout{
                 color: white;
                 display: inline;
                 padding: auto;
             }
             
             .options{
                 margin-top: 100%;
                 margin-bottom: 0;
             }


        </style>
    </head>
    <body>
        <div class="sidenav">
             <a href="AdminMain.jsp" <% if (currentPage.endsWith("/AdminMain.jsp")) out.print("class=\"active\""); %>><img src="images/Home-icon.svg">Main</a>
            <a href="productTable.jsp" <% if (currentPage.endsWith("/productTable.jsp")) out.print("class=\"active\""); %>><img src="images/shopping_bag.svg">Products</a>
            <a href="ViewStaff" <% if (currentPage.endsWith("/staffTable.jsp")) out.print("class=\"active\""); %>><img src="images/engineering.svg">Staff</a>
            <a href="ViewCustomer" <% if (currentPage.endsWith("/customerTable.jsp")) out.print("class=\"active\""); %>><img src="images/person.svg">Customer</a>
            <a href="salesTable.jsp" <% if (currentPage.endsWith("/salesTable.jsp")) out.print("class=\"active\""); %>><img src="images/assessment.svg">Sales Report</a>
            <div class="options">
                <a class="logout" href="logout.jsp"><img src="images/Logout.svg" alt="Logout"/></a>
            </div>
        </div>
        <script>
            // Get the current page URI
            var currentPage = "<%= currentPage %>";

            // Get the side navigation links
            var sidenavLinks = document.getElementsByClassName("sidenav")[0].getElementsByTagName("a");

            // Loop through each link to add event listener
            for (var i = 0; i < sidenavLinks.length; i++) {
                sidenavLinks[i].addEventListener("click", function () {
                    // Remove 'active' class from all links
                    for (var j = 0; j < sidenavLinks.length; j++) {
                        sidenavLinks[j].classList.remove("active");
                    }
                    // Add 'active' class to the clicked link
                    this.classList.add("active");
                });

                // Check if the link's href matches the current page URI
                if (sidenavLinks[i].getAttribute("href") === currentPage) {
                    // Add 'active' class to the link if it matches
                    sidenavLinks[i].classList.add("active");
                }
            }
        </script>

    </body>
</html>
