<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Customer" %>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Customer> customerList = (List)session.getAttribute("customerList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {
                margin: 50px 0 0 250px;
                display: grid;
                position: relative;
            }
            button.addButton{
                position: relative;
                left: 80.85%;
                color: black;
                background-color: white;
                border-radius: 5px 5px 5px 5px;
                width: 200px;
                height: 50px;
                -webkit-text-stroke: 1px black; /* width and color */
                transition-duration: 1s;
                transition-property: background-color;
            }
            button.addButton:hover{
                color: white;
                background-color: black;
                -webkit-text-stroke: 1px white; /* width and color */
                transition-duration: 0.5s;
                transition-property: background-color;
            }
            table.custTable{
                border: 3px solid black;
                border-collapse: collapse;
                width: 1200px;
                margin-top: 20px;
            }
            td,th{

                border: 1px solid black;
            }
            td.id{
                width: 50px;
                text-align: center;
            }
            td.action{
                width: 80px;
                text-align: center;
            }
            td.name{
                width: 200px;
                text-align: left;
            }
            td.email{
                width: 100px;
                text-align: left;
            }
            td.pass{
                width: 200px;
                text-align: left;
            }
            tr{
                height: 45px;
            }
            tr.header{
                -webkit-text-stroke: 1px black; /* width and color */
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <form action="SearchAdminStaffCustomer" method="GET">
                <input type="hidden" name="who" value="admin">
                <input type="text" placeholder="Search..." onblur="closeSearchBar()" id="searchInput" class="searchInput" name="searchInput">
            </form>
            <button onclick="window.location.href = 'customerAddEdit.jsp'" class="addButton">Add Customer</button>
            <table class="custTable">
                <tr class="header">
                    <td class="id">ID</td>
                    <td class="name">Name</td>
                    <td class="email">Email</td>
                    <td class="pass">Password</td>
                    <td class="action">Action</td>
                </tr>
                <%
                    if(!customerList.isEmpty()){
                        for(Customer p : customerList){%>
                <tr>
                    <td class="id"><%= p.getCustId()%></td>
                    <td class="name"><%= p.getCustName()%></td>
                    <td class="email"><%= p.getCustEmail() %></td>
                    <td class="pass"><%= p.getCustPassword() %></td>
                    <td class="action"><a href="RetrieveCustomer?custId=<%= p.getCustId()%>"><i class="material-icons" style="color: black;">&#xe254;</i></a> 
                        <a href="DeleteCustomer?custId=<%= p.getCustId()%>" onclick="return confirm('Are u sure u want to REMOVE this Customer member?')"><i class="material-icons" style="color: black;">&#xe872;</i></a></td>
                </tr>
                <%}
            }
                %>
            </table>
        </div>
    </body>
</html>
