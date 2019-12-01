/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend.ServletControl;

import Entidades.Proyectos.direccion;
import java.io.FileWriter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eduardo
 */
public class GCrecimiento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.sendRedirect("Login.jsp");
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String r = "/";
            ArrayList<Float> horas = new ArrayList();
            ArrayList<Float> Poblacion = new ArrayList();
            try{
                System.out.println(request.getParameter("num"));
                int numd = Integer.parseInt(request.getParameter("num"));
            for (int i = 0; i < numd; i++) {
                try{
                    float ht = Float.parseFloat(request.getParameter((i+1)+"h"));
                    System.out.println(ht);
                    float pt = Float.parseFloat(request.getParameter((i+1)+"p"));
                     System.out.println(pt);
                    horas.add(ht);
                    Poblacion.add(pt);
                 
                        r = r +ht+","+pt+",";
                    
                }catch(Exception e){
                    System.out.println("fallo");
                    response.sendRedirect("Proyectos.jsp");
                }
            }
            response.sendRedirect("http://"+new direccion().dir+":8005/regG"+r+"/"+request.getParameter("id"));
            }catch(NumberFormatException e){
                System.out.println("Fallo de parse" + e.getMessage());
                response.sendRedirect("Proyectos.jsp");
            }
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
