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

public class RegisterServlet extends HttpServlet {
    protected Connection con; 
    protected PreparedStatement ps;
    public void init()
    {
        
        try {
            
          //  con=mypkg.Utility.connect();
            ServletContext context=getServletContext();
            con=(Connection)context.getAttribute("dbcon");
           ps = con.prepareStatement("insert into users values(?,?,?,?,?)");
        } catch (Exception e) {
            e.printStackTrace();
        }
            
            
    }
    
    public void destory()
    {
       /* try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/

    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out=response.getWriter();
        
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String pass=request.getParameter("pwd");
        String mobile=request.getParameter("mobile");
        String address=request.getParameter("address");
        
        try {
            
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,pass);
            ps.setString(4,mobile);
            ps.setString(5,address);
            
            ps.executeUpdate();
            
            out.println("registratioin successfuilll");
            
                       
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
