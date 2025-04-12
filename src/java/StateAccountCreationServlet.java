
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StateAccountCreationServlet extends HttpServlet {

     protected Connection con; 
    protected PreparedStatement ps;
    public void init()
    {
        
        try {
            
           // con=mypkg.Utility.connect();
            ServletContext context=getServletContext();
            con=(Connection)context.getAttribute("dbcon");
           ps = con.prepareStatement("insert into stateadmins values(?,null,?,null,?,null,null,'disable')");
         
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
        
        String userid=request.getParameter("userid");
        String password=request.getParameter("pwd");
        String state=request.getParameter("state");
        
        
        try {
            
            ps.setString(1,userid);
            ps.setString(2,password);
            ps.setString(3,state);
           
            ps.executeUpdate();
            
            out.println("<html><body>");
            out.println("<h1>Account successfully Created</h1>");
            out.println("<h3><a href=sadmindashboard.jsp>DASHBOARD</a></h3>");
            out.println("</body></html>");
                       
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
