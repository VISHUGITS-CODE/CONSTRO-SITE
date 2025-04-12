<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
response.sendRedirect("index.jsp");
}
%>
<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User Dashboard</h1>
    </body>
</html>
