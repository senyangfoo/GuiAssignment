<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Customer" %>
<%@include file="layouts/header.jsp" %>
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
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <button onclick="window.location.href = 'customerAddEdit.jsp'" class="addButton">Add Customer</button>
            <table class="custTable">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Email</td>
                    <td>Password</td>
                    <td>Action</td>
                </tr>
                <%
                    if(!customerList.isEmpty()){
                        for(Customer p : customerList){%>
                <tr>
                    <td><%= p.getCustId()%></td>
                    <td><%= p.getCustName()%></td>
                    <td><%= p.getCustEmail() %></td>
                    <td><%= p.getCustPassword() %></td>
                    <td><a href="RetrieveCustomer?custID=<%= p.getCustId()%>">Edit</a> <a href="DeleteCustomer?productID=<%= p.getCustId()%>" onclick="return confirm('Are u sure u want to REMOVE this Customer?')">Delete</a></td>
                </tr>
                <%}
            }
                %>
            </table>
        </div>
    </body>
</html>
