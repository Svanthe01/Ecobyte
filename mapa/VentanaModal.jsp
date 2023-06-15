<%-- 
    Document   : VentanaModal
    Created on : 11-ene-2020, 14:06:00
    Author     : dante

    A esta página se va a pasar como parametro la id de la empresa para de esta forma
    cargar sus datos desde la base de datos, de otra forma lanzará un error
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecobyte</title>
        <link  rel="icon"   href="../elementos/lifebyte.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Librerias/Bootstrap/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script type='text/javascript' src="../calculadora/utilidad/jquery.js"></script>
        <script src="../Librerias/Bootstrap/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style type="text/css">
            .modal-dialog{
                height: auto;
                width: 100%;
                
                
                float: left;
                margin-left: 300px;
            }
            .modal-content{
                height: 100%;
                width: 800px;
                
            }
            #bottt{
                display: none;
            }
        </style>
    </head>
    <body>
        
        <button id="bottt" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#miModal">
                Abrir modal
        </button>
        <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" >
                <div class="modal-content">
                    <%
                    String ico = request.getParameter("id");
                    int ido = Integer.parseInt(ico);

                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/data?autoReconnect=true&useSSL=false", "root", "s3mb3ll0");

                    
                    try{
                        ps = con.prepareStatement("SELECT * FROM c_empresas WHERE id_empresa="+ ido +"");
                        rs = ps.executeQuery();
                        while(rs.next()){
                            %>
                    <div class="modal-header">
                        <h3 class="modal-title" id="myModalLabel"><%=rs.getString("nombre")%></h3>
                        <%
                        if(rs.getString("tipo").equals("v")){
                        %>
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Empresa recicladora, vende aquí tu basura</h4>
                            <%=rs.getString("descripcion")%>
                            <br><br>
                            <h5>Tabla de precios</h5>
                            <table>
                                <tr>
                                    <td><b>Material</b></td>
                                    <td><b>Precio por kilo/litro</b></td>
                                </tr>
                                <%
                                PreparedStatement ps2 = con.prepareStatement("SELECT * FROM precios WHERE id_precios="+ rs.getInt("fk_precios") +"");
                                ResultSet rs2 = ps2.executeQuery();
                                rs2.next();
                                
                                String columnas[] = {"kPlastico","kVidrio","kPapel","kAluminio","kCarton","lAceite","kCobre","kPet","kFerroso","kNoFerroso","kTextiles"};
                                String nombres[] = {"Plástico","Vidrio","Papel","Aluminio","Cartón","Aceite","Cobre","PET","Materiales ferrosos","Materiales no ferrosos","Textiles"};
                                for(int i = 0; i < 11; i++){
                                    if(rs2.getInt(columnas[i]) != 0){
                                        %>
                                <tr>
                                    <td><b><%=nombres[i]%></b></td>
                                    <td><b><%=rs2.getInt(columnas[i])%></b></td>
                                </tr>
                                        <%
                                    }
                                }
                                %>
                            </table>
                            <br>
                            <h5>Contacto:</h5>
                            <p><u>Teléfono: </u> <%=rs.getString("telefono")%></p>
                            <p><u>Correo: </u> <%=rs.getString("correo")%></p>
                            <p><u>Página web: </u><%=rs.getString("enlace")%></p>
                    </div>
                        <% 
                            rs2 = null;
                            ps2 = null;
                        }else{
                        %>
                            
                            
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h4>Empresa recicladora, desecha aquí tu basura</h4>
                            <%=rs.getString("descripcion")%>
                            <br><br>
                            <h5>Materiales recibidos</h5>
                            <table>
                                <tr>
                                    <td><b>Material</b></td>                                    
                                </tr>
                                <%
                                PreparedStatement ps2 = con.prepareStatement("SELECT * FROM c_noreciclables WHERE id_noReciclables="+ rs.getInt("fk_noreciclables") +"");
                                ResultSet rs2 = ps2.executeQuery();
                                rs2.next();
                                
                                String columnas[] = {"aceiteAut","aceiteCoc","cartToner","residuosConst","electro","tetrapack","focos","medicamentos","baterias","pintura","organicos","sanitarios","vidrio","varios","unicel"};
                                String nombres[] = {"Aceite de auto","Aceite de cocina","Cartuchos de toner","Residuos de construcción","Electrodomésticos","Tetrapack","Focos","Medicamentos","Baterias","Pintura","Desechos orgánicos","Desechos sanitarios","Vidrio","Casetes, DVD´s, VHS's etc.","Unicel"};
                                for(int i = 0; i < 15; i++){
                                    if(rs2.getString(columnas[i]).equals("s")){
                                        %>
                                <tr>
                                    <td><b><%=nombres[i]%></b></td>                                    
                                </tr>
                                        <%
                                    }
                                }
                                %>
                            </table>
                            <br>
                            <h5>Contacto:</h5>
                            <p><u>Teléfono: </u> <%=rs.getString("telefono")%></p>
                            <p><u>Correo: </u> <%=rs.getString("correo")%></p>
                            <p><u>Página web: </u><%=rs.getString("enlace")%></p>

                        </div>
                            <%
                                rs2 = null;
                                ps2 = null;
                            }
                        }

                    }catch(Exception ex){
                        %>
                        <h2>Ha ocurrido un error al cargar los datos X_X</h2>
                        <%
                    }

                        rs.close();
                        ps.close();
                        con.close();
                    %>

                    
                    
                    
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        //para accionar el boton en cuanto se cargue la página
        document.getElementById("bottt").click(true);
        
    </script>
</html>
