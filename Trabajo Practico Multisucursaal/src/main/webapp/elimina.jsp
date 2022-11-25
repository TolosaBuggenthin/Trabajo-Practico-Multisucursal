<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
        <div class="container">
            <h1>Elimina Producto</h1>
            <hr>
            <form action="elimina-opera.jsp" method="post" class="form-control" style="width: 500px; height: 500px">
                Codigo del Producto: <input type="text" value="<%out.print(request.getParameter("idprod"));%>" name="prod_codi" class="form-control"/> </br>
                <input type="hidden" value="<%out.print(request.getParameter("idsuc"));%>" name="id_suc">
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="Principal.jsp">Regresar</a>

                
            </form>

        </div>
        
    </body>
</html>
