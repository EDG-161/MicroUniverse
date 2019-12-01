<%-- 
    Document   : Poblacion
    Created on : 07-may-2019, 22:47:05
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Backend.ServletControl.ProyectosControl"%>
<%@page import="Entidades.Proyectos.Informe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page import="Entidades.Proyectos.Poblacion"%>
<%@page import="Backend.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    
<head>
  <%Poblacion p =null;
    try{
        HttpSession sesionOk = request.getSession();
        p = Conexion.getPoblacionById(Integer.parseInt(request.getParameter("id")));
        if (p==null) {
            response.sendRedirect("Proyectos.jsp");
        }else if (Conexion.getProyectoById(p.getId_pry()).getId_usr()!= ((Usuario)sesionOk.getAttribute("user")).getId()) {
            response.sendRedirect("Proyectos.jsp");
        }}catch(Exception e){
            response.sendRedirect("Proyectos.jsp");    
        }
  %>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Poblacion <%%></title>

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
    <div class="sidebar" data-image="Assets/img/sidebar-5.jpg">
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
                <li>
                    <a href="user.jsp">
                        <i class="pe-7s-user"></i>
                        <p>Datos de la cuenta</p>
                    </a>
                </li>
                <li class="active">
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
                    <a class="navbar-brand" href="#">Poblacion <%out.print(request.getParameter("con"));%></a>
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

                <div class="row" style="margin-bottom:20px;">
                    
                    <div class="col-md-4">
                        <h5>Poblacion estimada actual:</h5>
                        <input type="text" id="PEA" readonly class="form-control">

                    </div>
                    <div class="col-md-4">
                        <h5>Variables actuales:</h5>
                        <input type="text" readonly class="form-control" value="<%out.print("Temperatura: "+p.getTemperatura()+"Ph: "+p.getPh()+"Actividad de agua: "+p.getOxigeno());%>">

                    </div>
                    <div class="col-md-4">
                        <input class="btn btn-danger" value="Finalizar Poblacion" type ="button" name="finalizar" onclick="location.href='Finalizar?tipo=2&id=<%out.print(p.getId_pob());%>'">

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Graficas
                                </h4>
                                <p class="category"></p>
                            </div>     
                        </div>
                        <div class="col-md-6">
                                <div class="card">
                                    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                                    <script type="text/javascript" src="http://<%=new direccion().dir%>:8005/grafica/<%out.print(p.getId_pob());%>"></script>
                                    <div id="Grafica"></div>
                                </div>
                            </div>
                            <div class="col-md-6    ">
                                    <div class="card">
                                        <script type="text/javascript" src="http://<%=new direccion().dir%>:8005/graficar/<%out.print(p.getId_pob());%>"></script>
                                        <div id="Graficar"></div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                        <div class="card">
                
                                        
                                        </div>
                                    </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Informes
                                </h4>
                                <p class="category"></p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>Informe</th>
                                        <th>Fecha</th>
                                    	<th>Herramientas</th>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Informe> infor = Conexion.getInforme(p.getId_pob());
                                            if (infor.size()>0) {
                                                
                                            for (Informe infT : infor) {
                                                %>
                                                <tr>
                                                    <td><a href="">Informe <%out.print(infT.getId_inf());%></a></td>
                                                        <td><%out.print(infT.getNombre());%></td>
                                                        <td><a href="Informe.jsp?c=<%out.print(ProyectosControl.leerInforme(infT.getRuta()));%>&titulo=<%out.print(infT.getNombre());%>&l=<%out.print(infT.getId_inf());%>">Editar</a>/<a href="Eliminar?id=<%out.print(infT.getId_inf());%>">Eliminar</a> </td>
                                                </tr>
                                        <%
                                            }
                                        }else{
                                            %>
                                        <tr>
                                            <td colspan="3"><h5>Aun no tienes informes </h5></td>
                                                </tr>
                                                <%
                                            }      
                                        %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Ingresar Crecimieto
                                </h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <form action="GCrecimiento" method="POST">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>Hora</th>
                                            <th>Poblacion</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> 
                                                    <div class="conteiner">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <input type="hidden" readonly name="id" value="<%out.print(p.getId_pob());%>">
                                                                <input type="number" required name="1h" pattern="[0-9]" class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </td>
                                                <td> 
                                                    <div class="conteiner">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                    <input type="number" required name="1p" step="any" class="form-control">
                                                            </div>
                                                            <div class="col-md-6">
                                                                    log
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </td>
                                            </tr>
                                            <tr>
                                                    <td> 
                                                        <div class="conteiner">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                        <input type="number" required name="2h" pattern="[0-9]" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>  
                                                    </td>
                                                    <td> 
                                                        <div class="conteiner">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                        <input type="number" required name="2p" step="any" class="form-control">
                                                                </div>
                                                                <div class="col-md-6">
                                                                        log
                                                                </div>
                                                            </div>
                                                        </div>  
                                                    </td>
                                                </tr>
                                                 <tr>
                                                <td> 
                                                    <div class="conteiner">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                    <input type="number" required name="3h" pattern="[0-9]" class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </td>
                                                <td> 
                                                    <div class="conteiner">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input type="number" required name="3p" step="any" class="form-control">
                                                            </div>
                                                            <div class="col-md-6">
                                                                    log
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center"> <input type="submit" class="btn" value="Guardar crecimiento"> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
            </div>

            <div class="row" style="margin-bottom:20px;">
                <div class="col-md-12">
                    <button class="btn btn-primary" onclick="document.location.href='Informe.jsp?l=<%out.print(p.getId_pob());%>'">Registrar informe</button>
                </div>
            </div>
            <div class="clearfix"></div>
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
        <script src="http://<%=new direccion().dir%>:8005/data/<%out.print(p.getId_pob());%>/<%out.print(ProyectosControl.RestarFechasE(p.getFi()));%>" type="text/javascript"></script>
	<!--  Charts Plugin -->
	<script src="Assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="Assets/js/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="Assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="Assets/js/demo.js"></script>


</html>

