/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend.ServletControl;

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
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String User = request.getParameter("user");
                String Pas = request.getParameter("pass"); 
                if (true) {
                    Usuario u = new Usuario();
                    u = u.validarUsuario(User, Pas);
                    if (u!=null) {
                        HttpSession sesion=request.getSession(true);
                        sesion.setAttribute("user", u);
                        if (u.getRol() == 1) {
                            response.sendRedirect("Home.jsp?v=0");
                        }else{
                            response.sendRedirect("dashboard.jsp?v=0");
                        }
                    }else{
                        response.sendRedirect("Login.jsp?error=1&text=Usuario o contraseña incorrectos");
                    }
                }else{
                    response.sendRedirect("Login.jsp?error=1&text=Ya hay una sesion iniciada");
                }
        }catch(Exception c){
                System.out.println(c.getMessage());
                System.out.println(c.getStackTrace());
        }
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp?error=1&text=Error");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
