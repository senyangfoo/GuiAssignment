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
                margin-top: 10%;
                position: fixed;
                display: grid;
                border: 3px solid black;
                margin-left: 25%;
                height: 300px;
                width: 700px;
                justify-content: center;
                text-align: center;
                h2{
                    text-align: center;
                }
                input.input{
                    float: right;
                }
                label{
                    float: left;
                }
               
  
            }
        </style>
    </head>
    <body>
        <div class="contentContainer">
            <%
                if(c != null){%>
            <h2>Edit Customer</h2>
            <form action="StaffEditCustomer?custId=<%= c.getCustId()%>&custCurrName=<%= c.getCustName()%>" method="POST">
                <label>Customer Name</label>
                <input class="input" type="text" name="custName" size="75" value="<%= c.getCustName()%>" required></br>
                <label>Customer Email</label>
                <input class="input" type="text" name="custEmail" size="75" value="<%=  c.getCustEmail() %>" required></br>
                <label>Customer Password</label>
                <input class="input" type="text" name="custPassword" size="75" value="<%=  c.getCustPassword() %>" required></br></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {
            session.removeAttribute("customer");%>
            
            <h2>Add Customer</h2>
            <form action="StaffAddCustomer" method="POST">
                <label>Customer Name</label>
                <input class="input" type="text" name="custName" size="75" id="name" required></br>
                <label>Customer Email</label>
                <input class="input" type="text" name="custEmail" size="75" required></br>
                <label>Customer Password</label>
                <input class="input" type="text" name="custPassword" size="75" required></br></br>
                <input type="submit" value="Add">
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("customer");
%>