
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
                     <table class="table table-dark table-bordered" style="">
                         <tr>
                             <th class="text-center">Codigo</th>
                             <th class="text-center">Nombre</th>
                             <th class="text-center">Numero de colegiado</th>
                             <th class="text-center">DPI</th>
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
                                            <td class="text-center"><%=rs.getString("especialidad_nombre")%> </td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="AgregarEspecialidad.jsp?codigo_medico=<%=rs.getString("codigo")%>">Agregar Especialidad</a>
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
