<%-- 
    Document   : tablaRecompensas
    Created on : 02-may-2020, 18:10:54
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <style type="text/css">
            body{
                font-size: 14px;
            }
            tr:nth-child(even) {
                background-color: #cccccc;
            }            
            table{
                width: 300px;                
            }
            td{
                padding: 5px;
            }
            #seg{
                text-align: center;
                vertical-align:middle;
            }            
        </style>
    </head>
    <body>
        <table> 
            <tr>
                <td>
                    <center><b>Nombre</b></center>
                </td>                
                <td>
                    <center><b>Código</b></center>
                </td>                
            </tr>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            String usuario = "";
            
            try{
                ps = con.prepareStatement("SELECT * FROM sesion WHERE id = 3");
                rs = ps.executeQuery();
                rs.next();
                usuario = rs.getString("usuario");
                ps = null;
                rs = null;
                
                ps = con.prepareStatement("SELECT * FROM c_reclamados WHERE usuario = '"+ usuario +"'");
                rs = ps.executeQuery();
                                
                while(rs.next()){
                %>
                <tr>
                    <td>
                        <%=rs.getString("nombre_rec")%>
                    </td>
                    <td id="seg">
                        <%=rs.getString("codigo")%>
                    </td>
                </tr>
                <%
                }
            }catch(Exception ex){
                    %>
                    <center><h6>Ha ocurrido un error al cargar los datos X_X</h6></center>
                    <%
            }        
        %>
        </table>
    </body>
</html>
