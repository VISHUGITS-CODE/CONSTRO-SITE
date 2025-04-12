

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypkg.Utility;


public class Delete extends HttpServlet {
     private Connection con;
    private PreparedStatement ps;
    public void init()
    {
    try{
   // con=Utility.connect();
   ServletContext context=getServletContext();
            con=(Connection)context.getAttribute("dbcon");
    ps=con.prepareStatement("delete from info where sno=? ");
    
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
        }
 */   
    }


   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out=response.getWriter();
        String sno=request.getParameter("sno");
        try{
         
            ps.setString(1, sno);
            int i=ps.executeUpdate();
            
            RequestDispatcher rd=request.getRequestDispatcher("AllStateDataServet");
            rd.include(request, response);
           // out.println(i+"record deleted");
            out.println("<script>window.alert('Record Deleted successfully');</script>");
        }catch(Exception e)
        {
        
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
