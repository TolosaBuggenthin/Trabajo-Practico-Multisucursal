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
        
        <link rel="stylesheet" href="./style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="mi_titulo"> Videojuegos Oeste </h1>
        
        <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qSucur ="SELECT * from tb_suc ";   
                PreparedStatement consultaSucur = null;
                ResultSet listaSucur = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba01", "root", "");
                    consultaSucur = conexion.prepareStatement(qSucur);
                    listaSucur = consultaSucur.executeQuery();
                    while(listaSucur.next()){
                        %>
            <p>sucursales: <% out.print(listaSucur.getString("suc_nombre"));%></p>
            <ul>
                <li><a href="carga.jsp?id=<%out.print(listaSucur.getString("id_suc"));%>">carga</a></li>
                <li> <a href="muestra.jsp?id=<%out.print(listaSucur.getString("id_suc"));%>"> muestra </a> </li>
                <li> <a href="elimina.jsp?id=<%out.print(listaSucur.getString("id_suc"));%>"> elimina </a> </li>
                <li> <a href="editar.jsp?id=<%out.print(listaSucur.getString("id_suc"));%>"> editar </a> </li>

            </ul>
                <%
            }
        } catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                
                listaSucur.close();
                consultaSucur.close();
            }catch(Exception e){
            }
        }
    %>   
    </body>
</html>
