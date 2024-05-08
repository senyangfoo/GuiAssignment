<%@include file="layouts/header.jsp" %>
<%@page  import="model.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer c = (Customer) session.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .contentContainer {

            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <%
                if(c != null){%>
            <h2>Edit Customer</h2>
            <form action="EditCustomer?custId=<%= c.getCustId()%>&custCurrName=<%= c.getCustName()%>" method="POST">
                Customer Name
                <input type="text" name="custName" size="80" value="<%= c.getCustName()%>" required></br>
                Customer Email
                <input type="text" name="custEmail" size="80" value="<%=  c.getCustEmail() %>" required></br>
                Customer Password
                <input type="text" name="custPassword" size="20" value="<%=  c.getCustPassword() %>" required></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {%>
            <h2>Add Customer</h2>
            <form action="AddCustomer" method="POST" onsubmit="checkValidation()">
                Customer Name
                <input type="text" name="custName" size="80" id="name" required></br>
                Customer Email
                <input type="text" name="custEmail" size="80" required></br>
                Customer Password
                <input type="text" name="custPassword" size="20" required></br>
                <input type="submit" value="Add">
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("customer");
%>