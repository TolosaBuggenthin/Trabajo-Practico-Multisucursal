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
        <title>Carga Recibe</title>
    </head>
    <body>
<%
            //CONECTANDO A LA BASE DE DATOS
            //out.println(request.getParameter("id_suc"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
            Statement ps = con.createStatement();
            request.setCharacterEncoding("UTF-8");

            
            
            String idsuc, codi, nom, descr, cost, stock;
            idsuc=request.getParameter("id_suc");
            codi=request.getParameter("prod_codi");
            nom=request.getParameter("prod_nombre");
            descr=request.getParameter("prod_descripcion");
            cost=request.getParameter("prod_costo");
            stock=request.getParameter("stock");
            if(codi!=null && nom!=null && descr!=null && cost!=null && stock!=null){
            
            ps.execute("INSERT INTO tb_prod(prod_codi, prod_nombre, prod_descripcion,prod_costo)VALUES('"+codi+ "','"+nom+ "','" +descr+ "','" +cost+"')");
            
            ps.execute("INSERT INTO tb_prod_suc (id_tbsuc, id_tbprod, stock) VALUES ("+idsuc+",(SELECT id_prod FROM tb_prod WHERE prod_codi= '"+codi+ "'),"+stock+")") ;
            //response.sendRedirect("Principal.jsp");
    }
 
    System.out.println("Producto insertado correctamente");
    con.close();
    ps.close();
    
    //si el producto existe no utilizar el primer execute, sino el segundo, porque o sino estaremos borrando todo el estock y no el de una susucrsal
    //es decir, hay que usar un select para ver lo de la tabla y despues un if para que no use la tabla si es que ya existe
            
%>

    Producto dado de alta


    </body>
</html>
