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
import javax.servlet.http.HttpSession;

public class SaveInfo extends HttpServlet {
    protected Connection con; 
    protected PreparedStatement ps;
    public void init()
    {
        
        try {
            
           // con=mypkg.Utility.connect();
           //we will fetch the con obj from context obj
           ServletContext context=getServletContext();
            con=(Connection)context.getAttribute("dbcon");
           ps = con.prepareStatement("insert into info(idate,state,total,active,deaths,userid) values(now(),?,?,?,?,?)");
        } catch (Exception e) {
            e.printStackTrace();
        }
            
            
    }
    
    public void destory()
    {
     /*   try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }*/

    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out=response.getWriter();
        
       HttpSession session=request.getSession();
       String userid=(String)session.getAttribute("userid");
       String state=(String)session.getAttribute("state");
       
        int total=Integer.parseInt(request.getParameter("total"));
        int active=Integer.parseInt(request.getParameter("active"));
        int deaths=Integer.parseInt(request.getParameter("deaths"));
       
        
        
        
        
        try {
           //  ,state,total,active,deaths,userid)
            ps.setString(1,state);
            ps.setInt(2,total);
            ps.setInt(3,active);
            ps.setInt(4,deaths);
            ps.setString(5,userid);
            
            
            ps.executeUpdate();
            
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
