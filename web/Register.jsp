<%@page import="domain.Customer"%>
<%@page import="da.userDA"%>
<%@page import="java.util.Timer"%>  
<%@page import="java.util.TimerTask"%>
<%! int count = 3;%>
<jsp:useBean id="user" class="domain.Customer" scope="session"></jsp:useBean>
<jsp:useBean id="userDA" class="da.userDA" scope="application"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <title>Account Created</title>
        </head>
        <body>
        <% userDA.addRecord(user);%>
        <%= user.getCustName()%> has been added to the database<br/>
        <p>You will be redirect to the main page in 
            <%= count +"seconds."%>
            <%
            if(count>0){
                --count;
                response.setHeader("refresh","1");
                return;
                }
            
            %> </p>
           <% response.sendRedirect("http://localhost:8080/GUI_Assignment_1/Main.html"); %>
    </body>
</html>
