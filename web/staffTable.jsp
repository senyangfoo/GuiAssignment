<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page  import="model.Staff" %>
<%@include file="layouts/header.jsp" %>
<%@include file="layouts/adminNavBar.jsp" %>
<%
   List<Staff> staffList = (List)session.getAttribute("staffList");
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
            <button onclick="window.location.href = 'staffAddEdit.jsp'" class="addButton">Add Staff</button>
            <table class="custTable">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Email</td>
                    <td>Password</td>
                    <td>Action</td>
                </tr>
                <%
                    if(!staffList.isEmpty()){
                        for(Staff s : staffList){%>
                <tr>
                    <td><%= s.getStaffId()%></td>
                    <td><%= s.getStaffName()%></td>
                    <td><%= s.getStaffEmail() %></td>
                    <td><%= s.getStaffPassword() %></td>
                    <td><a href="RetrieveStaffMember?staffId=<%= s.getStaffId()%>">Edit</a> <a href="DeleteStaffMember?staffId=<%= s.getStaffId()%>" onclick="return confirm('Are u sure u want to REMOVE this Staff member?')">Delete</a></td>
                </tr>
                <%}
            }
                %>
            </table>
    </body>
</html>
