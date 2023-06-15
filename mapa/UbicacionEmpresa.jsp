<%-- 
    Document   : esta
    Created on : 06-ene-2020, 23:44:09
    Author     : dante
    esta página solo resive las coordenadas de cada empresa al dar click en 
    el nombre de alguna de las empresas que se muestran en la lista de empresas
    por sí solo no funciona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <script src="../empresas/leaflet/leaflet.js"></script>
        <link rel="stylesheet" href="../empresas/leaflet/leaflet.css"/>
        <script type='text/javascript' src="../calculadora/utilidad/jquery.js"></script>
        <style type="text/css">
            #divo{
                float:right;
                height: 500px;
                width: 750px;
                z-index: 0;
            }
            
        </style>
    </head>
    <body>
        <%
            String ico = request.getParameter("id");
            int ido = Integer.parseInt(ico);
        %>
        <div id="divo"></div>
        
        <script type="text/javascript">
        var map = L.map('divo').
        setView([ 19.421127, -99.130677],12.5);

        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
            maxZoom: 18
        }).addTo(map);
        
        L.control.scale().addTo(map);
        
        <%
            Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
                
                try{
                    ps = con.prepareStatement("SELECT * FROM c_empresas WHERE id_empresa = "+ ido +"");
                    rs = ps.executeQuery();
                    while(rs.next()){
                    %>
                        var mako = L.marker([ <%=rs.getString("coordenadas")%>], {draggable: false});
                        mako.addTo(map).bindPopup("<b><%=rs.getString("nombre")%></b><br><a onclick='func(this)' data-value='<%=rs.getInt("id_empresa")%>'>ver mas...</a>");
                    <%
                    }
                }catch(Exception ex){
                    %>
                        alert("Ha ocurrido un error al cargar los datos, lo sentimos");
                    <%
                }

                rs.close();
                ps.close();
                con.close();
        %>
            function func(elemento){
                $("#esteMero").load("VentanaModal.jsp",{id: $(elemento).data('value')}, function(response, status, xhr) {
                    if (status == "error") {
                      var msg = "Error!, algo ha sucedido X_X: ";
                      $("#esteMero").html(msg + xhr.status + " " + xhr.statusText);
                    }
                });
            }
    </script>
    </body>
</html>
