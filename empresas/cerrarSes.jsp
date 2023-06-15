<%-- 
    Document   : cerrarSes
    Created on : 02-jun-2020, 0:44:06
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            try{
                ps = con.prepareStatement("UPDATE sesionempresa SET valor = 0");
                ps.executeUpdate();
                
                response.sendRedirect("../index.jsp");
            }catch(Exception ex){
        %>
        <script type="text/javascript">
            var r = confirm("Ha ocurrido un error al cerrar su sesión X_X\nInténtelo más tarde");
                    
            if (r == true) {
                window.location.assign("../index.jsp");
            }else {
                window.location.assign("index.jsp");
            }
        </script>
        <%                                
            }
            ps.close();
            con.close();
        %>
    </body>
</html>
