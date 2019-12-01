<%-- 
    Document   : newjsp
    Created on : 25-abr-2019, 8:18:44
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Backend.ServletControl.ProyectosControl"%>
<%@page import="Entidades.Proyectos.Proyecto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Conexion"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Vista General</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
<style>
    a{
        color:#29B0C3;
    }
</style>
<body>
<%
try{
HttpSession sesionOk = request.getSession();
Usuario u = (Usuario)sesionOk.getAttribute("user");
    int v = 1;
   try{
        v = Integer.parseInt(request.getParameter("v"));
   }catch(NumberFormatException ne){
       v=1;
   }
   
    
    if (u.getRol()!=2 && v != 0) {
            response.sendRedirect("Home.jsp?v=0");
        }else if (u.getRol()==2&& v != 0) {
            response.sendRedirect("dashboard.jsp?v=0");
        }
    ArrayList<Proyecto> p = Conexion.getProyectos();  
%>
<div class="wrapper">
    

    <div class="">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="index.html" style="color: #29B0C3"><h4><img style="width:30px;" src="Assets/Bacteri-icon.png">MICROUNIVERSE</h4></a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="user.jsp">
                               <p><h6>Usuario: <%out.print(u.getNombre());%></h6></p>
                            </a>
                        </li>
                     
                        <li>
                            <a href="LogOff">
                                <p>Cerrar Sesion</p>
                            </a>
                        </li
                    </ul>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content">
                        <h3>Vista General</h3>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <a href="user.jsp"><div class="card">
                            <div class="header">
                                <h4 class="center-block">Datos de la cuenta</h4>
                            </div>
                            <div class="content center-block" style="width: 20vh;" >
                                <img src="imagenes/usuario.png" class="img-responsive img-circle">
                            </div>
                        </div></a>
                    </div>
                    <div class="col-md-4">
                        <a href="Proyectos.jsp">
                        <div class="card">
                            <div class="header">
                                 <h4>Proyectos</h4>
                            </div>
                            <div class="content center-block" style="width: 20vh">
                                <img src="imagenes/porta.png" class="img-responsive img-circle">
                            </div>
                        </div>
                        </a>
                        
                    </div>
                    <div class="col-md-4">
                        <a href="http://<%=new direccion().dir%>:8005/gtr">
                        <div class="card">
                            <div class="header">
                                 <h4>Herramientas</h4>
                            </div>
                            <div class="content center-block" style="width: 20vh">
                                <img src="imagenes/instrumentos.png" class="img-responsive img-circle">
                            </div>
                        </div>
                        </a>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card" style="padding: 30px;">
                            
                            <div class="header">
                                <h4 class="title">Proyectos</h4>
                                <p class="category">Y dias de investigacion</p>
                            </div> 
                            <div class="content">     
                            <%
                                        
                                int contador = 0;
                                if (p.size()>0) {
                                    %>
                                    <div id="pry" class="center-block" style="width: 90%;margin-top: 30px;"></div>
                                    <script type="text/javascript">
                                            google.charts.load('current', {'packages':['bar']});
                                            google.charts.setOnLoadCallback(drawChart);

                                            function drawChart() {
                                              var data = google.visualization.arrayToDataTable([
                                                  ["Proyecto", "Duracion"],
                                                  
                                    <%for (Proyecto pT : p) {
                                        if (pT.getId_usr()==((Usuario)sesionOk.getAttribute("user")).getId()) {
                                            out.print("['"+pT.getNombre()+"', "+ProyectosControl.RestarFechas(pT.getFechaDeInicio())+"],");
                                        %>
                                        <%
                                            }
                                        }
                                        %>
                                              ]);

                                            var options = {
                                                
                                              axes: {
                                                x: {
                                                  0: { side: 'bottom', label: 'Duracion'} // Top x-axis.
                                                }
                                              },
                                              chart: {
                                                title: 'Proyectos',
                                                subtitle: 'Duración',
                                              },
                                              bars: 'horizontal' // Required for Material Bar Charts.
                                            };

                                            var chart = new google.charts.Bar(document.getElementById('pry'));

                                            chart.draw(data, google.charts.Bar.convertOptions(options));
                                          }
                                    </script>
                                      <%
                                        }else{
                                        %>
                                    
                                    <h6>Aun no has creado ningun proyecto</h6>
                                        
                                        <%     
                                        }
                                    %>
                                    
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Bacterias</h4>
                                <p class="category">Y reparticion de proyectos</p>
                            </div>  
                            <%
                                        
                                contador = 0;
                                if (p.size()>0) {
                                    %>
                                    <div id="pry1" class="center-block" style="width: 90%;margin-top: 30px;">

                                        </div>
                                        <script type="text/javascript">
                                            google.charts.load('current', {'packages':['corechart']});
                                            google.charts.setOnLoadCallback(drawChart);

                                            function drawChart() {

                                              var data = google.visualization.arrayToDataTable([
                                                ['Bacteria', 'Proyectos'],
                                                <%
                                                try{
                                                      Connection c = Conexion.getConecction();
                                                      String q = "Select * from cbacteria;";
                                                       PreparedStatement set = c.prepareStatement(q);
                                                       ResultSet rs = set.executeQuery();

                                                       while(rs.next()){
                                                           contador = 0;
                                                           for(Proyecto pT:p){
                                                                if(rs.getInt(1)==pT.getBacteria()&&pT.getId_usr()==u.getId()){
                                                                    contador++;
                                                                }
                                                           }
                                                           out.print("['"+rs.getString(2)+"', "+contador+"],");
                                                       }

                                                       c.close();
                                                   }catch(Exception er){
                                                       System.out.println("no se conecto a la tabla");
                                                       System.out.println(er.getMessage());
                                                       System.out.println(er.getStackTrace());
                                                   }
                                                %>
                                                
                                              ]);

                                              var options = {
                                                height:400,
                                                title: ''
                                              };

                                              var chart = new google.visualization.PieChart(document.getElementById('pry1'));

                                              chart.draw(data, options);
                                            }
                                          </script>
                                      <%
                                        }else{
                                        %>
                                        <h6>Aun no has creado ningun proyecto</h6>
                                        
                                        <%     
                                        }
                                    %>
                                     
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<%
}catch(NullPointerException ne){
    response.sendRedirect("Login.jsp?error=1&text=Tu sesion ha caducado");
}%>

<footer class="footer" style="margin-top: 500px;">
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


	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'pe-7s-science',
            	message: "Bienvenido a <b>MicroUniverse</b>."

            },{
                type: 'info',
                timer: 4000
            });

    	});
	</script>

</html>

