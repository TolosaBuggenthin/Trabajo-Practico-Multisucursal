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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANDO A LA BASE DE DATOS
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
            
            //LISTAMOS LOS PRODUCTOS QUE HAY EN STOCK
            PreparedStatement ps = null;
            ResultSet rs = null;
            String id= request.getParameter("id");
            ps=con.prepareStatement("SELECT * from tb_prod WHERE id_prod="+id);
            rs=ps.executeQuery();
            rs.next();              
         %>
        <div class="container">
            <h1>Modificar Producto</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 500px">
                ID: <input type="text" readonly="" class="form-control" value="<%= rs.getString("id_prod") %>" /> </br>
                Nombre del Producto: <input type="text" name="prod_nombre" class="form-control" value="<%= rs.getString("prod_nombre") %>" /> </br>
                Descripcion: <input type="text" name="prod_descripcion" class="form-control" value="<%= rs.getString("prod_descripcion") %>" /> </br>
                Costo: <input type="text" name="prod_costo" class="form-control" value="<%= rs.getString("prod_costo") %>" /> </br> 
                <!-- -- Stock: <input type="text" name="stock" class="form-control" value="<//%= rs.getString("stock") %>" /> </br> -->
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="Principal.jsp">Regresar</a>
                
            </form>
        </div>
         
    </body>
</html>
<%

    String nom, descr, cost, stock;
            nom=request.getParameter("prod_nombre");
            descr=request.getParameter("prod_descripcion");
            cost=request.getParameter("prod_costo");
            stock=request.getParameter("stock");
            if(nom!=null && descr!=null && cost!=null && stock!=null){
            
            ps=con.prepareStatement("UPDATE tb_prod set prod_nombre='"+nom+ "',prod_descripcion='" +descr+ "',prod_costo='" +cost+"')WHERE id_prod="+id);
            //ps=con.prepareStatement("INSERT INTO tb_prod_suc (stock) VALUES ('"+stock+"')") ;
            ps.executeUpdate();
            response.sendRedirect("Principal.jsp");
            
            
    
    }

            
%>
