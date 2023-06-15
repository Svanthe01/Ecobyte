<%-- 
    Document   : index
    Created on : 08-nov-2019, 12:48:33
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        <div id="vacio">
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
                            <li>
                                <div class="dropdown" style="float:right;">
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
                                   
                                </div>
                            </li>
                            <li><a href="mapa/MapaInicio.jsp">Mapa</a></li>
                            <li><a href="usuarios/registro.jsp">Sesion</a></li>
                            <li><a href="#">Inicio</a></li>
                        </ul>
                    </nav>
                </header>
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
        
    </body>
</html>