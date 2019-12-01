<%-- 
    Document   : p
    Created on : 26-abr-2019, 12:42:57
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Backend.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Compartir proyecto</title>

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
<body >

<div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="Assets/img/sidebar-5.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="index.html" class="simple-text">
                        MicroUniverse
                    </a>
                </div>
    
                <ul class="nav">
                    <li>
                        <a href="Home.jsp">
                            <i class="pe-7s-graph"></i>
                            <p>Vista General</p>
                        </a>
                    </li>
                    <li>
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
                        <a class="navbar-brand" href="#">Compartir Proyecto</a>
                    </div>
                    <div class="collapse navbar-collapse">
    
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="user.jsp">
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
                                <h4 class="title">Compartir proyecto</h4>
                            </div>
                            <div class="content">
                                <form action="CProyecto" method="POST">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombre del proyecto</label>
                                                <input type="text" disabled="" readonly="" class="form-control" placeholder="Nombre" value="<%out.print(Conexion.getProyectoById(Integer.parseInt(request.getParameter("id"))).getNombre());%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Selecciona la bacteria a estudiar</label>
                                                <input type="text" disabled="" readonly="" class="form-control" placeholder="Nombre" value="<%
                                                    
                                                    try{
                                                      Connection c = Conexion.getConecction();
                                                      String q = "Select * from cbacteria;";
                                                       PreparedStatement set = c.prepareStatement(q);
                                                       ResultSet rs = set.executeQuery();

                                                       while(rs.next()){
                                                       if(rs.getInt(1)==Conexion.getProyectoById(Integer.parseInt(request.getParameter("id"))).getBacteria()){
                                                       out.print(rs.getString(2));
                                                       }
                                                       }

                                                       c.close();
                                                   }catch(Exception er){
                                                       System.out.println("no se conecto a la tabla");
                                                       System.out.println(er.getMessage());
                                                       System.out.println(er.getStackTrace());
                                                   }%>">
                                                <input type="hidden" value="<%int pr = Integer.parseInt(request.getParameter("id")) +123; out.print(pr);%>" name="pr">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Ingresa el codigo de la persona con quien vas a trabajar</label>
                                                <input type="text" required="" name="cod" placeholder="Ingresa el codigo para compartir" class="form-control">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Selecciona su funcion</label>
                                                <select class="form-control" name="funcion" id="funcion">
                                                    <%
                                                    try{
                                                      Connection c = Conexion.getConecction();
                                                      String q = "Select * from ctipouser;";
                                                       PreparedStatement set = c.prepareStatement(q);
                                                       ResultSet rs = set.executeQuery();

                                                       while(rs.next()){
                                                       %>
                                                       <option value="<%out.print(rs.getInt(1));%>"><%out.print(rs.getString(2));%></option>
                                                       <%
                                                       }

                                                       c.close();
                                                   }catch(Exception er){
                                                       System.out.println("no se conecto a la tabla");
                                                       System.out.println(er.getMessage());
                                                       System.out.println(er.getStackTrace());
                                                   }
                        %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Compartir Proyecto</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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
</div>


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

