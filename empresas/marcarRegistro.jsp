<%-- 
    Document   : marcarRegistro
    Created on : 03-may-2020, 16:53:08
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%
            String cod = request.getParameter("cod");
            Connection con = null;            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            String empresa = "";
            
            try{
                Statement stm = con.createStatement();
                ResultSet res = stm.executeQuery("SELECT * FROM sesionempresa WHERE id = 3");
                res.next();
                empresa = res.getString("nombre");
                res = null;
                stm = null;

                stm = con.createStatement();
                stm.executeUpdate("DELETE FROM c_reclamados WHERE codigo = '"+ cod +"' AND empresa = '"+ empresa +"'");
                %>
                    <script type="text/javascript">
                        var r = confirm("Registro eliminado correctamente");
                        if (r == true) {
                          window.location.assign("tablaReclamos.jsp");
                        } else {
                          window.location.assign("tablaReclamos.jsp");
                        }
                    </script>
                <%
            }catch(Exception ex){
                %>
                    <script type="text/javascript">
                        var r = confirm("Ha ocurrido un error al eliminar el registro");
                        if (r == true) {
                          window.location.assign("tablaReclamos.jsp");
                        } else {
                          window.location.assign("tablaReclamos.jsp");
                        }
                    </script>
                <%
            }
        %>
    </body>
</html>
