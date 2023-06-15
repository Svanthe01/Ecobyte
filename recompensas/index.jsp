 <%-- 
    Document   : index
    Created on : 25-abr-2020, 15:22:34
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
        <link rel="stylesheet" href="../calculadora/utilidad/modal.css" />
        <script src="../calculadora/utilidad/jquery.js"></script>
        <style type="text/css">
            body{
                font-family: Helvetica;
                text-align: justify;
                font-size: 18px;
                background-color: #e1e1fd;
            }
            #izq{
                width: 890px;
                height: auto;                
                display: inline-block;
                float: left;
                background-color: #e1e1fd;
                padding-top: 0;                
                padding-left: 20px;                
                padding-right: 20px;                
                padding-bottom: 30px;                
                margin-left: 30px;
            }
            #der{
                padding: 30px;
                background-color: whitesmoke;
                height: auto;
                width: 360px;
                margin-right: 20px;
                display: inline-block;
                float: right;
            }
            #main-footer{
                display: inline-block; 
                width: 100%; 
                margin-top: 0;
            }     
            .counter{
                height: auto;
                width: 270px;
                background-color: white;
                display: inline-block;
                margin-bottom: 30px; 
            }  
            #fade{
                height: auto;
                width: auto;
            }            
            #imagen{
                float: top;
                height: 75%;
                width: 100%;
                background-color: green;
            }
            #texto{
                padding: 8px;
                float: bottom;
                height: 25%;
                width: 100%;
                background-color: whitesmoke;
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
                        <li><a href="../manualidades/index.jsp">Manualidades</a></li>
                        <li><a href="#">Recompensas</a></li>
                        <li><a href="../mapa/MapaInicio.jsp">Mapa</a></li>
                        <li><a href="../calculadora/index.jsp">Calculadora</a></li>
                        <li><a id="butt" style="cursor:pointer;">Sesion</a></li>
                        <li><a href="../index2.jsp">Inicio</a></li>
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
        <div>
            <br>
            <div id="izq">
                <center>                    
                    <div id="div1" class="counter">                        
                            <%
            Statement stm = con.createStatement();
            ResultSet res = stm.executeQuery("SELECT * FROM c_recompensas ORDER BY id_recompensa DESC LIMIT 1");
            res.next();
            int id = res.getInt("id_recompensa");
            stm = null;
            res = null;
            
            if(id >= 1){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 1");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="1"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
                <script type="text/javascript">
                    document.getElementById("div1").style.display = 'none';
                </script>
                <%
            }
                %>                            
                    </div>
                    <div id="div2" class="counter" style="margin-left: 20px; margin-right: 20px;">                        
                <%
            if(id >= 2){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 2");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="2"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div2").style.display = 'none';
            </script>
                <%
            }
                %>                            
                    </div>
                    <div id="div3" class="counter">
                <%
                if(id >= 3){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 3");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="3"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div3").style.display = 'none';
            </script>
                <%
            }
                %>              
                    </div>                
                    <div id="div4" class="counter">
                <%
            if(id >= 4){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 4");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="4"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div4").style.display = 'none';
            </script>
                <%
            }
                %>      
                    </div>
                    <div id="div5" class="counter" style="margin-left: 20px; margin-right: 20px;">
                <%
            if(id >= 5){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 5");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="5"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div5").style.display = 'none';
            </script>
                <%
            }
                %>    
                    </div>
                    <div id="div6" class="counter">
                <%
            if(id >= 6){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 6");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="6"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div6").style.display = 'none';
            </script>
                <%
            }
                %>  
                    </div>                
                    <div id="div7" class="counter">
                <%
            if(id >= 7){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 7");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="7"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div7").style.display = 'none';
            </script>
                <%
            }
                %>  
                    </div>
                    <div id="div8" class="counter" style="margin-left: 20px; margin-right: 20px;">
                <%
            if(id >= 8){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 8");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="8"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div8").style.display = 'none';
            </script>
                <%
            }
                %>   
                    </div>
                    <div id="div9" class="counter">
                <%
            if(id >= 9){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 9");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="9"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div9").style.display = 'none';
            </script>
                <%
            }
                %>  
                    </div>                
                    <div id="div10" class="counter">
                <%
            if(id >= 10){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 10");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="10"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div10").style.display = 'none';
            </script>
                <%
            }
                %>    
                    </div>
                    <div id="div11" class="counter" style="margin-left: 20px; margin-right: 20px;">
                <%
            if(id >= 11){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 11");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="11"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div11").style.display = 'none';
            </script>
                <%
            }
                %>  
                    </div>
                    <div id="div12" class="counter">
                <%
            if(id >= 12){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 12");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="12"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div12").style.display = 'none';
            </script>
                <%
            }
                %>     
                    </div>
                    <div id="div13" class="counter">
                <%
            if(id >= 13){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 13");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="13"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div13").style.display = 'none';
            </script>
                <%
            }
                %>   
                    </div>
                    <div id="div14" class="counter" style="margin-left: 20px; margin-right: 20px;">
                <%
            if(id >= 14){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 14");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="14"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div14").style.display = 'none';
            </script>
                <%
            }
                %>  
                    </div>
                    <div id="div15" class="counter">
                <%
            if(id >= 15){
                stm = con.createStatement();
                res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = 15");
                res.next();
                %>
                        <div id="imagen">
                            <img src="utileria/<%=res.getString("imagen")%>" height="240" width="100%" alt="imagen">
                        </div>
                        <div id="texto">
                            <center>
                                <h6><a href="#" style="color:black;" onclick="mostrar(this)" data-value="15"><%=res.getString("nombre")%></a></h6>
                                <h6 style="color: #ffcc33;"><b><%=res.getInt("costo")%> pts.</b></h6>
                            </center>
                        </div>
                <%
                stm = null;
                res = null;
            }else{
                %>
            <script type="text/javascript">
                document.getElementById("div15").style.display = 'none';
            </script>
                <%
            }
                %>   
                    </div>
                </center>
                <br>
            </div>
            <div id="der">
                <center>
                    <h6>Participa en nuestra comunidad para ganar varios premios
                    semanales acudiendo a las empresas reicladoras y registrando
                    tus codigos, ¡Es fácil!</h6>
                    <br>
                    <h6>Registra tu código aquí</h6>
                    <button id="valida" style="font-size: 18px; line-height: 15px; border:0; padding:8px; background: gray; color:white; width: 120px;">Registrar</button>
                </center>                
            </div>            
            <div style="margin-top: 20px;" id="der">
                <center>
                    <h6 style="color: #004085;"><b>RECOMPENSAS RECLAMADAS</b></h6>
                    <div style="height: auto; width: 100%;" id="tab">
                        
                    </div>                    
                </center>  
            </div>
        </div>
        <center>
            <div style="width: 60%; height: auto; display:inline-block;">                
                <h5 style="float: left;">◄ <a href="#">Pagina anterior</a></h5>
                <h5 style="float: right;"><a href="#">Pagina siguiente</a> ►</h5>                
            </div>
        </center>        
        <div id="fade" class="modal" style="color: black;">
            <a href="#" rel="modal:close">Close</a>
        </div> 
        <footer id="main-footer">
            <p>&copy; 2019 LifeByte S.A. de C.V.</p>
            <p>De acuerdo a las leyes de la aerodinámica, es imposible que una abeja vuele</p>
            <p>La abeja, de todos modos, vuela porque no le importa lo que los humanos piensen</p>
            <br><br>
        </footer> 
        <script type="text/javascript">
            function mostrar(elemento){
                $('#fade').load("mostrarRecompensa.jsp",{id: $(elemento).data('value')}, function(response, status, xhr) {
                    if (status == "error") {
                      var msg = "Error!, algo ha sucedido X_X: ";
                      $("#fade").html(msg + xhr.status + " " + xhr.statusText);
                    }else{
                        $("#fade").modal({
                            fadeDuration: 500
                        }); 
                    }
                });

            }
            $(document).ready(function(){                
                $('#target').toggle();
                $('#tab').load("tablaRecompensas.jsp");
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
                    
                $("#valida").click(function () {	 
                    $('#fade').load("formCodigo.html");
                    $("#fade").modal({
                        fadeDuration: 500
                    }); 
                });
            });
        </script>
        <script src="../calculadora/utilidad/modal.js"></script>
    </body>
</html>
