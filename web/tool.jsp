<%-- 
    Document   : Proyectos
    Created on : 25-abr-2019, 7:50:33
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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

	<title>Herramientas</title>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <script>
        
        document.location.href = "<%=new direccion().dir%>:8005/gtr";
    </script>

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
                        <a href="tool.jsp">
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
                        <a class="navbar-brand" href="#">Herramientas</a>
                    </div>
                    <div class="collapse navbar-collapse">


                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="user.jsp">
                                   <p>Cuenta</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
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
                        <div class="col-md-5">
                            <div class="card">
                                <div class="header">

                                </div>
                                <div class="content">
                                    <form method="GET" action="http://<%=new direccion().dir%>:8005/graficart" id="formulario">
                                    <div class="form-group">
                                                    <label>Selecciona la bacteria</label>
                                                    <select class="form-control" name="bacteria" id="bacteria">
                                                        <%
                                                        try{
                                                          Connection c = Conexion.getConecction();
                                                          String q = "Select * from cbacteria;";
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
                                        <div class="form-group">
                                            <label>UFC inicial</label>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <input type="range" class="form-control-range" id="ufcrango" min=0 max="7" step="0.5">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input class="form-control" name="ufcnumero" type="number" id="ufcnumero" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Temperatura</label>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <input type="range" class="form-control-range" id="temperaturarango" min=10 max="40" step="0.1">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input class="form-control" type="number" name="temperaturanumero" id="temperaturanumero" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Ph</label>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <input type="range" class="form-control-range" id="phrango" min=4 max="10" step="0.1">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input class="form-control" type="number" name="phnumero" id="phnumero" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Actividad de agua</label>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <input type="range" class="form-control-range" id="awrango" min=0.96 max="1" step="0.001">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input class="form-control" type="number" name="awnumero" id="awnumero" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                    <input type="submit" value="probar">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="card">
                                <div class="content">
                                    <div id="grRT"></div>

                                    <script type="text/javascript" src="JS/ajaxb.js"></script>
                                </div>
                            </div>
                        </div>
                    </div>
                                            <%


    }catch(NullPointerException cu){
            response.sendRedirect("Login.jsp?error=1&text=Tu sesion ha caducado");
        }
                                        %>

                        <div class="clearfix"></div>
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


    </body>

    <!--   Core JS Files   -->
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
		{
		$('#ufcrango').change(function() {
		$('#ufcnumero').val($(this).val());
		});
                $('#temperaturarango').change(function() {
		$('#temperaturanumero').val($(this).val());
		});
                $('#phrango').change(function() {
		$('#phnumero').val($(this).val());
		});
                $('#awrango').change(function() {
		$('#awnumero').val($(this).val());
		});
	});
</script>
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