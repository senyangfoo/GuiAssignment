<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Console</title>
    </head>
    <style>
        .contentContainer {
            margin: 50px 0 0 250px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .tableOption{
            position: relative;
            margin-top: 8%;
            display: flex;
            justify-content: space-around;
            width: 500px;
            left: 29%;
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
        img.sales{
            border-radius: 45%;
            width: 150px;
            height: 150px;

        }
        img.sales:hover{
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
            <h1>Staff Console</h1>
            <div class="tableOption">
                <table>
                    <tr>
                        <td>
                            <a href="StaffViewProduct"><img class="stock" src="images/StockTableIcon.png" alt="Stock Table"/></a>
                        </td>
                        <td>
                            <a href="StaffViewCustomer"><img class="customer" src="images/CustomerTableIcon.png" alt="Customer Table"/></a>
                        </td>
                        <td>
                            <a href="StaffViewSales"><img class="sales" src="images/sales_icon.png" alt="Sales Report"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Stock</b></td>
                        <td><b>Customer</b></td>
                        <td><b>Sales Report</b></td>
                    </tr>
                  
                </table>
            </div>

        </div>
    </body>
    <%@include file="layouts/staffNavBar.jsp" %>
</html>
