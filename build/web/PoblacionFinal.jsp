<%-- 
    Document   : PoblacionFinal
    Created on : 18-may-2019, 18:55:25
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Backend.ServletControl.ProyectosControl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Proyectos.Informe"%>
<%@page import="Entidades.Proyectos.Poblacion"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.Proyectos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Poblacion</title>

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
    
    <%
        Proyecto p =null;
        
    try{
        HttpSession sesionOk = request.getSession();
        Poblacion pob = Conexion.getPoblacionById(Integer.parseInt(request.getParameter("id")));
        p = Conexion.getProyectoById(pob.getId_pry());
        if (p==null&&request.getParameter("id")!=null) {
            response.sendRedirect("Proyectos.jsp");
        }else if (p.getId_usr()!= ((Usuario)sesionOk.getAttribute("user")).getId()) {
            response.sendRedirect("Proyectos.jsp");
        }
        
    
    %>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="Assets/img/sidebar-5.jpg">
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="index.html" class="simple-text">
                    MicroUniverse
                </a>
            </div>

            <ul class="nav">
                <li class="active">
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
                    <a class="navbar-brand" href="#">Poblacion Finalizada</a>
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
                    <div class="col-md-3">
                        <h5>Poblacion inicial:</h5>
                        <input type="text" readonly class="form-control" value="<%out.print(pob.getPob_in());%>">
                    </div>
                    <div class="col-md-3">
                        <h5>Poblacion final:</h5>
                        <input type="text" id="PEA" readonly class="form-control" value="">

                    </div>
                    <div class="col-md-6">
                        <h5>Variables:</h5> 
                        <div class="conteiner">
                            <div class="row">
                                <div class="col-md-4" style="text-align:center;">Temperatura <%out.print(pob.getTemperatura());%></div>
                                <div class="col-md-4" style="text-align:center;">Ph <%out.print(pob.getPh());%></div>
                                <div class="col-md-4" style="text-align:center;">Actividad de agua <%out.print(pob.getOxigeno());%></div>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <div class="row">
                    <div class="col-md-7">
                        <div class="card">

                            <div class="header">
                                <h4 class="title">Crecimiento real</h4>
                                
                            </div>
                            <div class="content">
                                <div class="card">
                                     <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                                        <script type="text/javascript" src="http://<%=new direccion().dir%>:8005/graficar/<%out.print(pob.getId_pob());%>"></script>
                                        <div id="Graficar"></div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                            <div class="card">
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Tiempo de generacion:</th>
                                                <td><input type="text" id="TG" readonly class="form-control" value=""></td>
                                            </tr>
                                            <tr>
                                                <th>Etapa de latencia:</th>
                                                <td><input type="text" id="EL" readonly class="form-control" value=""></td>
                                            </tr>
                                            <tr>
                                                <th>Etapa logaritmica:</th>
                                                <td><input type="text" id="ELO" readonly class="form-control" value=""></td>
                                            </tr>
                                            <tr>
                                                <th>Etapa estacionaria:</th>
                                                <td><input type="text" id="EE" readonly class="form-control" value=""></td>
                                            </tr>
                                        </thead>
                                    </table>
    
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
                                    	
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Informe> infor = Conexion.getInforme(pob.getId_pob());
                                            if (infor.size()>0) {
                                                
                                            for (Informe infT : infor) {
                                                Informe tm = ProyectosControl.leerInforme(infT.getRuta());
                                                %>
                                                <tr>
                                                    
                                                        <td><%out.print(infT.getNombre());%></td>
                                                        <td><a href="http://<%=new direccion().dir%>:8001/MicroUniverse_Informe/bd/informe_gener.php?id=<%out.print(tm.getId_inf());%>&t=<%out.print(tm.getText());%>&tm=<%out.print(tm.getTm());%>&ph=<%out.print(tm.getPh());%>&aw=<%out.print(tm.getAw());%>&pob=<%out.print(tm.getPob());%>&f=<%out.print(tm.getDate());%>">Ver</a>/<a href="Eliminar?id=<%out.print(infT.getId_inf());%>">Eliminar</a> </td>
                                                </tr>
                                        <%
                                            }
                                        }else{
                                            %>
                                        <tr>
                                            <td colspan="3"><h5>No tienes informes </h5></td>
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
                    <div class="clearfix"></div>
            </div>
<script src="http://<%=new direccion().dir%>:8005/dataf/<%out.print(pob.getId_pob());%>/<%out.print(ProyectosControl.RestarFechasF(pob.getFi(),pob.getFf()));%>" type="text/javascript"></script>

<%
}catch(NullPointerException ne){
    response.sendRedirect("Login.jsp?error=2&text=Inicia sesion para continuar");
}
%>

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


</body>
    <!--   Core JS Files   -->
    <script src="Assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="Assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="Assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="Assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="Assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="Assets/js/demo.js"></script>


</html>
