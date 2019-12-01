<%-- 
    Document   : NuevaPoblacion
    Created on : 27-abr-2019, 8:49:23
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Agregar poblacion</title>

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
                        <a class="navbar-brand" href="#">Agregar poblacion</a>
                    </div>
                    <div class="collapse navbar-collapse">
    
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="">
                                   <p>Agregar poblacion</p>
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
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Agregar poblacion</h4>
                            </div>
                            <div class="content">
                                <form method="Post" action="AgregarPoblacion">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label title="(Unidades Formadoras de Colonias) Es una unidad de medida que se emplea para la cuantificación de microorganismos, va de 0 a 7 UFC.">Numero de UFC inicial</label>
                                                <input type="number" class="form-control" name="UFC" min="0" max="7" title="(Unidades Formadoras de Colonias) Es una unidad de medida que se emplea para la cuantificación de microorganismos, va de 0 a 7 UFC.">
                                               <input type="text" style="display: none;" name="id_pry" value="<%out.print(request.getParameter("id"));%>" title="(Unidades Formadoras de Colonias) Es una unidad de medida que se emplea para la cuantificación de microorganismos, va de 0 a 7 UFC.">
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label title="Magnitud física que refleja la cantidad de calor, ya sea de un cuerpo, de un objeto o del ambiente, va de 10°C a 40°C.">Temperatura</label>
                                                <input type="number" class="form-control" max="40" min="10" name="tem" step="any" title="Magnitud física que refleja la cantidad de calor, ya sea de un cuerpo, de un objeto o del ambiente, va de 10°C a 40°C.">
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label title="Coeficiente que indica el grado de acidez o basicidad de una solución acuosa abarca desde el 1(PH muy ácido) al 14(PH muy básico), nosotros lo usamos del 4 al 10.">Ph</label>
                                                <input type="number" max="12" min="4" class="form-control" name="Ph" step="any" title="Coeficiente que indica el grado de acidez o basicidad de una solución acuosa abarca desde el 1(PH muy ácido) al 14(PH muy básico), nosotros lo usamos del 4 al 10.">
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label  title=" Los microorganismos necesitan la presencia de agua, en una forma disponible, para crecer y llevar a cabo sus funciones metabólicas. La mejor forma de medir la disponibilidad de agua es mediante la actividad de agua (aw). La aw de un alimento o solución se define como la relación entre la presión de vapor del agua del alimento (p) y la del agua pura (po) a la misma temperatura. aw = p/po, Va de 0.96 a 1.">Actividad acuatica</label>
                                                <input type="number" max="1" min="0.96" class="form-control" name="aw" step="any" title=" Los microorganismos necesitan la presencia de agua, en una forma disponible, para crecer y llevar a cabo sus funciones metabólicas. La mejor forma de medir la disponibilidad de agua es mediante la actividad de agua (aw). La aw de un alimento o solución se define como la relación entre la presión de vapor del agua del alimento (p) y la del agua pura (po) a la misma temperatura. aw = p/po, Va de 0.96 a 1.">
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-fill pull-right"> Agregar poblacion</button>
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

