<%-- 
    Document   : añadirArticulo
    Created on : 03-may-2020, 1:55:09
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
            String ido = request.getParameter("id");            
            String nom = request.getParameter("num");
            int num = Integer.parseInt(nom);
            Connection con = null;            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");                     
            int nuevo = num;      
            
            try{             
                Statement stm = con.createStatement();
                ResultSet res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = '"+ ido +"'");
                res.next();
                nuevo += res.getInt("stock");
                stm = null;
                res = null;

                stm = con.createStatement();
                stm.executeUpdate("UPDATE c_recompensas SET stock = "+ nuevo +" WHERE id_recompensa = "+ ido +" ");
                stm = null;
                con.close();
                
                %>
                    <script type="text/javascript">
                        var r = confirm("Stock añadido\nArtículos actuales: <%=nuevo%>");
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
                        var r = confirm("Ha ocurrido un error al añadir el artículo");
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
