<%-- 
    Document   : iniciarSesion
    Created on : 01-may-2020, 19:11:36
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <style type="text/css">
            body{
                padding: 0;   
                background-color: #e1e1fd;       
                font-family: Helvetica;
            }
            #conten{
                padding: 30px;
                width: 700px;
                height: auto;
                background-color: whitesmoke;
                margin: 0px auto;
            }            
            input[type=text], input[type=password]{
                width: 300px;
                border: none;
                height: 30px;
                font-size: 18px;       
                padding: 10px;
                background-color: whitesmoke;
                border-bottom: 2px solid gray;
            }

            input[type=submit] {
                width: 200px;
                background-color: gray;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                font-family: Helvetica;
                font-size: 14px;
                cursor: pointer;                
            }          
            #titulo{
                height: auto;
                width: 758px;
                padding: 1px;
                color: white;
                background-color: gray;
                margin: 0px auto;
            }            
        </style>
    </head>
    <body>
        <%
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            String clase = "";

            Statement statement = con.createStatement();
                        //se comprueba que el usuario esté o no registrado
            ResultSet rs = statement.executeQuery("SELECT * FROM sesionempresa WHERE id=3");
            rs.next();                            
            int aux = rs.getInt("valor");
            
            if(aux == 1){
                response.sendRedirect("index.jsp");
            }      
        %>
        <br><br><br><br><br><br>
        <div id="titulo"><center><h3>I N I C I O &nbsp&nbspD E&nbsp&nbsp S E S I Ó N</h3></center></div>
        <div id="conten">
            <form action="validarSesion.jsp" id="formi" onsubmit="javascript: return validar()">
                <center>                                        
                    <input type="text" id="nombre" name="nombre" placeholder="Nombre" required/>
                    <br><br>
                    <input type="password" maxlength="8" id="contra" name="contra" placeholder="Contraseña" required/>
                    <br><br>
                    <input type="submit" value="INICIAR"/>
                </center>
            </form>
        </div>
    </body>    
</html>