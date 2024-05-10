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
                if(s != null){%>
            <h2>Edit Staff</h2>
            <form action="EditStaffMember?staffId=<%= s.getStaffId()%>&staffCurrName=<%= s.getStaffName()%>" method="POST">
                <label>Staff Name</label>
                <input class="input" type="text" name="staffName" size="80" value="<%= s.getStaffName()%>" required></br>
                <label>Staff Email</label>
                <input class="input" type="text" name="staffEmail" size="80" value="<%=  s.getStaffEmail() %>" required></br>
                <label>Staff Password</label>
                <input class="input" type="text" name="staffPassword" size="80" value="<%=  s.getStaffPassword() %>" required></br></br>
                <input type="submit" value="Edit" >
            </form>
            <%} else {%>
            <h2>Add Staff</h2>
            <form action="AddStaff" method="POST">
                <label>Staff Name:</label>
                <input class="input" type="text" name="staffName" size="75" required></br>
                <label>Staff Email:</label>
                <input class="input" type="text" name="staffEmail" size="75" required></br>
                <label>Staff Password:</label>
                <input class="input" type="text" name="staffPassword" size="75" required></br><br>
                <input type="submit" value="Add">
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
   session.removeAttribute("staff");
%>