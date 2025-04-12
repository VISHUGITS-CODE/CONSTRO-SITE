<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
response.sendRedirect("index.jsp");
}
%>
<html>
    <head>
        
    </head>
    <body>
        <h1>Submit-Info-For-Today</h1>
        <hr>
        <form action="SaveInfo">
            <pre>
            
            Total    :<input type="text" name="total"/> 
            Active   :<input type="text" name="active"/>
            Deaths   :<input type="text" name="deaths"/>
            <input type="submit" value="UPDATE"/>
           </pre>
        </form>
        <hr>
    </body>
</html>
