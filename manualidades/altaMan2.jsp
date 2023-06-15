<%-- 
    Document   : altaMan2
    Created on : 05-abr-2020, 4:27:43
    Author     : dante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
        <%@page import = "java.sql.*, java.io.*" %>
        
        <%
            PreparedStatement st = null;
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");            
            int id = 0;
            
            String nombre = request.getParameter("nombre");
            String titulo = request.getParameter("titulo");
            String categoria = request.getParameter("mate");
            String mat1 = request.getParameter("uno");
            String med1 = request.getParameter("unoc");
            String mat2 = request.getParameter("dos");
            String med2 = request.getParameter("dosc");
            String mat3 = request.getParameter("tres");
            String med3 = request.getParameter("tresc");
            String mat4 = request.getParameter("cuatro");
            String med4 = request.getParameter("cuatroc");
            String mat5 = request.getParameter("cinco");
            String med5 = request.getParameter("cincoc");
            String mat6 = request.getParameter("seis");
            String med6 = request.getParameter("seisc");
            String mat7 = request.getParameter("siete");
            String med7 = request.getParameter("sietec");
            String mat8 = request.getParameter("ocho");
            String med8 = request.getParameter("ochoc");
            String mat9 = request.getParameter("nueve");
            String med9 = request.getParameter("nuevec");
            String mat10 = request.getParameter("diez");
            String med10 = request.getParameter("diezc");
            String mat11 = request.getParameter("once");
            String med11 = request.getParameter("oncec");
            
            String materiales = "";
            String medidas = "";
            
            if(mat1.length() != 0){
                materiales += mat1 + ",";
                medidas += med1 + ",";
            }
            if(mat2.length() != 0){
                materiales += mat2 + ",";
                medidas += med2 + ",";
            }
            if(mat3.length() != 0){
                materiales += mat3 + ",";
                medidas += med3 + ",";
            }
            if(mat4.length() != 0){
                materiales += mat4 + ",";
                medidas += med4 + ",";
            }
            if(mat5.length() != 0){
                materiales += mat5 + ",";
                medidas += med5 + ",";
            }
            if(mat6.length() != 0){
                materiales += mat6 + ",";
                medidas += med6 + ",";
            }
            if(mat7.length() != 0){
                materiales += mat7 + ",";
                medidas += med7 + ",";
            }
            if(mat8.length() != 0){
                materiales += mat8 + ",";
                medidas += med8 + ",";
            }
            if(mat9.length() != 0){
                materiales += mat9 + ",";
                medidas += med9 + ",";
            }
            if(mat10.length() != 0){
                materiales += mat10 + ",";
                medidas += med10 + ",";
            }
            if(mat11.length() != 0){
                materiales += mat11 + ",";
                medidas += med11 + ",";
            }
                        
            st = con.prepareStatement("INSERT INTO c_manualidades (autor, titulo, categoria, materiales, medidas, tipo) VALUES(?,?,?,?,?,?)");
            st.setString(1,nombre);
            st.setString(2,titulo);
            st.setString(3,categoria);
            st.setString(4,materiales);
            st.setString(5,medidas);
            st.setString(6,"v");
            
            try{
                st.executeUpdate();
                                
                
                st = null;
                con.close();
                
                response.sendRedirect("formVideo2.html");
            }catch(Exception ex){
                out.print("<h1>Ha ocurrido un error al cargar los datos,\n "
                        + "revise nuevamente los datos ingresados</h1>");
            }                                                
        %>
    </body>
</html>
