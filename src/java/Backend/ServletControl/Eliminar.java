
package Backend.ServletControl;

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
public class Eliminar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("ide"))-123;
            System.out.println(id);
            String tipo = request.getParameter("tipo");
            out.println("<!doctype html>\n" +
"<html lang=\"en\">\n" +
"<head>\n" +
"	<meta charset=\"utf-8\" />\n" +
"	<link rel=\"icon\" type=\"image/png\" href=\"Assets/img/favicon.ico\">\n" +
"	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\n" +
"\n" +
"	<title>Agregar proyecto</title>\n" +
"\n" +
"	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\n" +
"    <meta name=\"viewport\" content=\"width=device-width\" />\n" +
"\n" +
"\n" +
"    <!-- Bootstrap core CSS     -->\n" +
"    <link href=\"Assets/css/bootstrap.min.css\" rel=\"stylesheet\" />\n" +
"\n" +
"    <!-- Animation library for notifications   -->\n" +
"    <link href=\"Assets/css/animate.min.css\" rel=\"stylesheet\"/>\n" +
"\n" +
"    <!--  Light Bootstrap Table core CSS    -->\n" +
"    <link href=\"Assets/css/light-bootstrap-dashboard.css?v=1.4.0\" rel=\"stylesheet\"/>\n" +
"\n" +
"    <!--     Fonts and icons     -->\n" +
"    <link href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n" +
"    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>\n" +
"    <link href=\"Assets/css/pe-icon-7-stroke.css\" rel=\"stylesheet\" />\n" +
"</head>\n" +
"<body >\n" +
"\n" +
"<div class=\"wrapper\">\n" +
"        <div class=\"sidebar\" data-color=\"purple\" data-image=\"Assets/img/sidebar-5.jpg\">\n" +
"            <div class=\"sidebar-wrapper\">\n" +
"                <div class=\"logo\">\n" +
"                    <a href=\"index.html\" class=\"simple-text\">\n" +
"                        MicroUniverse\n" +
"                    </a>\n" +
"                </div>\n" +
"    \n" +
"                <ul class=\"nav\">\n" +
"                    <li class=\"active\">\n" +
"                        <a href=\"Home.jsp\">\n" +
"                            <i class=\"pe-7s-graph\"></i>\n" +
"                            <p>Vista General</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"user.html\">\n" +
"                            <i class=\"pe-7s-user\"></i>\n" +
"                            <p>Datos de la cuenta</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"Proyectos.jsp\">\n" +
"                            <i class=\"pe-7s-note2\"></i>\n" +
"                            <p>Proyectos</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"typography.html\">\n" +
"                            <i class=\"pe-7s-tools\"></i>\n" +
"                            <p>Herramientas</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"icons.html\">\n" +
"                            <i class=\"pe-7s-users\"></i>\n" +
"                            <p>Usuarios *Admin</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                </ul>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"    <div class=\"main-panel\">\n" +
"		<nav class=\"navbar navbar-default navbar-fixed\">\n" +
"                <div class=\"container-fluid\">\n" +
"                    <div class=\"navbar-header\">\n" +
"                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navigation-example-2\">\n" +
"                            <span class=\"sr-only\">Toggle navigation</span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                        </button>\n" +
"                        <a class=\"navbar-brand\" href=\"#\">Eliminar "+tipo+"</a>\n" +
"                    </div>\n" +
"                    <div class=\"collapse navbar-collapse\">\n" +
"    \n" +
"                        <ul class=\"nav navbar-nav navbar-right\">\n" +
"                            <li>\n" +
"                               <a href=\"\">\n" +
"                                   <p>Cuenta</p>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                            <li>\n" +
"                                <a href=\"#\">\n" +
"                                    <p>Cerrar Sesion</p>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                            <li class=\"separator hidden-lg hidden-md\"></li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </nav>\n" +
"\n" +
"\n" +
"        <div class=\"content\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-md-8\">\n" +
"                        <div class=\"card\">\n" +
"                            <div class=\"header\">\n" +
"                                <h4 class=\"title\">Eliminar "+tipo+"</h4>\n" +
"                            </div>\n" +
"                            <div class=\"content\">\n" +
"                                <form action=\"Eliminar"+tipo+"\" method=\"POST\">\n" +
"                                    <div class=\"row\">\n" +
"                                        <div class=\"col-md-12\">\n" +
"                                            <div class=\"form-group\">\n" +
"                                                <label>Ingresa tu contraseña para confirmar</label>\n" +
                                                 "<input type=\"text\" value=\""+id+"\" style=\"display:none\" name=\"ideae\"> "+
"                                                <input type=\"password\" name=\"pas_el\" required class=\"form-control\" placeholder=\"Contraseña\" value=\"Password\">\n" +
"                                            </div>\n" +
"                                        </div>\n" +
"                                    </div>\n"
                                                         + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\">Eliminar "+tipo+"</button>\n" +
"                                    <div class=\"clearfix\"></div>\n" +
"                                </form>" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"\n" +
"        <footer class=\"footer\">\n" +
"            <div class=\"container-fluid\">\n" +
"                \n" +
"                <p class=\"copyright pull-right\">\n" +
"                    &copy; <script>document.write(new Date().getFullYear())</script> <a href=\"index.html\">Coatl - MicroUniverse</a>\n" +
"                </p>\n" +
"            </div>\n" +
"        </footer>\n" +
"\n" +
"    </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"</body>\n" +
"\n" +
"    <!--   Core JS Files   -->\n" +
"    <script src=\"Assets/js/jquery.3.2.1.min.js\" type=\"text/javascript\"></script>\n" +
"	<script src=\"Assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n" +
"\n" +
"	<!--  Charts Plugin -->\n" +
"	<script src=\"Assets/js/chartist.min.js\"></script>\n" +
"\n" +
"    <!--  Notifications Plugin    -->\n" +
"    <script src=\"Assets/js/bootstrap-notify.js\"></script>\n" +
"\n" +
"    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->\n" +
"	<script src=\"Assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\n" +
"\n" +
"	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\n" +
"	<script src=\"Assets/js/demo.js\"></script>\n" +
"\n" +
"</html>");
          
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("ide"))-123;
            System.out.println(id);
            String tipo = request.getParameter("tipo");
            out.println("<!doctype html>\n" +
"<html lang=\"en\">\n" +
"<head>\n" +
"	<meta charset=\"utf-8\" />\n" +
"	<link rel=\"icon\" type=\"image/png\" href=\"Assets/img/favicon.ico\">\n" +
"	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\n" +
"\n" +
"	<title>Agregar proyecto</title>\n" +
"\n" +
"	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />\n" +
"    <meta name=\"viewport\" content=\"width=device-width\" />\n" +
"\n" +
"\n" +
"    <!-- Bootstrap core CSS     -->\n" +
"    <link href=\"Assets/css/bootstrap.min.css\" rel=\"stylesheet\" />\n" +
"\n" +
"    <!-- Animation library for notifications   -->\n" +
"    <link href=\"Assets/css/animate.min.css\" rel=\"stylesheet\"/>\n" +
"\n" +
"    <!--  Light Bootstrap Table core CSS    -->\n" +
"    <link href=\"Assets/css/light-bootstrap-dashboard.css?v=1.4.0\" rel=\"stylesheet\"/>\n" +
"\n" +
"    <!--     Fonts and icons     -->\n" +
"    <link href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n" +
"    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>\n" +
"    <link href=\"Assets/css/pe-icon-7-stroke.css\" rel=\"stylesheet\" />\n" +
"</head>\n" +
"<body >\n" +
"\n" +
"<div class=\"wrapper\">\n" +
"        <div class=\"sidebar\" data-color=\"purple\" data-image=\"Assets/img/sidebar-5.jpg\">\n" +
"            <div class=\"sidebar-wrapper\">\n" +
"                <div class=\"logo\">\n" +
"                    <a href=\"index.html\" class=\"simple-text\">\n" +
"                        MicroUniverse\n" +
"                    </a>\n" +
"                </div>\n" +
"    \n" +
"                <ul class=\"nav\">\n" +
"                    <li class=\"active\">\n" +
"                        <a href=\"Home.jsp\">\n" +
"                            <i class=\"pe-7s-graph\"></i>\n" +
"                            <p>Vista General</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"user.html\">\n" +
"                            <i class=\"pe-7s-user\"></i>\n" +
"                            <p>Datos de la cuenta</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"Proyectos.jsp\">\n" +
"                            <i class=\"pe-7s-note2\"></i>\n" +
"                            <p>Proyectos</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"typography.html\">\n" +
"                            <i class=\"pe-7s-tools\"></i>\n" +
"                            <p>Herramientas</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                    <li>\n" +
"                        <a href=\"icons.html\">\n" +
"                            <i class=\"pe-7s-users\"></i>\n" +
"                            <p>Usuarios *Admin</p>\n" +
"                        </a>\n" +
"                    </li>\n" +
"                </ul>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"    <div class=\"main-panel\">\n" +
"		<nav class=\"navbar navbar-default navbar-fixed\">\n" +
"                <div class=\"container-fluid\">\n" +
"                    <div class=\"navbar-header\">\n" +
"                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navigation-example-2\">\n" +
"                            <span class=\"sr-only\">Toggle navigation</span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                            <span class=\"icon-bar\"></span>\n" +
"                        </button>\n" +
"                        <a class=\"navbar-brand\" href=\"#\">Eliminar "+tipo+"</a>\n" +
"                    </div>\n" +
"                    <div class=\"collapse navbar-collapse\">\n" +
"    \n" +
"                        <ul class=\"nav navbar-nav navbar-right\">\n" +
"                            <li>\n" +
"                               <a href=\"\">\n" +
"                                   <p>Cuenta</p>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                            <li>\n" +
"                                <a href=\"#\">\n" +
"                                    <p>Cerrar Sesion</p>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                            <li class=\"separator hidden-lg hidden-md\"></li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </nav>\n" +
"\n" +
"\n" +
"        <div class=\"content\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-md-8\">\n" +
"                        <div class=\"card\">\n" +
"                            <div class=\"header\">\n" +
"                                <h4 class=\"title\">Eliminar "+tipo+"</h4>\n" +
"                            </div>\n" +
"                            <div class=\"content\">\n" +
"                                <form action=\"Eliminar"+tipo+"\" method=\"POST\">\n" +
"                                    <div class=\"row\">\n" +
"                                        <div class=\"col-md-12\">\n" +
"                                            <div class=\"form-group\">\n" +
"                                                <label>Ingresa tu contraseña para confirmar</label>\n" +
                                                 "<input type=\"text\" value=\""+id+"\" style=\"display:none\" name=\"ideae\"> "+
"                                                <input type=\"password\" name=\"pas_el\" required class=\"form-control\" placeholder=\"Contraseña\" value=\"Password\">\n" +
"                                            </div>\n" +
"                                        </div>\n" +
"                                    </div>\n"
                                                         + "<button type=\"submit\" class=\"btn btn-info btn-fill pull-right\">Eliminar "+tipo+"</button>\n" +
"                                    <div class=\"clearfix\"></div>\n" +
"                                </form>" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"\n" +
"        <footer class=\"footer\">\n" +
"            <div class=\"container-fluid\">\n" +
"                \n" +
"                <p class=\"copyright pull-right\">\n" +
"                    &copy; <script>document.write(new Date().getFullYear())</script> <a href=\"index.html\">Coatl - MicroUniverse</a>\n" +
"                </p>\n" +
"            </div>\n" +
"        </footer>\n" +
"\n" +
"    </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"</body>\n" +
"\n" +
"    <!--   Core JS Files   -->\n" +
"    <script src=\"Assets/js/jquery.3.2.1.min.js\" type=\"text/javascript\"></script>\n" +
"	<script src=\"Assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n" +
"\n" +
"	<!--  Charts Plugin -->\n" +
"	<script src=\"Assets/js/chartist.min.js\"></script>\n" +
"\n" +
"    <!--  Notifications Plugin    -->\n" +
"    <script src=\"Assets/js/bootstrap-notify.js\"></script>\n" +
"\n" +
"    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->\n" +
"	<script src=\"Assets/js/light-bootstrap-dashboard.js?v=1.4.0\"></script>\n" +
"\n" +
"	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->\n" +
"	<script src=\"Assets/js/demo.js\"></script>\n" +
"\n" +
"</html>");
          
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
