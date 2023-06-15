<%-- 
    Document   : validarSesion
    Created on : 30-abr-2020, 0:45:53
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
            String contra = request.getParameter("contra");
            
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM c_empresas WHERE nombre LIKE '"+nombre+"'");
            try{
                rs.next();
                if(rs.getString("contraseña").length() != 0 && contra.equals(rs.getString("contraseña"))){                   
                    PreparedStatement ps = null;
                    ps = con.prepareStatement("UPDATE sesionempresa SET valor = 1, nombre = ? WHERE id=3");
                    ps.setString(1,nombre);                    
                    ps.executeUpdate();
                    ps.close();    
                    rs = null;                    
                    con.close();
                    
                    response.sendRedirect("index.jsp");
                }else{
                    %>
                    <script type="text/javascript">
                        var r = confirm("Contraseña y/o nombre de usuario incorrectos");
                        if (r == true) {
                          window.location.assign("iniciarSesion.html");
                        } else {
                          window.location.assign("iniciarSesion.html");
                        }
                    </script>
                    <%

                }
            }catch(Exception ex){
                %>
                    <script type="text/javascript">
                        var r = confirm("Contraseña y/o nombre de usuario incorrectos");
                        if (r == true) {
                          window.location.assign("iniciarSesion.html");
                        } else {
                          window.location.assign("iniciarSesion.html");
                        }
                    </script>
                    <%
            }
            rs = null;
            con.close();
        %>
    </body>
</html>
