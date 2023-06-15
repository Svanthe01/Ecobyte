<%-- 
    Document   : mostrarVideo
    Created on : 14-abr-2020, 2:13:56
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
        <link rel="stylesheet" type="text/css" href="../calculadora/utilidad/estilo.css">
        <link rel="stylesheet" href="../Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="../calculadora/utilidad/jquery.js"></script>
        <style type="text/css">
            body{
                font-family: Helvetica;
                text-align: justify;
                font-size: 18px;
                background-color: whitesmoke;
            }            
            #main-footer{
                display: inline-block; 
                width: 100%; 
                margin-top: 20px;
            }
            #titulo{
                background-color: gray;
                font-family: Agency FB;
                font-size: 20px;
                text-align: center; 
            }
            #divo{
                width: 800px; 
                margin: auto;
                padding-top: 10px;
                padding-left: 30px;
                padding-right: 30px;
                padding-bottom: 30px;
                height: auto;
                background-color: white;
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
                    ps = null;
                    rs = null;
                }catch(Exception ex){
                   %>
                   <script type="text/javascript">
                       alert("Algo ha pasao X_X");
                   </script>
                    <%
                }
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
                
            <div>                
                <br>
                <div id="divo">
                    <%
                        String id = request.getParameter("id");                                    
                        
                        ps = con.prepareStatement("SELECT * FROM c_manualidades WHERE id_manualidad="+ id);
                        try{
                            rs = ps.executeQuery();
                            rs.next();
                            String materiales[] = rs.getString("materiales").split(",");
                            String medidas[] = rs.getString("medidas").split(",");
                            %>
                            <h1><%=rs.getString("titulo")%></h1>
                            <br>
                    <div id="titulo"><h2>Materiales</h2></div>
                    <table>
                            <%
                        for (int i = 0; i < materiales.length; i++) {
                            %>
                                <tr>
                                    <td><%=materiales[i]%>&nbsp&nbsp&nbsp&nbsp</td>
                                    <td><%=medidas[i]%></td>
                                </tr>
                            <%
                            }
                        %>                        
                    </table>
                    <br>
                    <div id="titulo"><h2>Video</h2></div>                    
                            <%
                            PreparedStatement ps2 = con.prepareStatement("SELECT * FROM c_videos WHERE fk_manualidad = "+ id);
                            ResultSet rs2 = ps2.executeQuery();
                            rs2.next();
                            %>
                            <video src="../multimedia/<%=rs2.getString("ruta")%>" width="750" height="580" controls></video>
                            <br>
                            <p>Creado por: <b><%=rs.getString("autor")%></b></p>
                            <%
                                ps = null;
                                rs = null;
                                ps2 = null;
                                rs2 = null;
                                con.close();
                        }catch(Exception ex){
                            out.print("<h1>Ha ocurrido un error al cargar los datos X_X</h1>");
                        }
                    %>                    
                    
                </div>
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

        });
    </script>
    </body>
</html>

