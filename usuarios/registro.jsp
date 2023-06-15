<%-- 
    Document   : registro
    Created on : 08-nov-2019, 1:23:12
    Author     : dante
--%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <link href="Main.css" rel="stylesheet">
        <script src="jquery-1.10.2.min.js"></script>
        <link rel="stylesheet" href="../Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="JQUERYMain.js"></script>
        
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
                            <li><a href="../pagina/index.html">Sobre nosotros</a></li>
                            <li>
                                <div class="dropdown" style="float:right;">
                                    <a class="dropbtn">¿Eres una empresa?</a>
                                    <div class="dropdown-content" style="padding: 20px; z-index: 99;" >
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
                            <li><a href="../mapa/MapaInicio.jsp">Mapa</a></li>
                            <li><a href="#">Sesion</a></li>
                            <li><a href="../index.jsp">Inicio</a></li>
                        </ul>
                    </nav>
                </header>
            </div>
            
            
         <div id="box">
            <div id="main"></div>
            
            <div id="loginform">
                <h1>Inicio sesión</h1>
                <form action="../usuarios/iniciarSes.jsp">
                    <input type="text" maxlength="15" placeholder="Nombre de usuario" name="user2" required/><br>
                    <input type="password" maxlength="15" placeholder="Contraseña" 
                           required pattern="[^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$]*" 
                           title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, 
                           al menos una minúscula, al menos una mayúscula y al menos un caracter no alfanumérico." 
                           name="contra2"/><br>
                    <button type="submit">Inicar sesión</button>
                </form>
            </div>
            <div id="signupform">
                <h1>Registro</h1>
                <form action="../usuarios/altaUser.jsp">
                <input type="text" maxlength="15" placeholder="Nombre de usuario" name="user" required/><br>
                <input type="email" maxlength="30" placeholder="Email" name="correo" required/><br>
                <input type="password" maxlength="15" placeholder="Contraseña" name="contra" 
                       required pattern="[^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$]*" 
                       title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una 
                       minúscula, al menos una mayúscula y al menos un caracter no alfanumérico." /><br>
                <button type="submit">Regístrate</button>
                </form>
            </div>
            
            <div id="login_msg">¿Tienes una cuenta?</div>
            <div id="signup_msg">¿No tienes cuenta?</div>
            
            <button id="login_btn">Ingresar</button>
            <button id="signup_btn">Crear cuenta</button>
      </div>
        </div>
        <footer id="main-footer">
            <p>&copy; 2019 LifeByte S.A. de C.V.</p>
            <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
            <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>
            <br><br>
        </footer>
    </body>
</html>