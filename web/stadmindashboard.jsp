<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
response.sendRedirect("index.jsp");
}
%>
<html>
    <head>
        <style>
            h1{
             
                margin-left: 30%;
                font-family: sans-serif;
                font-weight: bold;
                font-size: 45px;
            }

            
        </style>
        
    </head>
    <body>
        <h1>State Admin Dashboard</h1
        
       
        
        <h3>Welcome <%=userid%></h3>
        <hr>
        <a href="entrypage.jsp">Add-Info-For-Today</a><br>
        <a href="#">Update-Info</a><br>
        <a href="StateDataServet">View-Info_of_own-State</a><br>
        <a href="AllStateDataServet">View-Info_of_All-State</a><br>
        <a href="EndSessionServet">Logout</a>
        <hr>
    </body>
</html>
