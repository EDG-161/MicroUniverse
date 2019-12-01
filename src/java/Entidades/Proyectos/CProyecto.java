/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades.Proyectos;

import Backend.Conexion;
import Backend.ServletControl.ProyectosControl;
import Entidades.Users.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
public class CProyecto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.sendRedirect("Proyectos.jsp");
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
            try{
                HttpSession sesionOk = request.getSession();
                Usuario us = (Usuario)sesionOk.getAttribute("user");
                int id = Integer.parseInt(request.getParameter("pr"))-123;
                int user = Integer.parseInt(request.getParameter("cod"));
                Proyecto p = Conexion.getProyectoById(id);
                Usuario u = Conexion.getUsuarioById((user/753159)-500);
                boolean t = true;
                Connection c = Conexion.getConecction();
                String x = "select * from mcolaboradores";
                PreparedStatement set1 = c.prepareStatement(x);
                ResultSet rs = set1.executeQuery();
                while (rs.next()) {
                    if (rs.getInt(2)== p.getId() && rs.getInt(3)==u.getId()) {
                        t = false;
                    }
                }
                if (u!= null && p!= null && us.getId()!=u.getId() && t) {
                   x = "insert into mcolaboradores (id_pry, id_usr, id_tip)"
                           + " values(?,?,?)";
                   set1 = c.prepareStatement(x);
                   set1.setInt(1,p.getId());
                   set1.setInt(2,u.getId());
                   set1.setInt(3, Integer.parseInt(request.getParameter("funcion")));
                   int estado1 = set1.executeUpdate();
                   c.close();
                    response.sendRedirect("Proyecto.jsp?id="+(id+300)+"&error=2&text=El usuario "+ u.getNombre()+" podrá ver el proyecto");
                }else if (u.getId() == us.getId()) {
                    response.sendRedirect("Proyecto.jsp?id="+(id+300)+"&error=1&text=No puedes compartir a ti mismo");
                }else if (!t) {
                    response.sendRedirect("Proyecto.jsp?id="+(id+300)+"&error=1&text=El usuario ya tiene acceso");
                }
                
            }catch(Exception we){
                response.sendRedirect("Proyectos.jsp?error=1&text=Ha ocurrido algo");
                we.printStackTrace();
            }
            
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
