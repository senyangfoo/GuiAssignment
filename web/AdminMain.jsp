<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Console</title>
    </head>
    <style>
        .contentContainer {
            margin: 50px 0 0 250px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .tableOption{
            margin-top: 8%;
            display: flex;
            justify-content: space-around;
            width: 1000px;
            margin-left: 10%;
            margin-right: 10%;
        }
        img.staff{
            border-radius: 45%;
            width: 150px;
            height: 150px;

        }
        img.staff:hover{
            transform: scale(1.5);
            transition-duration: 0.5s;
            transition-property: transform;
        }
        img.stock{
            border-radius: 45%;
            width: 150px;
            height: 150px;

        }
        img.stock:hover{
            transform: scale(1.5);
            transition-duration: 0.5s;
            transition-property: transform;
        }
        img.customer{
            border-radius: 45%;
            width: 150px;
            height: 150px;

        }
        img.customer:hover{
            transform: scale(1.5);
            transition-duration: 0.5s;
            transition-property: transform;
        }
        td{
            width: 500px;
        }
    </style>
    <body>
        <div class="contentContainer">
            <h1>Admin Console</h1>
            <div class="tableOption">
                <table>
                    <tr>
                        <td>
                            <a href="ViewStaff"><img class="staff" src="images/StaffTableIcon.png" alt="Staff Table"/></a>
                        </td>
                        <td>
                            <a href="AdminViewProduct"><img class="stock" src="images/StockTableIcon.png" alt="Stock Table"/></a>
                        </td>
                        <td>
                            <a href="ViewCustomer"><img class="customer" src="images/CustomerTableIcon.png" alt="Customer Table"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Staff</b></td>
                        <td><b>Stock</b></td>
                        <td><b>Customer</b></td>
                    </tr>
                  
                </table>
            </div>

        </div>
    </body>
    <%@include file="layouts/adminNavBar.jsp" %>
</html>
