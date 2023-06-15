<%-- 
    Document   : tablaManualidades
    Created on : 07-abr-2020, 1:16:09
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
        <style type="text/css">            
            td{
              
              text-align: left;
              padding: 8px;
              margin-left: 8px;
              
            }
            table{            	
                width: 820px;                
            }
            #ima{
            	width: 220px;
            	height: 200px;
            }
            #titulo{
            	height: 20px;
            }
        </style>
    </head>
    <body>
        <table>
        <%
            String id = request.getParameter("id");
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");

            try{
                ps = con.prepareStatement("SELECT * FROM c_manualidades WHERE categoria LIKE '"+ id +"'");
                rs = ps.executeQuery();
                while(rs.next()){
                    if(rs.getString("tipo").equals("i")){
                        PreparedStatement ps2 = con.prepareStatement("SELECT * FROM c_imagenes WHERE fk_manualidad = "+ rs.getInt("id_manualidad") +" AND numImagen = 1");
                        ResultSet rs2 = ps2.executeQuery();
                        rs2.next();                        
                        %>                
                        <tr>        	            
                            <td rowspan="3" id="ima"><img src="../multimedia/<%=rs2.getString("ruta")%>" height="200" width="220"></td>
                            <td id="titulo"><h5><a href="mostrarMan.jsp?id=<%=rs.getInt("id_manualidad")%>"><%=rs.getString("titulo")%></a></h5></td>
                        </tr>
                        <tr>
                            <td id="titulo">Subido por: <%=rs.getString("autor")%></td>
                        </tr>
                        <tr>    
                            <td valign="top">Categoría: imagenes</td>
                        </tr>                            
                        <%
                        ps2 = null;
                        rs2 = null;
                    }else{                                                 
                        %>                
                        <tr>        	            
                            <td rowspan="3" id="ima"><img src="utilidades/video.png" height="200" width="220"></td>
                            <td id="titulo"><h5><a href="mostrarVideo.jsp?id=<%=rs.getInt("id_manualidad")%>"><%=rs.getString("titulo")%></a></h5></td>
                        </tr>
                        <tr>
                            <td id="titulo">Subido por: <%=rs.getString("autor")%></td>
                        </tr>
                        <tr>    
                            <td valign="top">Categoría: video</td>
                        </tr>                 
                        <%                      
                    }                
                }
            }catch(Exception ex){
                %>
                <tr><td><h1>Lo sentimos, ha ocurrido un error con la consulta X_X</h1></td></tr>
                <%
            }

            rs.close();
            ps.close();
            con.close();
        %>
            
        </table>
    </body>
</html>
