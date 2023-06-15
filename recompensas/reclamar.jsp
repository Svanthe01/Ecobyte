<%-- 
    Document   : reclamar
    Created on : 02-may-2020, 11:48:52
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
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            int ido = Integer.parseInt(id);
            int puntosRecompensa = 0;
            int puntosUsuario = 0;
            int stock = 0;
            String codigo = "";
            String usuario = "";
            String nombre_rec = "";
            String empresa = "";
            
            Connection con = null;            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            //verificamos si los puntos del usuario son suficientes
            Statement stm = con.createStatement();
            ResultSet res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = "+ id +"");
            res.next();
            empresa = res.getString("empresa");
            nombre_rec = res.getString("nombre");
            stock = res.getInt("stock");
            puntosRecompensa = res.getInt("costo");
            res = null;
            stm = null;
            
            stm = con.createStatement();
            res = stm.executeQuery("SELECT * FROM sesion WHERE id = 3");
            res.next();
            usuario = res.getString("usuario");
            puntosUsuario = res.getInt("puntos");
            res = null;
            stm = null;
            
            if(puntosUsuario >= puntosRecompensa){
                //restamos los puntos al usuario y actualizamos los puntos restantes
                int sobrantes = puntosUsuario - puntosRecompensa;
                stm = con.createStatement();
                stm.executeUpdate("UPDATE sesion SET puntos = "+ sobrantes +" WHERE id = 3");
                stm = null;

                stm = con.createStatement();
                stm.executeUpdate("UPDATE c_usuarios SET puntos = "+ sobrantes +" WHERE id_user = '"+ usuario+"'");
                stm = null;
                
                //reducimos la cantidad de los artículos en stock
                stock = stock - 1;
                stm = con.createStatement();
                stm.executeUpdate("UPDATE c_recompensas SET stock = "+ stock +" WHERE id_recompensa = "+ id +"");
                stm = null;

                //generamos el código de reclamo
                String cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";                
                String num1 = String.valueOf((int)Math.floor(Math.random()*100 + 10));

                for (int i = 0; i < 4; i++) {
                    codigo += cadena.charAt((int)Math.floor(Math.random()*cadena.length())); 
                    codigo += String.valueOf((int)Math.floor(Math.random()*10));
                }
                codigo += cadena.charAt((int)Math.floor(Math.random()*cadena.length())); 
                codigo += num1;

                //guardamos datos de la recompensa en la tabla de reclamos                                              
                PreparedStatement ps = null;
                ps = con.prepareStatement("INSERT INTO c_reclamados (usuario, codigo, fk_recompensa, nombre_rec, empresa) VALUES(?,?,?,?,?)");                    
                ps.setString(1, usuario);
                ps.setString(2, codigo);
                ps.setInt(3, ido);
                ps.setString(4, nombre_rec);
                ps.setString(5, empresa);
                ps.executeUpdate();  
                ps = null;
                
                %>
                <script type="text/javascript">
                    var r = confirm("Recompensa reclamada, lleva éste código a la empresa para obtener tu artículo:\n<%=codigo%>");
                    if (r == true) {
                      window.location.assign("index.jsp");
                    } else {
                      window.location.assign("index.jsp");
                    }
                </script>
                <%
            }else{
                %>
                <script type="text/javascript">
                    var r = confirm("Tus puntos son insuficientes, gana más para poder reclamar esta recompensa");
                    if (r == true) {
                      window.location.assign("index.jsp");
                    } else {
                      window.location.assign("index.jsp");
                    }
                </script>
                <%
            }                        

        %>
    </body>
</html>
