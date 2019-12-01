/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import Backend.ServletControl.Validaciones;
import Entidades.Proyectos.Proyecto;
import Entidades.Users.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
public class AgregarProyecto extends HttpServlet {
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String nombre, fecha;
            HttpSession sesionOk = request.getSession();
            int bac,id_p,id_usr,id_ty;
            Date date = new Date();   
            
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
            try{
                nombre = request.getParameter("nombre_pr");
                fecha = dateFormat.format(date);
                bac = Integer.parseInt(request.getParameter("bacteria"));
                ArrayList<Proyecto> Proyectos =Conexion.getProyectos();
                
                id_p = Proyectos.size()+1;
                
                Usuario u = (Usuario)sesionOk.getAttribute("user");
                id_usr = u.getId();
                ;
                id_ty = 1;
                
                if (nombre.length()<41&&Validaciones.validarCadenasCN(nombre)==0) {
                    Proyecto p = new Proyecto(id_p,id_usr,bac,id_ty,nombre,fecha);
                    p.setObjetivo(Integer.parseInt(request.getParameter("objetivo")));
                    
                    boolean res = Conexion.agregarProyecto(p);
                    
                    response.sendRedirect("Proyectos.jsp?error=2&text=Proyecto registrado");
                }else{
                     response.sendRedirect("Proyectos.jsp?error=1&text=Nombre invalido");
                }
                
                response.sendRedirect("Proyectos.jsp?error=2&text=Proyecto registrado");
                
            }catch(Exception e){
                e.getMessage();
                e.getStackTrace();
            }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.sendRedirect("NuevoProyecto.jsp");
    }

        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
