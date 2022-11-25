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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Carga</title>
    </head>
    <body>
        
        <div class="container">
            <h1>Agregar Producto</h1>
            <hr>
            <form action="carga-recibe.jsp" method="post" class="form-control" style="width: 500px; height: 500px">
                Codigo del Producto: <input type="text" name="prod_codi" class="form-control"/> </br>
                Nombre del Producto: <input type="text" name="prod_nombre" class="form-control"/> </br>
                Descripcion: <input type="text" name="prod_descripcion" class="form-control"/> </br>
                Costo: <input type="text" name="prod_costo" class="form-control"/> </br>
                Stock: <input type="text" name="stock" class="form-control"/> </br>
                <input type="hidden" value="<%out.print(request.getParameter("id"));%>" name="id_suc">
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="Principal.jsp">Regresar</a>

                
            </form>

        </div>
     
    </body>
</html>