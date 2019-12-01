<%-- 
    Document   : Proyectos
    Created on : 25-abr-2019, 7:50:33
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="java.io.IOException"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Proyectos.Proyecto"%>
<%@page import="Backend.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Proyectos</title>

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
    try{
        HttpSession sesionOk = request.getSession();
     ArrayList<Proyecto> p = Conexion.getProyectos();  
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
                    <a class="navbar-brand" href="#">Proyectos</a>
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
                        <h5>Numero de proyectos activos:</h5>
                        <input type="text" readonly class="form-control" value="<%
                            int pa = 0;
                            
                            for (Proyecto pT : p) {
                                if (pT.getId_usr()==((Usuario)sesionOk.getAttribute("user")).getId() && pT.getTipo()==1) {
                                    pa++;
                                }
                            }
                            out.print(pa);
                               %>">
                    </div>
                    <div class="col-md-4">
                        <h5>Numero de proyectos finalizados:</h5>
                        <input type="text" readonly class="form-control" value="<%
                               int pf = 0;
                            for (Proyecto pT : p) {
                                if (pT.getId_usr()==((Usuario)sesionOk.getAttribute("user")).getId() && pT.getTipo()==2) {
                                    pf++;
                                }
                            }
                            out.print(pf);
                               %>">

                    </div>
                    <div class="col-md-4">
                        <a href="NuevoProyecto.jsp"><h5>Nuevo Proyecto</h5></a>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Proyectos Activos</h4>
                                <p class="category"></p></p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>No Proyecto</th>
                                    	<th>Nombre</th>
                                    	<th>Fecha de creacion</th>
                                    	
                                    	<th>Opciones</th>
                                    </thead>
                                    <tbody>
                                    <%
                                        
                                   int contador = 0;
                                    if (p.size()>0) {
                                            for (Proyecto pT : p) {
                                                
                                                if (pT.getId_usr()==((Usuario)sesionOk.getAttribute("user")).getId() && pT.getTipo()==1) {
                                                %>
                                        <tr>
                                            <td><%contador++;out.print(contador);%></td>
                                        	<td><a href="Proyecto.jsp?id=<%int ix= pT.getId()+300;out.print(ix);%>"><%out.print(pT.getNombre());%></a></td>
                                        	<td><%out.print(pT.getFechaDeInicio());%></td>
                                        	
                                        	<td>
                                                    <form method="POST" action="Eliminar">
                                                        <input style="display: none" value="<%int en = pT.getId()+123;
                                                        out.print(en);%>" type="text" name="ide">
                                                        <input style="display:none" value="Proyectos" type="text" name="tipo">
                                                        <input class="btn" type="submit" value="Eliminar">
                                                    </form></td>
                                        </tr>        
                                    <%  }
                                                }
                                        }else{
                                        %>
                                        <tr>
                                            <td colspan="4"><h6>Aun no has creado ningun proyecto</h6></td>
                                        </tr>   
                                        <%     
                                        }
                                    %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Proyectos Finalizados</h4>
                                    <p class="category"></p></p>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>No Proyecto</th>
                                            <th>Nombre</th>
                                            <th>Fecha de creacion</th>
                                            
                                            <th>Opciones</th>
                                        </thead>
                                        <tbody>
                                    <%
                                    if (p.size()>0) {
                                            for (Proyecto pT : p) {
                                                if (pT.getId_usr()==((Usuario)sesionOk.getAttribute("user")).getId() && pT.getTipo()==2) {
                                                %>
                                        <tr>
                                            <td><%contador++;out.print(contador);%></td>
                                        	<td><a href="Proyecto.jsp?id=<%int ix= pT.getId()+300;out.print(ix);%>"><%out.print(pT.getNombre());%></a></td>
                                        	<td><%out.print(pT.getFechaDeInicio());%></td>
                                        	
                                        	<td><form method="POST" action="Eliminar">
                                                        <input style="display: none" value="<%int en = pT.getId()+123;
                                                        out.print(en);%>" type="text" name="ide">
                                                        <input style="display:none" value="Proyectos" type="text" name="tipo">
                                                        <input class="btn" type="submit" value="Eliminar">
                                                    </form> </td>
                                        </tr>        
                                    <%  }
                                                }
                                        }else{
                                        %>
                                        <tr>
                                            <td colspan="4"><h6>Aun no has terminado ningun proyecto</h6></td>
                                        </tr>   
                                        <%}%>
                                    </tbody>
                                    </table>
    
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                </div>
                <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Proyectos Compartidos</h4>
                                    <p class="category"></p>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>No Proyecto</th>
                                            <th>Nombre</th>
                                            <th>Fecha de creacion</th>
                                        </thead>
                                        <tbody>
                                    <%
                                    if (Conexion.getProyectosCom(((Usuario)sesionOk.getAttribute("user")).getId()).size()>0) {
                                            for (Proyecto pT : Conexion.getProyectosCom(((Usuario)sesionOk.getAttribute("user")).getId())) {
                                                System.out.println("");
                                                
                                                %>
                                        <tr>
                                            <td><%contador++;out.print(contador);%></td>
                                        	<td><a href="Proyecto.jsp?id=<%int ix= pT.getId()+300;out.print(ix);%>"><%out.print(pT.getNombre());%></a></td>
                                        	<td><%out.print(pT.getFechaDeInicio());%></td>
                                        </tr>        
                                    <%  }
                                                
                                        }else{
                                        %>
                                        <tr>
                                            <td colspan="4"><h6>No tienes proyectos compartidos</h6></td>
                                        </tr>   
                                        <%}%>
                                    </tbody>
                                    </table>
    
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                </div>
            </div>
            
        </div>
                                    <%
                                        
}catch(NullPointerException cu){
        response.sendRedirect("Login.jsp?error=1&text=Tu sesion ha caducado");
    }
                                    %>
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
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="Assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="Assets/js/demo.js"></script>
        
        <%
        try{
        int error = Integer.parseInt(request.getParameter("error"));
        
        if (error == 1) {
                %>
        <script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'pe-7s-science',
            	message: "<%out.print(request.getParameter("text"));%>"

            },{
                type: 'danger',
                timer: 3000
            });

    	});
	</script>
    <%
            }else{
                %>
        <script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'pe-7s-science',
            	message: "<%out.print(request.getParameter("text"));%>"

            },{
                type: 'success',
                timer: 3000
            });

    	});
	</script>
    <%
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
%>


</html>