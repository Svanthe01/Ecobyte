<%-- 
    Document   : validaCodigo
    Created on : 25-abr-2020, 20:43:41
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
            String codigo = request.getParameter("codi");                       
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            try{
                ps = con.prepareStatement("SELECT * FROM c_codigos WHERE codigo LIKE '"+ codigo +"'");
                rs = ps.executeQuery();
                if(rs.next()){
                    int puntos = Integer.parseInt(rs.getString("puntos"));
                    ps = null;
                    rs = null;
                    //damos de baja el codigo
                    ps = con.prepareStatement("DELETE FROM c_codigos WHERE codigo LIKE '"+ codigo +"'");
                    ps.executeUpdate();                    
                    ps = null;
                    
                    //tomamos los puntos del usuario
                    ps = con.prepareStatement("SELECT * FROM sesion");
                    rs = ps.executeQuery();
                    rs.next();   
                    String usuario = rs.getString("usuario");
                    puntos += rs.getInt("puntos");
                    ps = null;
                    rs = null;
                    //actualizamos los puntos del usuario
                    ps = con.prepareStatement("UPDATE c_usuarios SET puntos = "+ puntos +" WHERE id_user LIKE '"+ usuario +"'");                                       
                    ps.executeUpdate();                    
                    ps = null;
                    
                    //actualizamos sesion
                    ps = con.prepareStatement("UPDATE sesion SET puntos = "+ puntos +" WHERE id = 3");                    
                    ps.executeUpdate();                    
                    ps = null;                    
                    %>
                    <script type="text/javascript">
                        var r = confirm("Código validado exitosamente");
                        if (r == true) {
                          window.location.assign("index.jsp");
                        } else {
                          window.location.assign("index.jsp");
                        }
                    </script>
                    <%                                                                                    
                }else{
                    %>
                    <script type="text/javascript">
                        var r = confirm("El codigo ingresado no es reconocible");
                        if (r == true) {
                          window.location.assign("index.jsp");
                        } else {
                          window.location.assign("index.jsp");
                        }
                    </script>
                    <%
                }                
                con.close();
            }catch(Exception ex){
                    %>
                    <script type="text/javascript">
                        var r = confirm("El codigo ingresado no es reconocible");
                        if (r == true) {
                          window.location.assign("index.jsp");
                        } else {
                          window.location.assign("index.jsp");
                        }
                    </script>
                    <%
            }        
        %>
    </body>
</html>
