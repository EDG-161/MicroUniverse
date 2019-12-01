<%-- 
    Document   : Proyecto
    Created on : 26-abr-2019, 13:51:38
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page import="Backend.ServletControl.ProyectosControl"%>
<%@page import="Entidades.Proyectos.Poblacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        Proyecto p =null;
        ArrayList<Poblacion> pob = null;
    try{
        HttpSession sesionOk = request.getSession();
        p = Conexion.getProyectoById(Integer.parseInt(request.getParameter("id"))-300);
        if (p==null) {
            response.sendRedirect("Proyectos.jsp");
        }else if (p.getId_usr()!= ((Usuario)sesionOk.getAttribute("user")).getId() && Conexion.comprobarColaborador(((Usuario)sesionOk.getAttribute("user")).getId(), p.getId())==0) {
            response.sendRedirect("Proyectos.jsp");
        }
        int tpc = Conexion.comprobarColaborador(((Usuario)sesionOk.getAttribute("user")).getId(), p.getId());
        pob = Conexion.getPoblacion(p.getId());
    
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
                    <a class="navbar-brand" href="#"><%out.print(p.getNombre());%></a>
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
                        <h5>Fecha de inicio:</h5>
                        <input type="text" readonly class="form-control" value="<%out.print(p.getFechaDeInicio());%>">
                    </div>
                    <div class="col-md-3">
                        <h5>Dias de investigacion:</h5>
                        <input type="text" readonly class="form-control" value="<%out.print(ProyectosControl.RestarFechas(p.getFechaDeInicio()));%>">

                    </div>
                    <div class="col-md-3">
                        <h5>Bacteria:</h5>
                        <input type="text" readonly class="form-control" value="<%
                               Connection c = Conexion.getConecction();
                               String q = "Select * from cbacteria where id_bac="+p.getBacteria()+";";
                        PreparedStatement set = c.prepareStatement(q);
                        ResultSet rs = set.executeQuery();

                        if(rs.next()){
                        out.print(rs.getString(2));
                        }
                        c.close();
                               
                               %>">

                    </div>
                    <div class="col-md-3">
                        <h5>No de poblaciones:</h5>
                        <input type="text" readonly class="form-control" value="<%out.print(pob.size());%>">

                    </div>
                    
                </div>
                        <div class="row" style="margin-bottom:20px;">
                            <%
                            if (tpc==0 || tpc == 2) {
                            %>
                            <div class="col-md-3">
                                <a href="NuevaPoblacion.jsp?id=<%int id = p.getId()+123;out.print(id);%>"><h5>Agregar Poblacion</h5></a>
                            </div>
                            <div class="col-md-3">
                                <input class="btn btn-danger" value="Finalizar proyecto" type ="button" name="finalizar" onclick="location.href='Finalizar?tipo=1&id=<%out.print(p.getId());%>'">
                            </div>
                            <div class="col-md-3">
                                <input class="btn btn-primary" value="Compartir proyecto" type ="button" name="compartit" onclick="location.href='CompartirProyecto.jsp?id=<%out.print(p.getId());%>'">
                            </div>
                            <%
                            }
                            %>
                        </div>
            <div class="row">
                <div class="col-md-6">
                   
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Poblaciones
                                    </h4>
                                    <p class="category"></p></p>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>Id Poblacion</th>
                                            <th>Ver poblacion</th>
                                            <th>Herramientas</th>
                                        </thead>
                                        <tbody>
                                            <%
                                            int con= 1;

                                        if (pob.size()>0) {
                                                for (Poblacion pT : pob) {
                                                    if (pT.getId_pry()==p.getId() && pT.getTipo()==1) {
                                                    %>
                                            <tr>
                                                <td>
                                                    <div class="content">
                                                        <div class="container-fluid">
                                                            <div class="row" style="margin-bottom:20px;">
                                                                <div class="col-md-1">    
                                                                    <input class="form-check-input" type="checkbox" id="che<%out.print(pT.getId_pob());%>" value="<%out.print(pT.getId_pob());%>">
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <%out.print((pT.getId_pob()+(p.getId_usr()*p.getId()+pT.getPob_in())));%>
                                                                </div>
                                                </td>
                                                    <td><a href="Poblacion.jsp?id=<%out.print(pT.getId_pob());%>&con=<%out.print(con);%>"><%out.print(""+p.getNombre()+"  T:"+pT.getTemperatura()+" P:"+pT.getPh());%></a></td>
                                                    <td>
                                                        <form method="POST" action="Eliminar">
                                                            <input type="hidden" name="ide" value="<%int suma =pT.getId_pob()+123; out.print(suma);%>">
                                                            <input type="hidden" name="tipo" value="Poblacion">
                                                            <input type="submit" value="Eliminar" class="btn">
                                                        </form>
                                                    </td>
                                            </tr>        
                                        <%  con++;}
                                                    }
                                            }else{
                                            %>
                                            <tr>
                                                <td colspan="4"><h6>Aun no has creado ninguna poblacion</h6></td>
                                            </tr>   
                                            <%

    }
                                        %>                       
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Poblaciones
                                    </h4>
                                    <p class="category"></p></p>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>Id Poblacion</th>
                                            <th>Ver poblacion</th>
                                            <th>Herramientas</th>
                                        </thead>
                                        <tbody>
                                            <%
                                            con= 1;

                                        if (pob.size()>0) {
                                                for (Poblacion pT : pob) {
                                                    if (pT.getId_pry()==p.getId() && pT.getTipo()==2) {
                                                    %>
                                            <tr>
                                                <td>
                                                    <div class="content">
                                                        <div class="container-fluid">
                                                            <div class="row" style="margin-bottom:20px;">
                                                                <div class="col-md-1">    
                                                                    <input class="form-check-input" type="checkbox" name="enviado" value="<%out.print(pT.getId_pob());%>">
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <%out.print((pT.getId_pob()+(p.getId_usr()*p.getId()+pT.getPob_in())));%>
                                                                </div>
                                                </td>
                                                    <td><a href="PoblacionFinal.jsp?id=<%out.print(pT.getId_pob());%>&con=<%out.print(con);%>"><%out.print(""+p.getNombre()+"  T:"+pT.getTemperatura()+" P:"+pT.getPh());%></a></td>

                                            </tr>        
                                        <%  con++;}
                                                    }
                                            }else{
                                            %>
                                            <tr>
                                                <td colspan="4"><h6>Aun no has finalizado ninguna poblacion</h6></td>
                                            </tr>   
                                            <%

    }

    }catch(NullPointerException cu){
            response.sendRedirect("Login.jsp?error=1&text=Tu sesion ha caducado");
            System.out.println(cu.getMessage());
            System.out.println(cu.getStackTrace());
        }catch(NumberFormatException ne){
            response.sendRedirect("Proyectos.jsp?error=1&text=Error: proyecto no encontrado");
        }
                                        %>                       
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <div class="header">
                            <h4 class="title">Compartido con ..
                            </h4>
                            <p class="category"></p></p>
                        </div>
                        <div class="content table-responsive table-full-width">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Email</th>
                                        <th>Tipo</th>
                                        <th>Herramientas</th>
                                    </tr>
                                    <tr>
                                        <th><%out.println(Conexion.getUsuarioById(p.getId_usr()).getNombre());%></th>
                                        <th><%out.println(Conexion.getUsuarioById(p.getId_usr()).getEmail());%></th>
                                        <th colspan="2"><b>Jefe de Proyecto</b></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                if (Conexion.getColaboradores(p.getId()).size()>0) {
                                        for (int[] pT : Conexion.getColaboradores(p.getId())) {
                                            
                                            %>
                                    <tr>
                                        <td>
                                            <%out.print(Conexion.getUsuarioById(pT[0]).getNombre());%>       
                                        </td>
                                        <td><%out.print(Conexion.getUsuarioById(pT[0]).getEmail());%></td>
                                        <td><%
                                            if (pT[1]==1) {
                                                out.println("Asistente");
                                            }else{
                                                out.println("Colaborador");
                                            }
                                            %>
                                        </td>
                                        <td>
                                            
                                        </td>
                                    </tr>        
                                <% 
                                            }
                                    }else{
                                    %>
                                    <tr>
                                        <td colspan="4"><h6>El proyecto no se ha compartido</h6></td>
                                    </tr>   
                                <%
                                    }
                                %>                       
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
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
        <%try{
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

