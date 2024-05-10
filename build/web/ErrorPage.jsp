
<%! int count = 3;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCESS DENIED!</title>
    </head>
    <body>
        <h1 style="color: red;"><b>You Have No Access!</b></h1>
       <p>You will be redirect to the rick roll in 
            <%= count +" seconds."%>
            <%
            if(count>0){
                --count;
                response.setHeader("refresh","1");
                return;
                }
            
            %> </p>
           <% if(count == 0){
                count = 3;
                response.sendRedirect("index.jsp");
              } 
           %>
    </body>
</html>
