/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend.ServletControl;

import Backend.Conexion;
import Entidades.Proyectos.Poblacion;
import Entidades.Proyectos.Proyecto;
import Entidades.Users.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
public class Finalizar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                
                int id = Integer.parseInt(request.getParameter("id"));
                int tipo = Integer.parseInt(request.getParameter("tipo"));
                
                HttpSession sesionOk = request.getSession();
                Usuario u = (Usuario) sesionOk.getAttribute("user");
                int pobt=0;
                int diasT=0;
                if (tipo==1) {
                    diasT =ProyectosControl.RestarFechas(Conexion.getProyectoById(id).getFechaDeInicio());
                    pobt = Conexion.getPoblacion(id).size();
                }
                
                
                if(tipo == 1 && Conexion.getProyectoById(id).getId_usr()==u.getId()&&diasT>5&&pobt>5){
                    Proyecto p = Conexion.getProyectoById(id);
                    p.setTipo(2);
                    Conexion.editarProyecto(p);
                    response.sendRedirect("Proyectos.jsp?error=2&text=Proyecto finalizado");
                }else if (tipo == 2 && Conexion.getProyectoById(Conexion.getPoblacionById(id).getId_pry()).getId_usr()==u.getId()) {
                    Poblacion p = Conexion.getPoblacionById(id);
                    p.setTipo(2);
                    p.setFf(ProyectosControl.getFecha());
                    Conexion.editarPoblacion(p);
                    response.sendRedirect("Proyecto.jsp?id="+(id+300));
                }else if(diasT<5){
                    response.sendRedirect("Proyectos.jsp?error=1&text=No puedes finalizar antes de 5 dias");
                }else if(pobt<5){
                    response.sendRedirect("Proyectos.jsp?error=1&text=no puedes finalizar menos de 5 poblaciones");
                }
                
                
            }catch(Exception e){
                e.printStackTrace();
                response.sendRedirect("Login.jsp");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
