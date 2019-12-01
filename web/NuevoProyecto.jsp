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

	<title>Agregar proyecto</title>

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
                        <a class="navbar-brand" href="#">Agregar Proyecto</a>
                    </div>
                    <div class="collapse navbar-collapse">
    
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="Proyectos.jsp">
                                   <p>Agregar proyecto</p>
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
                                <h4 class="title">Agregar proyecto</h4>
                            </div>
                            <div class="content">
                                <form action="AgregarProyecto" method="POST">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombre del proyecto</label>
                                                <input type="text" name="nombre_pr" required class="form-control" placeholder="Nombre" value="Nombre del proyecto">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Selecciona la bacteria a estudiar</label> <a href="http://<%=new direccion().dir%>:8005/gtr/">Conoce nuestras bacterias</a>
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
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label title="Crecimiento: Mantener el mayor tiempo posible en la etapa de crecimiento

Estabilidad: Hacer que la bacteria esté en su punto máximo de crecimiento el mayor tiempo posible">Selecciona el objetivo a alcanzar</label>
                                                <select class="form-control" name="objetivo" id="objetivo"
                                                        title="">
                                                    <%
                                                    try{
                                                      Connection c = Conexion.getConecction();
                                                      String q = "Select * from cobjetivos;";
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
                                                
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Agregar Proyecto</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h5 class="title">Descripcion</h5>
                            </div>
                            <div class="content">
                                <label id="des-bac">Escherichia coli, es una bacteria miembro de la familia de las enterobacterias y forma parte de la microbiota del tracto gastrointestinal de animales homeotermos, como por ejemplo el ser humano.</label>
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <h5 class="title">Objetivo</h5>
                            </div>
                            <div class="content">
                                <label id="des-obj">Crecimiento: Mantener el mayor tiempo posible en la etapa de crecimiento.</label>
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
        
        <script>
            $('#bacteria').change(function(e){
                var sc = "Escherichia coli, es una bacteria miembro de la familia de las enterobacterias y forma parte de la microbiota del tracto gastrointestinal de animales homeotermos, como por ejemplo el ser humano.";
                var sal = "Salmonella, de nombre común salmonela, ​ es un género bacteriano perteneciente a la familia Enterobacteriaceae constituido por bacilos gramnegativos intracelulares anaerobios facultativos con flagelos peritricos. Constituye un grupo importante de patógenos para animales y humanos.";
                var sta = "Staphylococcus aureus, conocido como estafilococo áureo o estafilococo dorado, es una bacteria anaerobia facultativa, grampositiva, productora de coagulasa, catalasa, inmóvil y no esporulada que se .";
                var bad = "Bacillus cereus es una bacteria que causa envenenamiento por consumo.​";
                var cam = "Campylobacter es un género de bacterias perteneciente a la familia Campylobacteraceae. Las especies de este género son bacilos Gram negativo con forma de coma y móviles por la presencia de uno o dos flagelos polares.";
                
                if (document.getElementById('bacteria').value == 1) {
                    document.getElementById('des-bac').innerHTML=sc;
                }else if(document.getElementById('bacteria').value == 2){
                    document.getElementById('des-bac').innerHTML=sal;
                }else if(document.getElementById('bacteria').value == 3){
                    document.getElementById('des-bac').innerHTML=sta;
                }else if(document.getElementById('bacteria').value == 4){
                    document.getElementById('des-bac').innerHTML=bad;
                }else if(document.getElementById('bacteria').value == 5){
                    document.getElementById('des-bac').innerHTML=cam;
                }
                
            });
            
            $('#objetivo').change(function(e){
                var sc = "Crecimiento: Mantener el mayor tiempo posible en la etapa de crecimiento.";
                var sal = "Decaimiento: Acabar con una población en el menor tiempo posible.";
                var sta = "Estabilidad: Hacer que la bacteria esté en su punto máximo de crecimiento el mayor tiempo posible";
                if (document.getElementById('objetivo').value == 1) {
                    document.getElementById('des-obj').innerHTML=sc;
                }else if(document.getElementById('objetivo').value == 2){
                    document.getElementById('des-obj').innerHTML=sal;
                }else if(document.getElementById('objetivo').value == 3){
                    document.getElementById('des-obj').innerHTML=sta;
                }
                
            });
            
        </script>

</html>

