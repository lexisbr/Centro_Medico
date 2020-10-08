
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
         <section class="contenidoLex">
             <form action="BuscarMedico.jsp" method="POST">
                  <h2 class="titleLex">Buscar medico</h2><br>
                 <div class="wrap">
                     <h2>Ingrese codigo de medico:</h2>
                     <%@include file="SearchBar.html" %>
                 </div>
                 
                 <div class="container">
                     <table class="table table-dark table-bordered" style="font-size: 14px;">
                         <tr>
                             <th class="text-center">Codigo</th>
                             <th class="text-center">Nombre</th>
                             <th class="text-center">Numero de colegiado</th>
                             <th class="text-center">DPI</th>
                             <th class="text-center">Telefono</th>
                             <th class="text-center">Email</th>
                             <th class="text-center">Hora de Entrada</th>
                             <th class="text-center">Hora de Salida</th>
                             <th class="text-center">Fecha de inicio</th>
                             <th class="text-center">Especialidad</th>
                         </tr>
                          <% try {
                             String campo = request.getParameter("campo");
                             BuscadorMedico medico = new BuscadorMedico();
                             ResultSet rs =null;
                             if(campo!=null){
                                    rs = medico.buscadorCodigo(campo);
                                }else{
                                    rs = medico.mostrarMedicos();
                                }
                                
                                 while (rs.next()){ %>
                                        <tr>
                                            <td class="text-center"><%=rs.getString("codigo")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre")%> </td>
                                            <td class="text-center"><%=rs.getString("numero_colegiado")%> </td>
                                            <td class="text-center"><%=rs.getString("dpi")%> </td>
                                            <td class="text-center"><%=rs.getString("telefono")%> </td>
                                            <td class="text-center"><%=rs.getString("email")%> </td>
                                            <td class="text-center"><%=rs.getString("hora_entrada")%> </td>
                                            <td class="text-center"><%=rs.getString("hora_salida")%> </td>
                                            <td class="text-center"><%=rs.getString("fecha_inicio")%> </td>
                                            <td class="text-center"><%=rs.getString("especialidad_nombre")%> </td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="ModificarMedico.jsp?codigo=<%=rs.getString("codigo")%>">Modificar</a>
                                            </td>
                                        </tr>
                                    <% } 
                                }catch(SQLException e){
                                    System.out.println("error "+e);

                                }
                                    %>
                     </table>
                 </div>
             </form>
      </section>
    </body>
</html>
