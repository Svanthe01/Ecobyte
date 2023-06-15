

<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
    </head>
    <body>         
        <%
            request.setCharacterEncoding("UTF-8");
            String nombre = request.getParameter("nombre");
            String descrip = new String(request.getParameter("descrip").getBytes("ISO-8859-1"), "UTF-8");
            String correo = request.getParameter("correo");
            String tel = request.getParameter("tel");
            String enlace = request.getParameter("enlace");
            String pass = request.getParameter("pass");
            String coors = request.getParameter("oculto");
            coors = coors.replace("LatLng(", "");
            coors = coors.replace(")", "");
            if(enlace.length() == 0){
                enlace = "No disponible";
            }
            String tipo = new String(request.getParameter("tipo"));
            //primero damos de alta los precios en caso de que compre
            
            //preparamos conexion
            PreparedStatement st = null;
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");
            String datos;
            int aux;
            
            //primero damos de alta los precios o los materiales en caso de que compre o reciba
            if(tipo.equals("comp")){
                datos = "INSERT INTO precios (kPlastico, kVidrio, kPapel, kAluminio, kCarton, lAceite, kCobre, kPet, kFerroso, kNoFerroso, kTextiles) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                st = con.prepareStatement (datos);
                String dats[] = request.getParameterValues("mate");
                
                for(int i = 1; i < 12; i++){//Valor por default
                    st.setInt(i, 0);
                }
                
                String pre;
                int pri;
                for(int i = 0; i < dats.length; i++){
                    if(dats[i].equals("plast")){
                        pre = request.getParameter("prePlast");
                        pri = Integer.parseInt(pre);
                        st.setInt(1,pri);
                    }
                    if(dats[i].equals("pet")){

                        pre = request.getParameter("prePet");
                        pri = Integer.parseInt(pre);
                        st.setInt(8,pri);
                    }
                    if(dats[i].equals("pap")){

                        pre = request.getParameter("prePap");
                        pri = Integer.parseInt(pre);
                        st.setInt(3,pri);
                    }
                    if(dats[i].equals("vid")){
                        pre = request.getParameter("preVid");
                        pri = Integer.parseInt(pre);
                        st.setInt(2,pri);
                    }
                    if(dats[i].equals("alu")){
                        pre = request.getParameter("preAlu");
                        pri = Integer.parseInt(pre);
                        st.setInt(4,pri);
                    }
                    if(dats[i].equals("cob")){
                        pre = request.getParameter("preCob");
                        pri = Integer.parseInt(pre);
                        st.setInt(7,pri);
                    }
                    if(dats[i].equals("cart")){
                        pre = request.getParameter("preCart");
                        pri = Integer.parseInt(pre);
                        st.setInt(5,pri);
                    }
                    if(dats[i].equals("acet")){
                        pre = request.getParameter("preAcet");
                        pri = Integer.parseInt(pre);
                        st.setInt(6,pri);
                    }
                    if(dats[i].equals("ferr")){
                        pre = request.getParameter("preFerr");
                        pri = Integer.parseInt(pre);
                        st.setInt(9,pri);
                    }
                    if(dats[i].equals("noFerr")){
                        pre = request.getParameter("preNoFerr");
                        pri = Integer.parseInt(pre);
                        st.setInt(10,pri);
                    }
                    if(dats[i].equals("texles")){
                        pre = request.getParameter("preTexles");
                        pri = Integer.parseInt(pre);
                        st.setInt(11,pri);
                    }
                
                }
                st.executeUpdate();
                st = null;
                datos = "";
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM precios ORDER BY id_precios DESC LIMIT 1");
                rs.next();
                aux = rs.getInt("id_precios");
                
                //alta
                datos = "INSERT INTO c_empresas (nombre, coordenadas, telefono, descripcion, tipo, correo, enlace, fk_precios, contraseña) VALUES(?,?,?,?,?,?,?,?,?)";
                st = con.prepareStatement (datos);
                try{
                    st = con.prepareStatement (datos);
                    st.setString(1,nombre);
                    st.setString(2, coors);
                    st.setString(3, tel);
                    st.setString(4, descrip);
                    st.setString(5, "r");
                    st.setString(6, correo);
                    st.setString(7, enlace);
                    st.setInt(8, aux);
                    st.setString(9, pass);
                   
                    st.executeUpdate();
                    con.close();

                    out.println("<h3>Registro exitoso</h3>");
                    out.println("<a href='#'>Regresar</a>");
                }catch(Exception ex){
                    out.println("<h3>Ha ocurrido un error X_X</h3>" + ex.getMessage());
                    out.println("<a href='#'>Regresar</a>");
                }
                
            }else{
                datos = "INSERT INTO c_noreciclables (aceiteAut, aceiteCoc, cartToner, residuosConst, electro, tetrapack, focos, medicamentos, baterias, pintura, organicos, sanitarios, vidrio, varios, unicel) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                st = con.prepareStatement (datos);
                String dats[] = request.getParameterValues("mate2");
                
                for(int i = 1; i < 16; i++){
                    st.setString(i, "n");//n de "no recibe"
                }
                
                for(int i = 0; i < dats.length; i++){
                    if(dats[i].equals("acetAut"))
                            st.setString(1,"s");//s de "sí recibe"
                    if(dats[i].equals("acetCoc"))
                        st.setString(2,"s");
                    if(dats[i].equals("toner"))
                        st.setString(3,"s");
                    if(dats[i].equals("residConst"))
                        st.setString(4,"s");
                    if(dats[i].equals("elec"))
                        st.setString(5,"s");
                    if(dats[i].equals("tetra"))
                        st.setString(6,"s");
                    if(dats[i].equals("focos"))
                        st.setString(7,"s");
                    if(dats[i].equals("medic"))
                        st.setString(8,"s");
                    if(dats[i].equals("baterias"))
                        st.setString(9,"s");
                    if(dats[i].equals("pintura"))
                        st.setString(10,"s");
                    if(dats[i].equals("orgas"))
                        st.setString(11,"s");
                    if(dats[i].equals("sanit"))
                        st.setString(12,"s");
                    if(dats[i].equals("vidrio"))
                        st.setString(13,"s");
                    if(dats[i].equals("varios"))
                        st.setString(14,"s");
                    if(dats[i].equals("unicel"))
                        st.setString(15,"s");
                }
                st.executeUpdate();
                st = null;
                datos = "";
                
                //recuperamos el numero de registro
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM c_noreciclables ORDER BY id_noReciclables DESC LIMIT 1");
                rs.next();
                aux = rs.getInt("id_noReciclables");
                
                //alta
                datos = "INSERT INTO c_empresas (nombre, coordenadas, telefono, descripcion, tipo, correo, enlace, fk_noreciclables, contraseña) VALUES(?,?,?,?,?,?,?,?,?)";
                st = con.prepareStatement (datos);
                try{
                    st = con.prepareStatement (datos);
                    st.setString(1,nombre);
                    st.setString(2, coors);
                    st.setString(3, tel);
                    st.setString(4, descrip);
                    st.setString(5, "r");
                    st.setString(6, correo);
                    st.setString(7, enlace);
                    st.setInt(8, aux);
                    st.setString(9, pass);
                   
                    st.executeUpdate();
                    con.close();
                    %>
                    <script type="text/javascript">
                        var r = confirm("Registro completado");
                        if (r == true) {
                          window.location.assign("../index.jsp");
                        } else {
                          window.location.assign("../index.jsp");
                        }
                    </script>
                    <%
                }catch(Exception ex){
                    %>
                    <script type="text/javascript">
                        var r = confirm("Ha ocurrido un error al procesar los datos X_X");
                        if (r == true) {
                          window.location.assign("altaEmp.html");
                        } else {
                          window.location.assign("altaEmp.html");
                        }
                    </script>
                    <%
                }
            }

        %>
    </body>
</html>
