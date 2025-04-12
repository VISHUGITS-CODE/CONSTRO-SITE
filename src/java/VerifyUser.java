

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypkg.Utility;


public class VerifyUser extends HttpServlet {
    private Connection con;
    private PreparedStatement ps1,ps2;
    public void init()
    {
    try{
   // con=Utility.connect();
   //catching the context obj
   ServletContext context=getServletContext();
   con=(Connection)context.getAttribute("dbcon");
    ps1=con.prepareStatement("select * from users where email=? and pass=? ");
    ps2=con.prepareStatement("select * from stateadmins where userid=? and password=?");
    }catch(Exception e)
    {
    e.printStackTrace();
    }
    }
    public void destory()
    {
       /* try{
        con.close();
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }*/
    
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       PrintWriter out=response.getWriter();
        String id=request.getParameter("email");
        String pass=request.getParameter("pwd");
        String utype=request.getParameter("utype");
        
       if(utype.equals("Admin"))
       {
          if (id.equals("admin@gmail.com") && pass.equals("admin123")) {
    HttpSession session = request.getSession();
    session.setAttribute("userid", id); // Setting the Super-Admin's ID
    response.sendRedirect("sadmindashboard.jsp");
} else {
    out.println("wrong super admin Credentials");
}
       } else if(utype.equals("State-Admin"))
       {
          //we will check the credentials from use
           try{
            ps2.setString(1,id);
            ps2.setString(2,pass);
           ResultSet rs=ps2.executeQuery();
           
           boolean found=rs.next();
           
           if(found){
           String status=rs.getString("status");
           String uid=rs.getString("UserId");
            //check the staus
            if(status.equals("disable")){
            out.println("<html><body>");
            out.println("<h2>Profile-Updation-Form</h2>");
            out.println("<form action=UpdateStateAdminProfile>");
            out.println("<pre>");
            //userid ,email, password,username ,mobile,address
            out.println("Userid   :<input type=text name=uid value="+uid+">");
            out.println("Email    :<input type=email name=email>");
            out.println("Password :<input type=password name=password>");
            out.println("UserName :<input type=text name=uname>");
            out.println("Mobile   :<input type=text name=mobile>");
            out.println("Address  :<input tpye=text name=address>");
            out.println("<input type=submit value=Update>");
            out.println("</pre>");
            out.println("</form>");
            out.println("</body></html>");
            }else{
                
                HttpSession session=request.getSession();
                session.setAttribute("userid",uid);
                session.setAttribute("state",rs.getString("state"));
            response.sendRedirect("stadmindashboard.jsp");
            }
           //if disbled then show the profile completion form
           // if enable then shoew the dashboaed
            //ch of the state admin

           }
          
           else{
            out.println("<html><body>");
            out.println("<h1>INVALID CREDENTIALS </h1>");
            out.println("<h3><a href=index.jsp>Try again</a></h3>");
            out.println("</body></html>");
           }
           
                   
           }catch(Exception e){
           e.printStackTrace();
           }
          
        }else if(utype.equals("End-User"))
        {
             try{
           ps1.setString(1,id);
           ps1.setString(2,pass);
           ResultSet rs=ps1.executeQuery();
           
           boolean found=rs.next();
           if(found){
               response.sendRedirect("userdasboard.jsp");
           }else
           {
               out.println("<html><body>");
            out.println("<h1>INVALID CREDENTIALS </h1>");
            out.println("<h3><a href=index.jsp>Try again</a></h3>");
            out.println("</body></html>");
           }
       }catch(Exception e){
       e.printStackTrace();
       }
        }
      
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
