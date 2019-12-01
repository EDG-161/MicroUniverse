/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import Backend.ServletControl.ProyectosControl;
import Entidades.Proyectos.Informe;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eduardo
 */
public class AgregarInforme extends HttpServlet {

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
            try{
        String id = request.getParameter("id");
        String titulo = id + request.getParameter("Titulo");
        String cuerpo = request.getParameter("textarea");
        float aw = Float.parseFloat(request.getParameter("aw"));
        float ph = Float.parseFloat(request.getParameter("ph"));
        float tm = Float.parseFloat(request.getParameter("tm"));
        double pob = Double.parseDouble(request.getParameter("id"));
        
        Date f=new Date();
        String a = (Conexion.getInformeA(0).size()+1)+titulo+".txt";
        Informe m = new Informe();
        m.setId_inf(Conexion.getInformeA(0).size()+1);
        m.setId_pry(Integer.parseInt(id));
        m.setText(cuerpo);
        m.setAw(aw);
        m.setPh(ph);
        m.setPob(pob);
        m.setTm(tm);
        m.setDate(f.getDate()+"-"+(f.getMonth()+1)+"-"+(f.getYear()-100));
        m.setNombre(titulo+" "+f.getDate()+"-"+(f.getMonth()+1)+"-"+(f.getYear()-100));
        m.setRuta(ProyectosControl.EscribirInforme(m, a));
        
        Conexion.agregaraInformes(m);
        response.sendRedirect("Poblacion.jsp?id="+id);
        }catch(Exception e){
            System.out.println("no se pudo");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            e.printStackTrace();
        }
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
        try{
        String id = request.getParameter("id");
        String titulo = id + request.getParameter("Titulo");
        String cuerpo = request.getParameter("textarea");
        float aw = Float.parseFloat(request.getParameter("aw"));
        float ph = Float.parseFloat(request.getParameter("ph"));
        float tm = Float.parseFloat(request.getParameter("tm"));
        double pob = Double.parseDouble(request.getParameter("id"));
        
        Date f=new Date();
        String a = (Conexion.getInformeA(0).size()+1)+titulo+".txt";
        Informe m = new Informe();
        m.setId_inf(Conexion.getInformeA(0).size()+1);
        m.setId_pry(Integer.parseInt(id));
        m.setText(cuerpo);
        m.setAw(aw);
        m.setPh(ph);
        m.setPob(pob);
        m.setTm(tm);
        m.setDate(f.getDate()+"-"+(f.getMonth()+1)+"-"+(f.getYear()-100));
        m.setNombre(titulo+" "+f.getDate()+"-"+(f.getMonth()+1)+"-"+(f.getYear()-100));
        m.setRuta(ProyectosControl.EscribirInforme(m, a));
        
        Conexion.agregaraInformes(m);
        response.sendRedirect("Poblacion.jsp?id="+id);
        }catch(Exception e){
            System.out.println("no se pudo");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            e.printStackTrace();
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
