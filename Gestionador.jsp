<%-- 
    Document   : Gestionador
    Created on : 16-ene-2020, 23:55:41
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");

            Statement statement = con.createStatement();
			//se comprueba que el usuario esté o no registrado
            ResultSet rs = statement.executeQuery("SELECT * FROM sesion WHERE id=3");
            rs.next();
            int aux = rs.getInt("valor");
            String user = rs.getString("usuario");
            if(aux == 0){
                statement.close();
                con.close();
                //esta línea es importante, redirecciona hacia otra página html o jsp
                response.sendRedirect("index.jsp");
            }else{
                statement.close();
                con.close();
                response.sendRedirect("index2.jsp");
            }
        %>
    </body>
</html>
