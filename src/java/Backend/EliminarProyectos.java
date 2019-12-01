/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

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
public class EliminarProyectos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Proyectos.jsp?error=1&text=Buen intento");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("ideae"));
        System.out.println(id);
        String contra = request.getParameter("pas_el");
        
        HttpSession sesion = request.getSession();
        
        Usuario u = (Usuario)sesion.getAttribute("user");
        if (u.getPassword().equals(contra)) {
            boolean el = Conexion.eliminarProyecto(id);
            if (el) {
                response.sendRedirect("Proyectos.jsp?error=2&text=Proyecto Eliminado");
            }else{
                response.sendRedirect("Proyectos.jsp?error=1&text=Algo ocurrio");
            }
            
        }else{
            response.sendRedirect("Proyectos.jsp?error=1&text=La contraseña fue incorrecta");
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
