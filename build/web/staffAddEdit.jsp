<%@include file="layouts/header.jsp" %>
<%@page  import="model.Staff" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Staff s = (Staff) session.getAttribute("staff");
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
                if(s != null){%>
            <h2>Edit Staff</h2>
            <form action="EditStaffMember?staffId=<%= s.getStaffId()%>&staffCurrName=<%= s.getStaffName()%>" method="POST">
                Staff Name
                <input type="text" name="staffName" size="80" value="<%= s.getStaffName()%>" required></br>
                Staff Email
                <input type="text" name="staffEmail" size="80" value="<%=  s.getStaffEmail() %>" required></br>
                Staff Password
                <input type="text" name="staffPassword" size="20" value="<%=  s.getStaffPassword() %>" required></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {%>
            <h2>Add Staff</h2>
            <form action="AddStaff" method="POST">
                Staff Name
                <input type="text" name="staffName" size="80" required></br>
                Staff Email
                <input type="text" name="staffEmail" size="80" required></br>
                Staff Password
                <input type="text" name="staffPassword" size="20" required></br>
                <input type="submit" value="Add">
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("staff");
%>