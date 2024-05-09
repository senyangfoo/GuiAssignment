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
            table.staffTable{
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
            <button onclick="window.location.href = 'staffAddEdit.jsp'" class="addButton">Add Staff</button>
            <table class="staffTable">
                <tr class="header">
                    <td class="id">ID</td>
                    <td class="name">Name</td>
                    <td class="email">Email</td>
                    <td class="pass">Password</td>
                    <td class="action">Action</td>
                </tr>
                <%
                    if(!staffList.isEmpty()){
                        for(Staff s : staffList){%>
                <tr>
                    <td class="id"><%= s.getStaffId()%></td>
                    <td class="name"><%= s.getStaffName()%></td>
                    <td class="email"><%= s.getStaffEmail() %></td>
                    <td class="pass"><%= s.getStaffPassword() %></td>
                    <td class="action"><a href="RetrieveStaffMember?staffId=<%= s.getStaffId()%>"><i class="material-icons" style="color: black;">&#xe254;</i></a> 
                        <a href="DeleteStaffMember?staffId=<%= s.getStaffId()%>" onclick="return confirm('Are u sure u want to REMOVE this Staff member?')"><i class="material-icons" style="color: black;">&#xe872;</i></a></td>
                </tr>
                <%}
            }
                %>
            </table>
        </div>
    </body>
</html>
