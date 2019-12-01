/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades.Proyectos;

import Backend.Conexion;
import Backend.ServletControl.ProyectosControl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eduardo
 */
public class AgregarPoblacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.sendRedirect("Login.jsp?error=1&text=Buen intento");
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
            int id = Integer.parseInt(request.getParameter("id_pry"))-123;
            
            try{
                Poblacion p = new Poblacion();
                p.setId_pry(id);
                p.setId_pob(Conexion.getPoblacionA(id).size()+1);
                p.setPob_in(Integer.parseInt(request.getParameter("UFC")));
                p.setOxigeno(Float.parseFloat(request.getParameter("aw")));
                p.setTemperatura(Float.parseFloat(request.getParameter("tem")));
                p.setPh(Float.parseFloat(request.getParameter("Ph")));
                p.setTipo(1);
                p.setFi(ProyectosControl.getFecha());
                Conexion.agregarPoblacion(p);
                response.sendRedirect("Proyecto.jsp?id="+(p.getId_pry()+300)+"&error=2&text=Poblacion agregada");
            }catch(Exception we){
                System.out.println(we.getMessage());
                System.out.println(we.getStackTrace());
            }
            
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
