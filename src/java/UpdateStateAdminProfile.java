import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateStateAdminProfile extends HttpServlet {
    protected Connection con; 
    protected PreparedStatement ps3;
    public void init()
    {
        
        try {
            
           // con=mypkg.Utility.connect();
            ServletContext context=getServletContext();
            con=(Connection)context.getAttribute("dbcon");
           ps3 = con.prepareStatement("UPDATE stateadmins SET email=?, password=?, username=?, mobile=?, address=?, Status='enable' WHERE userid=?");
        } catch (Exception e) {
            e.printStackTrace();
        }
            
            
    }
    
    public void destory()
    {
      /*  try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/

    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out=response.getWriter();
        
        String userid=request.getParameter("uid");
        String uname=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("password");
        String mobile=request.getParameter("mobile");
        String address=request.getParameter("address");
        
        
        
        try {
           //  Email=?, Password=?, UserName=?, Mobile=?, Address=?, Status='enable'"
            ps3.setString(1,email);
            ps3.setString(2,pass);
            ps3.setString(3,uname);
            ps3.setString(4,mobile);
            ps3.setString(5,address);
            ps3.setString(6,userid);
            
            ps3.executeUpdate();
            
           response.sendRedirect("stadmindashboard.jsp");
            
                       
        } catch (Exception e) {
            out.println(e);
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
