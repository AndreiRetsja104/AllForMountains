package Javas;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * 
 * Author: arets
 * Page: AppInitializationListener.java
 * Connected with: Entire project lifecycle - logs messages during deployment and undeployment of the project.
 */
@WebListener
public class AppInitializationListener implements ServletContextListener {

    /**
     * This method is called when the web application context is initialized (i.e., when the project is deployed).
     * Step 1: Log a message indicating successful deployment.
     * Connected with: The deployment process of the project.
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Project deployed successfully!");
    }

    /**
     * This method is called when the web application context is destroyed (i.e., when the project is undeployed).
     * Step 2: Log a message indicating successful undeployment.
     * Connected with: The undeployment process of the project.
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Project undeployed!");
    }
}
