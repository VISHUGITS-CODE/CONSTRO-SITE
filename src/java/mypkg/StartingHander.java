
package mypkg;

import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class StartingHander implements ServletContextListener {
    private Connection con;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
        try{
        con=Utility.connect();
          System.out.println("Connection created Successfuy IN context INnitialized"+con);
          
          //store this into contxt obj so that it will be available for evey servert
          ServletContext context=sce.getServletContext();
          //set the attributes
          context.setAttribute("dbcon",con);
          
        }catch(Exception e){
          System.out.println("Exception in Connecting ............"+e);
        }    
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
         try{
        System.out.println("Connection is about to close........");
        con.close();
        }catch(Exception e){
          System.out.println("Exception in Connecting ............"+e);
        }  
    }
}
