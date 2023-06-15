<%-- 
    Document   : cerrarSes
    Created on : 09-feb-2020, 12:30:08
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            try{
                ps = con.prepareStatement("UPDATE sesion SET valor = 0");
                ps.executeUpdate();
                
                response.sendRedirect("../index.jsp");
            }catch(Exception ex){
        %>
        <script type="text/javascript">
            alert("Ha ocurrido un error al cerrar su sesión X_X \nIntentelo más tarde");
        </script>
        <%
                for (int i = 0; i < 1000000000; i++) {

                }
                response.sendRedirect("../index2.jsp");
            }
            ps.close();
            con.close();
            
        %>
    </body>
</html>
