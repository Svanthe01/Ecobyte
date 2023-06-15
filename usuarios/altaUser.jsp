<!DOCTYPE html>

<%@page import = "java.sql.*, java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%
        String user = request.getParameter("user");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("contra");
        
        PreparedStatement st = null;
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
        String datos;
        
        datos = "INSERT INTO c_usuarios (id_user, correo, clave) VALUES(?,?,?)";
        st = con.prepareStatement (datos);
        st.setString(1, user);
        st.setString(2, correo);
        st.setString(3, clave);
        try{
            st.executeUpdate();
            st = null;
            con.close();
            %>
                <script type="text/javascript">
                    alert("¡Registro exitoso!");
                </script>
                <%
                for(int i = 0; i<100000; i++){}
                response.sendRedirect("registro.jsp");
                
        }catch(Exception ex){
            st = null;
            con.close();
            %>
                <script type="text/javascript">
                    alert("Es posible que el nombre de usuario ingresado ya exista, pruebe nuevamente");
                </script>
            <%
                for(int i = 0; i<100000; i++){}
                response.sendRedirect("registro.jsp");
        }
        %>
    </body>
</html>
