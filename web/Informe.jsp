<%-- 
    Document   : Informe
    Created on : 08-may-2019, 1:43:49
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Entidades.Proyectos.Poblacion"%>
<%@page import="Backend.Conexion"%>
<%@page import="Backend.ServletControl.ProyectosControl"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <%try{
        HttpSession sesionOk = request.getSession();
        String tit = "Titulo de la entrada";
        String cuer="Cuerpo de la entrada";
        String tarjet = "AgregarInforme";
        String tarjet1 = "Agregar Entrada";
       
        int idi = 0;
        Poblacion p=Conexion.getPoblacionById(Integer.parseInt(request.getParameter("l")));
        try{
            if (request.getParameter("titulo")!=null) {
                    tit = request.getParameter("titulo");
                    cuer = request.getParameter("c");
                    tarjet = "EditarInforme";
                    tarjet1 = "Editar Entrada";
                }
            
        }catch(NullPointerException npe){
            
        }
 %>       
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title><%out.print(tarjet);%></title>

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
                        <a class="navbar-brand" href="#">Entrada</a>
                    </div>
                    <div class="collapse navbar-collapse">
    
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="">
                                   <p>Entrada</p>
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
                <div class="row">
                     <form method="Post" action="<%out.print(tarjet);%>">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"><%out.print(tarjet1);%></h4>
                            </div>
                            <div class="content">
                               
                                 
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Titulo de la entrada</label>
                                                <input type="text" class="form-control" name="Titulo" maxlength="50" placeholder="Escribe el titulo de tu informe" value="<%out.print(tit);%>" required >
                                                <input type="text" class="form-control" name="id" style="display: none" value="<%out.print(request.getParameter("l"));%>" >
                                                
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Cuerpo de la entrada</label>
                                                <textarea name="textarea" class="form-control" rows="25"><%out.print(cuer);%></textarea>
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-fill pull-right"><%out.print(tarjet1);%></button>
                                    <div class="clearfix"></div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Datos actuales</h4>
                            </div>
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Variables actuales</label><br>
                                            <label>Temperatura C°</label>
                                            <input type="text" name="tm" class="form-control"  value="<%out.print(p.getTemperatura());%>" readonly >
                                            <input type="text" class="form-control" name="id" style="display: none" value="<%out.print(request.getParameter("l"));%>" >

                                            <hr>
                                        </div>
                                        <div class="form-group">
                                           <label>PH</label>
                                           <input type="text" name="ph" class="form-control"  value="<%out.print(p.getPh());%>" readonly >
                                            <input type="text" class="form-control" name="id" style="display: none" value="<%out.print(request.getParameter("l"));%>" >

                                            <hr>
                                        </div>
                                        <div class="form-group">
                                            <label>Actividad de agua</label>
                                            <input type="text" name="aw" class="form-control"  value="<%out.print(p.getOxigeno());%>" readonly >
                                            <input type="text" class="form-control" name="id" style="display: none" value="<%out.print(request.getParameter("l"));%>" >

                                            <hr>
                                        </div>
                                        <div class="form-group">
                                            <label>Poblacion Estimada Actual UFC</label>
                                            <input type="text" name="pob" class="form-control" id="PEA"  value="" readonly >
                                            <input type="text" class="form-control" name="id" style="display: none" value="<%out.print(request.getParameter("l"));%>" >

                                            <hr>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                            </form>
                </div>
            </div>
        </div>
                                            <script src="http://<%=new direccion().dir%>:8005/data/<%out.print(request.getParameter("l"));%>/<%out.print(ProyectosControl.RestarFechasE(p.getFi()));%>" type="text/javascript"></script>
<%}catch(NullPointerException cu){
        response.sendRedirect("Login.jsp?error=1&text=Tu sesion ha caducado");
    }%>

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

   

</html>

