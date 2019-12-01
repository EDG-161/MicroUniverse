/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import Backend.ServletControl.Validaciones;
import Entidades.Users.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aaron
 */
public class AgregarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try (PrintWriter out = response.getWriter()) {
            int user= Validaciones.validarUsername(request.getParameter("user-name"));
            int email=Validaciones.validarCorreo(request.getParameter("user-email"));
            int password=Validaciones.validarPassword(request.getParameter("user-pass"));
            
            String nombre=request.getParameter("user-name");
            String correo=request.getParameter("user-email");
            String contraseña=request.getParameter("user-pass");
            
            ArrayList<Usuario> p = Conexion.getUsuarios();
            
            for(Usuario o:p){
                
                if(request.getParameter("user-email").equals(o.getEmail())){
                    email=3;
                }
            }
            
            String contra1=request.getParameter("user-pass");
            String contra2=request.getParameter("user-repeatpass");
            String link="Registro.jsp";
            if(contra1.equals(contra2)==false){
                response.sendRedirect(link+"?error=1&text=Las contraseñas introducidas no coinciden");
               
            }else if(email==3){
               response.sendRedirect("Registro.jsp?error=1&text=Correo en uso");
            }else if(user==0 && email==0 && password==0){
                
                Usuario obj= new Usuario();
                
                obj.setNombre(nombre);
                obj.setEmail(correo);
                obj.setPassword(contraseña);
                obj.setId(0);
                obj.setRol(1);
                obj.setAcividad(request.getParameter("actividad"));
                obj.setPais(request.getParameter("pais"));
                
                boolean query= Conexion.agregarUsuario(obj);
                if(query==true){
                link="Login.jsp";
                response.sendRedirect(link+"?error=2&text=Usuario Registrado Correctamente");
                
                }else{
                    response.sendRedirect("Registro.jsp?error=1&text=Ha ocurrido un error inesperado");
                }
            }else if(user==1){
                response.sendRedirect("Registro.jsp?error=1&text=Campo de nombre vacio");
            }else if(user==2){
                response.sendRedirect("Registro.jsp?error=1&text=Nombre solo acepta letras");
            }else if(email==1){
                 response.sendRedirect("Registro.jsp?error=1&text=Campo de correo vacio");
            }else if(email==2){
                response.sendRedirect("Registro.jsp?error=1&text=>Asegurese de haber escrito su correo correctamente");
            }else if(password==1){
                response.sendRedirect("Registro.jsp?error=1&text=Campo de password vacio");
            }else if(password==2){
                response.sendRedirect("Registro.jsp?error=1&text=Asegurese de que la longitud de su contraseña este en el rango [6-20], la contraseña solo acepta:<br>"
                        + "- Letras"
                        + "- Números"
                        + "- '.' y ':'");
            }
        }
    }

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Registro.jsp?error=1&text=Buen intento");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
