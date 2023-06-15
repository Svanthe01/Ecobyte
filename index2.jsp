<%-- 
    Document   : index2
    Created on : 26-ene-2020, 23:51:04
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<!-- Esta va a ser la página se inicio en caso de que se haya iniciado sesión-->
<html>
    <head>
        <title>Ecobyte</title>
        <link  rel="icon"   href="elementos/lifebyte.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script type='text/javascript' src="calculadora/utilidad/jquery.js"></script>
        <script src="Librerias/Bootstrap/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="estilos.css">
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
                            <li><a href="pagina/index.html">Sobre nosotros</a></li>
                            <li><a href="manualidades/index.jsp">Manualidades</a></li>
                            <li><a href="recompensas/index.jsp">Recompensas</a></li>
                            <li><a href="mapa/MapaInicio.jsp">Mapa</a></li>
                            <li><a href="calculadora/index.jsp">Calculadora</a></li>
                            <li><a id="butt" style="cursor:pointer;">Sesion</a></li>
                            <li><a href="#">Inicio</a></li>
                        </ul>
                    </nav>
                    

                </header>
            </div>
            <!--Aquí va el recuadro de sesion que se oculta y despliega-->
            
            <div id="target">
                <h3><%=nombre%></h3>
                <center><img src="elementos/perfil.jpg" height="200px" width="200px" id="perfil"></center>
                
                <hr id="barra">
                <h5>Clase: <%=clase%></h5>
                <h5>Pts. acumulados: <%=puntos%></h5>                
                                
                <button id="ses"><h5>Cerrar sesión</h5></button>
            </div>       
            
            <br><br><br>
            <h1 id="slogan" align="center"><b>Juntos por el medio</b></h1>
            <h1 id="slogan" align="center"><b>ambiente</b></h1>
        </div>
        
        <div id="cont">
            <div id="main">
                <br><br><br>
                <h2 align = "center">¿Qué es Ecobyte?</h2>
                <p align = "center">Ecobyte es un proyecto en pro del medio ambiente 
                cuya finalidad es promover el reciclaje y correcto 
                manejo de residuos a través de la tecnología, de una 
                forma personal, efectiva y sencilla</p>
                <br><br>
                <table border="0" id="tabla">
                    <tr >
                        <td style="vertical-align:middle; text-align:center"><img src="elementos/obj.jpg" height="80" width="80" ></td>
                        <td style="vertical-align:middle; text-align:center"><img src="elementos/func.jpg" height="80" width="80"></td>
                        <td style="vertical-align:middle; text-align:center"><img src="elementos/util.jpg" height="80" width="80"></td>
                    </tr>
                    <tr>
                        <td>
                            <h2 align="center">Objetivo</h2>
                            <p align="justify">Pormover el reciclaje y el buen manejo de los residuos en beneficio
                            del medio ambiente y la economía de las personas para generar conciencia a cerca
                            de su importacia.</p>
                        </td>
                        <td>
                            <h2 align="center">¿Cómo funciona?</h2>
                            <p align="justify">Es fácil de usar y muy práctico. Mediante estadísticas y medidas basadas en promedios, se generan una serie
                            de datos basados en la cantidad, porporción o tipo de materiales mediante una 
                            calculadora, donde el usuario puede ver la cantidad de residuos con la que cuenta
                            la cantidad de dinero que peude obtener por ellos o los lugares donde puede desecharlos.</p>
                        </td>
                        <td>
                            <h2 align="center">¿Es útil?</h2>
                            <p align="justify">Sí, lo es, no solo para aquellas personas que buscan una manera fácil de ganar dinero con
                            basura, sino además para quienes buscan otras maneras de hacer cosas útiles con
                            cosas inútiles o informase más acerca de las diferentes formas de ayudar al medio ambiente</p>
                        </td>
                    </tr>
                </table>
                <br><br>
                <table border="0" id="tabla">
                    <tr>
                        <td style="vertical-align:middle; text-align:center"><img src="elementos/med.jpg" height="80" width="80"></td>
                        <td style="vertical-align:middle; text-align:center"><img src="elementos/jera.jpg" height="80" width="80"></td>
                    </tr>
                    <tr>
                        <td>
                            <h2 align="center">El medio ambiente</h2>
                            <p align="justify">Las causas de contaminación ambiental no solo se encuentran 
                            enfocadas en las grandes empresas que producen grandes cantidades
                            de gases de efecto invernadero, sustancias que contaminan el mar
                            y el suelo o provocan deforestaciones masivas a lo largo del globo. 
                            Una parte de ella es producida por nosotros a diario, y es importante 
                            que sepas las medidas que puedes tomar para mejorar esta situación</p>
                        </td>
                        <td>
                            <h2 align="center">La importancia de la basura</h2>
                            <p align="justify"> La basura puede catalogarse de difenrentes formas de acuerdo al uso y porpiedades 
                            que ésta posea. Pero algunos desechos son más tóxicos y peligrosos que otros en
                            grandes o pequeñas medidas, por lo cual es importante que conozcas las diferentes propiedades
                            que cada clase tiene para que puedas darle difenrentes destinos y usos a cada una de ellas.</p>
                        </td>
                    </tr>
                </table>
                <br><br>
                
                <h2 align="center">¿Quiénes somos?</h2>
                <p align="center">LifeByte es una empresa de desarrollo de software comprometida con el desarrollo
                    de nuevas tecnologías que mejoren y haga más sencilla la vida de las personas. Para saber más 
                    sobre nosotros, <a href="pagina/index.html">haz click aquí</a></p>
                <br><br>
                
            </div>
            <footer id="main-footer">
                <p>&copy; 2019 LifeByte S.A. de C.V.</p>
                <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
                <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>
                <br><br>
            </footer>
        </div>
        <script type="text/javascript">
            $('#target').toggle();
            $(document).ready(function(){
                $("#butt").click(function () {	 
                    $('#target').toggle("slow");
                });
                $("#ses").click(function (){
                    var r = confirm("¿Desea cerrar sesión?");
                    
                    if (r == true) {
                        window.location.assign("usuarios/cerrarSes.jsp");
                    }else {
                        
                    }
                });
            });
        </script>
    </body>
</html>

