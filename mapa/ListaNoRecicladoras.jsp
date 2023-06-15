<%-- 
    Document   : ListaNoRecicladoras
    Created on : 02-ene-2020, 23:08:06
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type='text/javascript' src="../calculadora/utilidad/jquery.js"></script>
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <style type="text/css">
            
            body{
                
                font-family: Verdana;
                font-size: 16px;
            }
            tr:nth-child(even) {
                background-color: white;
            }
            td{
              
              text-align: left;
              padding: 8px;
              margin-left: 8px;
            }
            table{
                width: 330px;
            }
            
            
        </style>
    </head>
    <body>
        <table id="Tablita">
            <th style="float:left; padding: 8px;">Reciclaje de residuos</th>
            
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
                
                try{
                    ps = con.prepareStatement("SELECT * FROM c_empresas WHERE tipo LIKE 'r'");
                    rs = ps.executeQuery();
                    while(rs.next()){
                    %>
                    <tr>
                        <td><a title="Haga click para ver en mapa" onclick="funcion(this)" data-value="<%=rs.getInt("id_empresa")%>"><%=rs.getString("nombre")%></a>
                            <br>
                            <small><%=rs.getString("descripcion")%></small>
                        </td>
                    </tr>
                    <%
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
        <script type="text/javascript">
            function funcion(elemento) {
                //esto no va a funcionar a menos de que se abra desde el archivo mapaInicio.jsp
                
                //el div con id=mapa no está en esta página, sino en otra donde es invocada esta página y aún así funciona, increible ¿no?
                //esto mismo puede servir para cargar la info completa de cada empresa dentro de un modal box
                $("#mapa").load("UbicacionEmpresa.jsp",{id: $(elemento).data('value')}, function(response, status, xhr) {
                    if (status == "error") {
                      var msg = "Error!, algo ha sucedido X_X: ";
                      $("#mapa").html(msg + xhr.status + " " + xhr.statusText);
                    }
                });
                
              }
        </script>
    </body>
</html>
