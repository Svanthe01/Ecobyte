<%-- 
    Document   : MapaInicio
    Created on : 02-ene-2020, 20:33:20
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <script src="../empresas/leaflet/leaflet.js"></script>
        <link rel="stylesheet" href="../empresas/leaflet/leaflet.css"/>
        <link rel="stylesheet" type="text/css" href="MapaInicio.css">
        <script type='text/javascript' src="../calculadora/utilidad/jquery.js"></script>
        <link rel="stylesheet" href="../Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="../Librerias/Bootstrap/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>

        <div id="nav">
            <header id="main-header">
                <!--logo <img src="cosas/logo.png" align="left" id="imag" width="80" height="80"/>-->
                <div id="iden">
                    <a id="logo-header" href="#">
                        <span class="site-name">ECOBYTE</span>
                        <span class="site-desc"><u>by Lifebyte</u></span>
                    </a>
                </div>
                <nav id="menu_nav">
                    <ul>
                        <%
                            Connection con = null;
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
                            String clase = "";
                            
                            Statement statement = con.createStatement();
                                        //se comprueba que el usuario esté o no registrado
                            ResultSet rs = statement.executeQuery("SELECT * FROM sesion WHERE id=3");
                            rs.next();                            
                            int aux = rs.getInt("valor");
                            int puntos = rs.getInt("puntos");
                            String nombre = rs.getString("usuario");
                            
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
                            
                            if(aux == 0){
                                %>
                        <li><a href="../pagina/index.html">Sobre nosotros</a></li>
                        <li><div class="dropdown" style="float:right;">
                                    <a class="dropbtn">¿Eres una empresa?</a>
                                    <div class="dropdown-content" style="padding: 20px;" >
                                        <p style="color: #333333; margin: 0px; line-height : 25px;">En Ecobyte te ayudamos a promover tu empresa, registrate de manera gratuita y 
                                        sé parte de nuesro catálogo de empresas. Tu información será mostrada a nuestros 
                                        usuarios de forma segura y práctica</p>
                                        
                                        <center>
                                            <button class="noon" onclick="location.href='empresas/altaEmp.html'" style="line-height: 25px; border:0; padding:8px; background: gray; color:white; width: 150px;">¡Resgistrate aquí!</button>

                                            <button class="noon" onclick="location.href='empresas/iniciarSesion.jsp'" style="margin-left: 40px; line-height: 25px; border:0; padding:8px; background: gray; color:white; width: 130px;">Iniciar sesion</button>
                                        </center> 
                                    </div> 
                                   
                                </div></li>
                        <li><a href="#">Mapa</a></li>
                        <li><a href="../usuarios/registro.jsp">Sesion</a></li>
                        <li><a href="../index.jsp">Inicio</a></li>
                                <%
                                statement.close();
                                con.close(); 
                            }else{
                                %>
                        <li><a href="../pagina/index.html">Sobre nosotros</a></li>
                        <li><a href="../manualidades/index.jsp">Manualidades</a></li>
                        <li><a href="../recompensas/index.jsp">Recompensas</a></li>
                        <li><a href="#">Mapa</a></li>
                        <li><a href="../calculadora/index.jsp">Calculadora</a></li>
                        <li><a id="butt" style="cursor:pointer;">Sesion</a></li>
                        <li><a href="../index2.jsp">Inicio</a></li>
                                <%
                                statement.close();
                                con.close();
                            }
                        %>
                        
                    </ul>
                </nav>
            </header>
        </div>
       <div id="target">
            <h3><%=nombre%></h3>
            <center><img src="../elementos/perfil.jpg" height="200px" width="200px" id="perfil"></center>

            <hr id="barra">
            <h5>Clase: <%=clase%></h5>
            <h5>Pts. acumulados: <%=puntos%></h5>
                                      
            <button id="ses"><h5>Cerrar sesión</h5></button>
        </div>       
        <div id="conten">
            <div id="mapa">
                
            </div>
            <div id="lista">
                <div id="bots">
                    <button id="reciclar">Vender</button>
                    <button id="tirar">Reciclar</button>
                </div>
                <div id="contLista">
                    
                </div>
            </div>
            
            
        </div>
        <div id="esteMero">
            
        </div>
        
        <footer id="main-footer">
            <p>&copy; 2019 LifeByte S.A. de C.V.</p>
            <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
            <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>
        </footer>
        
        
        <script>
            
            $('#target').toggle();
            $(document).ready(function() {
                $("#contLista").load('ListaRecicladoras.jsp');
                $("#mapa").load('MapaRecicladoras.jsp');
                $("#butt").click(function () {	 
                    $('#target').toggle("slow");
                });
                //aqui para cargar el mapa de no-recicladoras, igual que arriba
                $("#reciclar").click(function(event) {
                    $("#contLista").load('ListaRecicladoras.jsp');
                    $("#mapa").load('MapaRecicladoras.jsp');
                });
                $("#tirar").click(function(event) {
                    $("#contLista").load('ListaNoRecicladoras.jsp');
                    $("#mapa").load('MapaNoRecicladoras.jsp');
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
