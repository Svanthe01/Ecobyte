<%-- 
    Document   : altaRecompensa
    Created on : 26-abr-2020, 20:37:55
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
            String nombre = request.getParameter("nombre");
            String cost = request.getParameter("costo");
            int costo = Integer.parseInt(cost);
            String empresa = "";
            String descripcion = request.getParameter("desc");
            String stk = request.getParameter("stock");
            int stock = Integer.parseInt(stk);
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            try{
                ps = con.prepareStatement("SELECT * FROM sesionempresa WHERE id = 3");
                rs = ps.executeQuery();
                rs.next();
                empresa = rs.getString("nombre");
                ps = null;
                rs = null;
                
                ps = con.prepareStatement("INSERT INTO c_recompensas (nombre, costo, empresa, descripcion, stock) VALUES(?,?,?,?,?)");
                ps.setString(1,nombre);
                ps.setInt(2,costo);
                ps.setString(3,empresa);
                ps.setString(4,descripcion);
                ps.setInt(5,stock);
                ps.executeUpdate();
                
                response.sendRedirect("formRecompensa2.html");
            }catch(Exception ex){
                %>
                <script type="text/javascript">
                    var r = confirm("Ha ocurrido un error al procesar los datos");
                    if (r == true) {
                      window.location.assign("formRecompensa.html");
                    } else {
                      window.location.assign("formRecompensa.html");
                    }
                </script>
                <%
            }
        %>
    </body>
</html>
