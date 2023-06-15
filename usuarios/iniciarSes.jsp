<%-- 
    Document   : inicarSes
    Created on : 07-nov-2019, 22:15:17
    Author     : dante
--%>
<!DOCTYPE html>
<%@page import = "java.sql.*, java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%
        String nombre = request.getParameter("user2");
        String contra = request.getParameter("contra2");
        
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
        
        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("SELECT * FROM c_usuarios WHERE id_user='"+nombre+"'");
        try{
            rs.next();
            if(rs.getString("clave").length() != 0 && contra.equals(rs.getString("clave"))){
                PreparedStatement ps = null;
                ps = con.prepareStatement("UPDATE sesion SET valor = 1, usuario = ?, puntos = ? WHERE id=3");
                ps.setString(1,nombre);
                ps.setInt(2,rs.getInt("puntos"));
                ps.executeUpdate();
                ps.close();
                
                response.sendRedirect("../index2.jsp");
                
            }else{
                %>
                <script type="text/javascript">
                    var r = confirm("Contraseña y/o nombre de usuario incorrectos");
                    if (r == true) {
                      window.location.assign("registro.jsp");
                    } else {
                      window.location.assign("registro.jsp");
                    }
                </script>
                <%
                
            }
        }catch(Exception ex){
            %>
                <script type="text/javascript">
                    var r = confirm("Contraseña y/o nombre de usuario incorrectos");
                    if (r == true) {
                      window.location.assign("registro.jsp");
                    } else {
                      window.location.assign("registro.jsp");
                    }
                </script>
                <%
        }
        rs = null;
        con.close();
        
        %>
    </body>
</html>
