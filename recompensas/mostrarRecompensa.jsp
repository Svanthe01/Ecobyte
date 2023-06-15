<%-- 
    Document   : mostrarRecompensa
    Created on : 28-abr-2020, 3:31:08
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
            
            Connection con = null;            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            
            Statement stm = con.createStatement();
            ResultSet res = stm.executeQuery("SELECT * FROM c_recompensas WHERE id_recompensa = "+ id +"");
            res.next();
        %>             
        <div style="width: 400px; height: auto; border: 0;">            
            <center>
                <img src="utileria/<%=res.getString("imagen")%>" height="300" width="390" alt="imagen">                
                <h6 style="margin-top: 10px;"><b>Nombre: </b><%=res.getString("nombre")%></h6>
                <h6><b>Costo: </b><%=res.getInt("costo")%>pts. &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Dispoibles: </b><%=res.getInt("stock")%></h6>                                
            </center>
            <h6><%=res.getString("descripcion")%></h6>
            
            <h6><b>Empresa: </b> <%=res.getString("empresa")%></h6>
            <center>
                <button style="line-height: 25px; border:0; padding:2px; background: #ffcc33; color: balck; width: 150px;"
                            onclick="location.href='reclamar.jsp?id=<%=id%>'" id="bott">Reclamar</button>
            </center>
            <%
                if(res.getInt("stock") == 0){
                    %>
                    <script type="text/javascript">
                        document.getElementById("bott").disabled = true;
                    </script>
                    <%
                }  
            %>
        </div>
        <%
            res = null;
            stm = null;
            con.close();
        %>
    </body>
</html>
