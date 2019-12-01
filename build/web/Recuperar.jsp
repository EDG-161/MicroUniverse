<%-- 
    Document   : Login
    Created on : 22-abr-2019, 15:18:17
    Author     : Eduardo
--%>

<%@page import="Entidades.Proyectos.direccion"%>
<%@page import="Entidades.Users.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Proyectos.Pais"%>
<%@page import="java.sql.Connection"%>
<%@page import="Backend.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
    try{

        HttpSession sesionOk = request.getSession();
        Usuario u = (Usuario)sesionOk.getAttribute("user");
        if(u!= null){
            response.sendRedirect("Home.jsp");
        }
    }catch(NullPointerException ne){
    
    }
    %>
    <meta charset="utf-8"/><link rel="icon" type="image/png" href="Assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Iniciar Sesion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body >
        <div id="logreg-forms">
            <form class="form-signin" action="http://<%=new direccion().dir%>:8001/MicroUniverse_Informe/bd/password_recovery.php" method="Post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Recuperar contraseña</h1>
                
                <input type="email" name="email" id="user" class="form-control" placeholder="Direccion de correo" required="" autofocus="">
                
                <hr>
                <button class="btn btn-success btn-block" type="submit" id="btn-signin"><i class="fas fa-sign-in-alt"></i>Recuperar Contraseña</button>
                <!-- <p>Don't have an account!</p>  -->
                
                </form>
    
               
                
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
        <script type="text/javascript" charset="UTF-8">
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
                <script type="text/javascript" charset="UTF-8">
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
