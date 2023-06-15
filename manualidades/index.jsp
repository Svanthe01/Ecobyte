<%-- 
    Document   : index
    Created on : 06-abr-2020, 20:39:58
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="../calculadora/utilidad/estilo.css">
        <link rel="stylesheet" href="../Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="../calculadora/utilidad/jquery.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            body{
                font-family: Helvetica;                
                font-size: 18px;
                background-color: #f3f3f3;
            }
            #izq{
                float: left; 
                background-color: #E2E2E2; 
                display: inline-block;
                width: 890px; 
                height: 600px; 
                margin-left: 50px; 
                padding-left: 30px;
                padding-right: 30px;
                padding-bottom: 30px;
                padding-top: 20px;
                border-radius: 6px;
            }
            #der{
                float: right; 
                background-color: white; 
                display: inline-block;
                width: 340px; 
                height: 250px; 
                margin-right: 40px; 
                padding: 20px;
                border-radius: 6px;
            }
            #main-footer{
                display: inline-block; 
                width: 100%; 
                margin-top: 20px;
            }
            button{
                width: 160px;
                height: auto;
                padding-bottom: 3px;
                background-color: #E2E2E2; 
                cursor: pointer;
                border: 0;                
            }      
            button:hover {
                background: gray;  
                border-radius: 5px;
                color:whitesmoke;
            }
            #objetivo{
                height: 500px;
                width: 840px;
                overflow-y:scroll;                
            }
        </style>
    </head>
    <body>
        <%
            Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
                String nombre = "";
                int puntos = 0;
                String clase = "";
                
                try{
                    ps = con.prepareStatement("SELECT * FROM sesion");
                    rs = ps.executeQuery();
                    while(rs.next()){
                        if(rs.getInt("valor") == 1){
                            nombre = rs.getString("usuario");
                            puntos = rs.getInt("puntos");
                            
                            if(puntos < 75)
                                clase = "Principiante";
                            else if(puntos < 150 && puntos > 75)
                                clase = "Experimentado";
                            else if( puntos < 300 && puntos > 150)
                                clase = "Reciclador";
                            else if(puntos < 450 && puntos > 300)
                                clase = "Maestro del reciclaje";
                            else
                                clase = "Dios del reiclaje";
                        }                    
                    }
            
                }catch(Exception ex){
                   %>
                   <script type="text/javascript">
                       alert("Algo ha pasao X_X");
                   </script>
                    <%
                }
                rs.close();
                ps.close();
                con.close();
        %>
        <div id="vacio" style="position: relative;">
            <div id="nav">
                <header id="main-header">
                    
                    <div id="iden">
                        <a id="logo-header" href="#">
                            <span class="site-name">ECOBYTE</span>
                            <span class="site-desc"><u>by Lifebyte</u></span>
                        </a>
                    </div>
                    <nav id="menu_nav">
                        <ul>
                            <li><a href="../pagina/index.html">Sobre nosotros</a></li>
                            <li><a href="#">Manualidades</a></li>
                            <li><a href="../recompensas/index.jsp">Recompensas</a></li>
                            <li><a href="../mapa/MapaInicio.jsp">Mapa</a></li>
                            <li><a href="../calculadora/index.jsp">Calculadora</a></li>
                            <li><a id="butt" style="cursor:pointer;">Sesion</a></li>
                            <li><a href="../index2.jsp">Inicio</a></li>
                        </ul>
                    </nav>                    
                </header>
            </div>
            
            <!--Aquí va el recuadro de sesion que se oculta y despliega-->
            <div id="target">
                <h3><%=nombre%></h3>
                <center><img src="../elementos/perfil.jpg" height="200px" width="200px" id="perfil"></center>
                
                <hr id="barra">
                <h5>Clase: <%=clase%></h5>
                <h5>Pts. acumulados: <%=puntos%></h5>
                                              
                <button id="ses"><h5>Cerrar sesión</h5></button>
            </div>            
        </div>
        <div id="nuevoConten">
            <br>
            <div id="izq">
                <div>
                    <button id="pla">Plástico</button>
                    <button id="pap">Papel</button>
                    <button id="vid">Vidrio</button>
                    <button id="car">Cartón</button>
                    <button id="otr">Otros</button>
                    <hr style="background-color: black;">
                </div>
                <div id="objetivo">
                    
                </div>
            </div>
            
            <div id="der">
                <center>¿Nuevas ideas para una manualidad? ¡Crea aquí la tuya de forma fácil!</center>
                <br>
                <center>Escoge la categoría que desees:</center>
                <br>
                <center><h5><a href="formImagen.html">Imágenes</a>&nbsp&nbsp&nbsp&nbsp<a href="formVideo.html">Video</a></h5></center>
                <br>                
            </div>                         
        </div>  
                
        
        <footer id="main-footer">
            <p>&copy; 2019 LifeByte S.A. de C.V.</p>
            <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
            <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>
            <br><br>
        </footer>    
        <script type="text/javascript">
            $(document).ready(function(){
                $('#target').toggle();
                $("#objetivo").load('tablaManualidades.jsp?id=Plastico');
                $("#butt").click(function () {	 
                    $('#target').toggle("slow");
                });
                $("#ses").click(function (){
                    var r = confirm("¿Desea cerrar sesión?");
                    
                    if (r == true) {
                        window.location.assign("../usuarios/cerrarSes.jsp");
                    }else {
                        
                    }
                });
                
                
                $("#pla").click(function(event) {
                    $("#objetivo").load('tablaManualidades.jsp?id=Plastico');                   
                });
                $("#pap").click(function(event) {
                    $("#objetivo").load('tablaManualidades.jsp?id=Papel');                   
                });
                $("#vid").click(function(event) {
                    $("#objetivo").load('tablaManualidades.jsp?id=Vidrio');                                        
                });
                $("#car").click(function(event) {
                    $("#objetivo").load('tablaManualidades.jsp?id=Carton');                    
                });
                $("#otr").click(function(event) {
                    $("#objetivo").load('tablaManualidades.jsp?id=Otro');                    
                });                
                
            });
        </script>
    </body>
</html>
