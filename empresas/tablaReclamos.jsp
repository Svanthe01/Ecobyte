<%-- 
    Document   : tablaRecompensas
    Created on : 30-abr-2020, 15:40:29
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
        <link rel="stylesheet" href="estilos.css"/>
        <link rel="stylesheet" href="Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script type='text/javascript' src="calculadora/utilidad/jquery.js"></script>
        <script src="Librerias/Bootstrap/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style type="text/css">
            body{                
                background-color: #8D9AAD;
            }
            #contenido{      
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 20px;
                padding-bottom: 10px;
                height: auto;
                width: 80%;
                margin: auto;
                background-color: whitesmoke;  
                display:grid;
            }
            #arriba{                
                display: inline-block;
                height: auto;                
                width: 810px;                
                margin: auto;                
                box-shadow: 5px 10px;                
                margin-bottom: 40px;
            }
            #abajo{
                display: inline-block;
                margin: auto;
                height: auto;
                width: 95%;   
                box-shadow: 5px 10px;
                margin-bottom: 40px;
            }
            table{
                width: 100%;
                height: auto;                 
            }
            td{
                padding: 10px;
            }
            input[type=text]{
                width: 50px;
                text-align: center;
                padding: 5px;
            }
            .add{
                border: none;
                background-color: whitesmoke;
                cursor: pointer;
                text-decoration: underline;
                color: blue;
            }
            #titulo{
                background-color: gray;
                font-family: Agency FB;
                font-size: 20px;
                text-align: center; 
                color: white;
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
                            <li><a href="#">Administrar recompensas</a></li>
                            <li><a href="cerrarSes.jsp">Cerrar sesión</a></li>
                            <li><a href="index.jsp">Inicio</a></li>
                        </ul>
                    </nav>
                </header>
            </div>
            <br><br>
        </div>
        <div id="contenido">
            <div id="arriba">
                <center>
                    <div id="titulo"><h2>Administra aquí tus recompensas</h2></div>
                    <table>
                        <tr>
                            <td><b>Nombre</b></td>
                            <td><center><b>Descripción</b></center></td>
                            <td><center><b>Disponibles</b></center></td>
                            <td><center><b>Costo</b></center></td>
                            <td></td>                           
                            <td></td>                           
                        </tr>
                        <%
                            Connection con = null;            
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
                            String empresa = "";
                            
                            Statement stm = con.createStatement();
                            ResultSet res = stm.executeQuery("SELECT * FROM sesionempresa WHERE id = 3");
                            res.next();
                            empresa = res.getString("nombre");
                            res = null;
                            stm = null;
                            
                            stm = con.createStatement();
                            res = stm.executeQuery("SELECT * FROM c_recompensas WHERE empresa = '"+ empresa +"'");                            
                            while(res.next()){                                
                                %>
                        <tr>
                            <td><%=res.getString("nombre")%></td>
                            <td><center><%=res.getString("descripcion")%></center></td>
                            <td><center><%=res.getInt("stock")%></center></td>
                            <td><center><%=res.getInt("costo")%>pts.</center></td>                            
                            <td><center><input type="text" id="caja<%=res.getInt("id_recompensa")%>" maxlength="3" onkeypress="return soloNumeros(event)"/></center></td>
                            <td><center><button class="add" value="<%=res.getInt("id_recompensa")%>" id="add<%=res.getInt("id_recompensa")%>" onclick="func(<%=res.getInt("id_recompensa")%>)">Añadir stock</button></center></td>
                        </tr>
                                <%                                
                            }
                            stm = null;
                            res = null;
                        %>
                    </table>                    
                </center>
            </div>                                              
            <div id="abajo">
                <center>
                    <div id="titulo"><h2>Recopensas reclamadas</h2></div>
                    <table>
                        <tr>
                            <td><b>Usuario</b></td>                            
                            <td><center><b>Código de reclamo</b></center></td>                            
                            <td><center><b>Recompensa</b></center></td>                            
                            <td><center><b>Opciones</b></center></td>                            
                        </tr>
                        <%
                            stm = con.createStatement();
                            res = stm.executeQuery("SELECT * FROM c_reclamados WHERE empresa = '"+ empresa +"'");
                            while(res.next()){
                                %>
                                <tr>
                                    <td><%=res.getString("usuario")%></td>
                                    <td><center><%=res.getString("codigo")%></center></td>
                                    <td><center><%=res.getString("nombre_rec")%></center></td>
                                    <td><center><button id="cod" class="add" value="<%=res.getString("codigo")%>" onclick="fonc()">Marcar como reclamada</button></center></td>
                                </tr>
                                <%
                            }
                        %>
                    </table>
                </center>
            </div>                     
        </div>
        <footer id="main-footer">
            <p>&copy; 2019 LifeByte S.A. de C.V.</p>
            <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
            <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>            
        </footer>
        <script type="text/javascript">
            function soloNumeros(e){
               var key = window.Event ? e.which : e.keyCode
               return ((key >= 48 && key <= 57) || (key==8))
            }
            function func(noc){                
                 if (document.getElementById("caja"+ noc +"").value.length == 0){
                    alert("Introduzca un número");                    
                }else{
                    var num = document.getElementById("caja"+ noc +"").value;
                    var id = document.getElementById("add"+ noc +"").value;
                    location.href="añadirStock.jsp?num="+ num +"&id="+ id +"";
                }
            }           
            function fonc(){
                var r = confirm("¿Deseas eliminar este registro?");
                if (r == true) {
                    var cod = document.getElementById("cod").value;
                    window.location.assign("marcarRegistro.jsp?cod="+ cod +"");
                } else {                  
                }
            }
        </script>
    </body>
</html>

