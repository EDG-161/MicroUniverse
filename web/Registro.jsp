<%-- 
    Document   : Registro
    Created on : 23-abr-2019, 15:06:06
    Author     : Eduardo
--%>

<%@page import="Entidades.Users.Usuario"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.*"%>
<%@page import="Entidades.Proyectos.Pais"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Iniciar Sesion</title>
    <link rel="icon" type="image/png" href="Assets/img/favicon.ico">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body >
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
        <div id="logreg-forms">
                
            <form action="AgregarUsuario" method="POST" class="form-signin">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Registrar cuenta</h1>

                    <input type="text" name="user-name" class="form-control" placeholder="Nombre completo" required="" autofocus="">
                    <input type="email" name="user-email" class="form-control" placeholder="Correo electronico" required autofocus="">
                    <input type="password" name="user-pass" class="form-control" placeholder="Contraseña" required autofocus="">
                    <input type="password" name="user-repeatpass" class="form-control" placeholder="Repetir contraseña" required autofocus="">
                    <h3 class="h6 mb-3 font-weight-normal" style="text-align: center">Selecciona un pais</h3>
                    <select name="pais" class="form-control">
                        <%
                            ArrayList<Pais> p = Conexion.getPaises();
                        for (int i = 0; i < p.size(); i++) {
                        %>
                        <option value="<%out.print(p.get(i).getId());%>"><%out.print(p.get(i).getName());%></option>
                        <%
                            }
                        %>
                    </select>
                    <h3 class="h6 mb-3 font-weight-normal" style="text-align: center">Selecciona una actividad</h3>
                    <select name="actividad" class="form-control">
                        <%
                     try{
                       Connection c = Conexion.getConecction();
                       String q = "Select * from cactividades;";
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
                    <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Registrarme</button>
                    <a href="Login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Regresar</a>
                </form>
                <br>
                
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
