

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypkg.Utility;


@WebServlet(urlPatterns = {"/AllStateDataServet"})
public class AllStateDataServet extends HttpServlet {

   private Connection con;
    private PreparedStatement ps1;
    public void init()
    {
    try{
   // con=Utility.connect();
       ServletContext context=getServletContext();
      con=(Connection)context.getAttribute("dbcon");
    ps1=con.prepareStatement("select * from info");
    
    }catch(Exception e)
    {
    e.printStackTrace();
    }
    }
    public void destory()
    {
      /*  try{
        con.close();
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }*/
    
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out=response.getWriter();
         HttpSession session=request.getSession();
        
         
         try{
             
          
             ResultSet rs=ps1.executeQuery();
         out.println("<html><body>");
         out.println("<h2>Data For All-State :</h2>");
         out.println("<hr>");
         out.println("<table border=2>");
         out.println("<tr>");
         out.println("<th>S.NO</th><th>DATE</th><th>STATE</th><th>TOTAL</th><th>ACTIVE</th><th>DEATHS</th>");
         out.println("</tr>");
         while(rs.next())
         {
            String sno=rs.getString("sno");
            String date=rs.getString("idate");
            String state=rs.getString("state");
            String total=rs.getString("total");
            String active=rs.getString("active");
            String deaths=rs.getString("deaths");
            out.println("<tr>");
            out.println("<td>"+sno+"</td>");
            out.println("<td>"+date+"</td>");
            out.println("<td>"+state+"</td>");
            out.println("<td>"+total+"</td>");
            out.println("<td>"+active+"</td>");
            out.println("<td>"+deaths+"</td>");
            out.println("<td><a href=Delete?sno="+sno+">Delete</a></td>");
            out.println("</tr>");
            
         }
         out.println("</table>");
         out.println("<hr>");
         out.println("<h3><a href=stadmindashboard.jsp>Dashboard</a></h3>");
         out.println("</body></html>");
         }catch(Exception e){
         out.println(e);
         }
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
