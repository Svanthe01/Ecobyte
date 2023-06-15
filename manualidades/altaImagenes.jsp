<%-- 
    Document   : altaImagenes
    Created on : 04-abr-2020, 23:55:21
    Author     : dante
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>
<%@page import="java.nio.file.Paths"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@page import = "java.sql.*, java.io.*" %>
<%!
    public static class uts{
       
        public static String generaNombre(String cadena){            
            for (int i = cadena.length() - 1; i > 0; i--){
                if(cadena.charAt(i) == '\\'){
                    cadena = cadena.substring(i + 1);
                    break;
                }
            }             
            return cadena;
        }
   }
%>
 
<%
    PreparedStatement st = null;
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");            
    int id = 0;
    
    Statement statement = con.createStatement();
    ResultSet rs = statement.executeQuery("SELECT * FROM c_manualidades ORDER BY id_manualidad DESC LIMIT 1");
    rs.next();
    id = rs.getInt("id_manualidad");
                
    /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();

            /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
            /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);

    for(int i=0;i<items.size();i++){
                    /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
        FileItem item = (FileItem) items.get(i);

                    /*item.isFormField() false=input file; true=text field*/

        if (! item.isFormField()){
            //tomamos el nombre del archivo subido
            String nombre = uts.generaNombre(item.getName());                
            /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File("C:/Users/dante/OneDrive/Documentos/NetBeansProjects/Ecobyte/web/multimedia/" + nombre);
            /*y lo escribimos en el servido*/
            item.write(archivo_server);
            
            st = con.prepareStatement("INSERT INTO c_imagenes (ruta, numImagen, fk_manualidad) VALUES(?,?,?)");
            st.setString(1,nombre);
            st.setInt(2,i + 1);
            st.setInt(3,id);
            st.executeUpdate();
            st = null;
            
        }
    }
    st = null;
    con.close();
    
    response.sendRedirect("index.jsp");
%>        
    </body>
</html>