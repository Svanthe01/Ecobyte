<%-- 
    Document   : index
    Created on : 30-abr-2020, 3:10:56
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <link rel="stylesheet" href="estilos.css"/>
        <link rel="stylesheet" href="Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script type='text/javascript' src="calculadora/utilidad/jquery.js"></script>
        <script src="Librerias/Bootstrap/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style type="text/css">
            body{                
                background-image: url(utilidades/fondo3.jpg);
                background-repeat: no-repeat;
                background-size: 100%;
                background-attachment: fixed;
                font-family: Agency FB;
            }        
            #contenido{                
                font-family: Helvetica;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 0px;
                padding-bottom: 10px;
                height: auto;
                width: 90%;                                
                margin: auto;
            }
            table{
                width: 100%;                 
                height: auto;                              
            }
            td{
                padding: 10px;
            }
        </style>
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
                            <li>
                                <div class="dropdown" style="float:right;">
                                    <a class="dropbtn">Nueva recompensa</a>
                                    <div class="dropdown-content" style="padding: 20px;" >
                                        <p style="color: #333333; margin: 0px; line-height : 25px;">
                                            Fomenta la cultura del reciclado creando premios                                            
                                            para los usuarios que aporten alguna ayuda al ambiente
                                            en forma de artículos o mercancía. Checa la lista de premios 
                                            reclamados en la pestaña de Recompensas reclamadas.
                                        </p>
                                        <button class="noon" onclick="location.href='../recompensas/formRecompensa.html'" style="line-height: 25px; border:0; padding:8px; background: gray; color:white; width: 150px;">Nueva recompensa</button>
                                    </div>                                    
                                </div>
                            </li>
                            <li><a href="tablaReclamos.jsp">Administrar recompensas</a></li>
                            <li><a href="#" onclick="func()">Cerrar sesión</a></li>
                            <li><a href="#">Inicio</a></li>
                        </ul>
                    </nav>
                </header>
            </div>
            <br><br>
        </div>                
        <div id="contenido">                   
            <br><br><br><br><br><br><br><br><br><br>
            <center>
                <h1 style="color: white;"><b>ECOBYTE PARA EMPRESAS</b></h1>
                <h3 style="color: white;">por tu comodidad</h3>            
            </center>
        </div>        
    </body>
    <script type="text/javascript">
        function func(){
            var r = confirm("¿Desea cerrar sesión?");
                    
            if (r == true) {
                window.location.assign("cerrarSes.jsp");
            }else {

            }
        }
    </script>
</html>
