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
        <title>eliminar</title>
        
    </head>
    <body>
    <%
        //CONECTANDO A LA BASE DE DATOS
            //out.println(request.getParameter("id_suc"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
            request.setCharacterEncoding("UTF-8");
            String qProd= "DELETE FROM tb_prod_suc WHERE id_tbprod=(SELECT id_prod FROM tb_prod WHERE prod_codi=?) AND id_tbsuc=?";
            PreparedStatement eliminaProd=null;
            
            
        //....
            
            eliminaProd = con.prepareStatement(qProd);
            eliminaProd.setString(1,request.getParameter("idprod"));
            eliminaProd.setString(2,request.getParameter("idsuc"));
            eliminaProd.execute();
            
            out.print("PRODUCTO ELIMINADO");

            
            
            //PreparedStatement ps;       
            //String id=request.getParameter("id");
            //ps=con.prepareStatement("delete from tb_prod_suc where id_tbprod="+id);
            //ps.executeUpdate();
            //response.sendRedirect("Principal.jsp");
            %>
    </body>
</html>
