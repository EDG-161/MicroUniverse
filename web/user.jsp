<%-- 
    Document   : user
    Created on : 8/05/2019, 05:22:39 PM
    Author     : Profesor
--%>
<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Entidades.Proyectos.Pais"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    Usuario uwu=new Usuario();
    
    
    try{
        HttpSession sesionOk = request.getSession();
        Usuario u = (Usuario)sesionOk.getAttribute("user");
        uwu.setNombre(u.getNombre());
        uwu.setPassword(u.getPassword());
        uwu.setEmail(u.getEmail());
        uwu.setAcividad(u.getAcividad());
        uwu.setId(u.getId());
        uwu.setPais(u.getPais());
        uwu.setRol(u.getRol());
        int v = 1;
        
    

       
%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Cuenta</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="Assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="Assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="Assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body>

<div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="Assets/img/sidebar-5.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="index.html" class="simple-text">
                        MicroUniverse
                    </a>
                </div>
    
                <ul class="nav">
                    <li >
                        <a href="Home.jsp">
                            <i class="pe-7s-graph"></i>
                            <p>Vista General</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="user.jsp">
                            <i class="pe-7s-user"></i>
                            <p>Datos de la cuenta</p>
                        </a>
                    </li>
                    <li>
                        <a href="Proyectos.jsp">
                            <i class="pe-7s-note2"></i>
                            <p>Proyectos</p>
                        </a>
                    </li>
                    <li>
                        <a href="http://<%=new direccion().dir%>:8005/gtr/">
                            <i class="pe-7s-tools"></i>
                            <p>Herramientas</p>
                        </a>
                    </li>
               
                </ul>
            </div>
        </div>

    <div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Cuenta</a>
                    </div>
                    <div class="collapse navbar-collapse">
    
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="">
                                   <p>Cuenta</p>
                                </a>
                            </li>
                            <li>
                                <a href="LogOff">
                                    <p>Cerrar Sesion</p>
                                </a>
                            </li>
                            <li class="separator hidden-lg hidden-md"></li>
                        </ul>
                    </div>
                </div>
            </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Editar cuenta</h4>
                            </div>
                            <div class="content">
                                <form action="EditarUsuario" method="POST">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" class="form-control"  disabled placeholder="Nombre" value="<%out.println(uwu.getNombre());%>">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Contraseña</label>
                                                <input type="text" class="form-control" name="pass" placeholder="Contraseña" value="<%out.println(uwu.getPassword());%>">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Direccion de correo</label>
                                                <input type="email" class="form-control"  name="Correo" value="<%out.println(uwu.getEmail());%>">
                                            </div>
                                        </div>
                                    </div>
                                             <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>País</label>
                                                 
                                                    <%
                                                        ArrayList<Pais> p = Conexion.getPaises();
                                                   
                                                    %>
                                                   
                                                    <input type="text" class="form-control" disabled placeholder="Actividad" value="<%out.println(p.get(Integer.parseInt(uwu.getPais())+1).getName());%>">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Actividad</label>
                                                <input type="text" class="form-control" disabled placeholder="Actividad" value="<%
                                                    
                                                    
                                                    if(uwu.getAcividad()=="1"){
                                                        out.println("Estudiante");
                                                    }else{
                                                        out.println("Investigador");
                                                    }
                                                
                                                %>">
                                            </div>
                                        </div>
                                            
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Codigo para compartir</label>
                                                <input type="text" class="form-control" disabled placeholder="Actividad" value="<%
                                                        
                                                    out.println(((uwu.getId()+500))*753159);
                                                %>">
                                            </div>
                                        </div>
                                        
                                    </div>

                                    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">
                            <div class="content">
                            <input type="submit" value="Guardar Cambios" class="btn btn-success btn-fill">
                            </div>
                        </div>
                    </div>
                </div> 
                </form>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="index.html">Coatl - MicroUniverse</a>
                </p>
            </div>
        </footer>

    </div>
</div><%
}catch(NullPointerException npe){
        response.sendRedirect("Login.jsp?error=1&text=La sesion ha caducado");
    
    
    
    }%>


</body>

    <!--   Core JS Files   -->
    <script src="Assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="Assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="Assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="Assets/js/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="Assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="Assets/js/demo.js"></script>
        
</html>

