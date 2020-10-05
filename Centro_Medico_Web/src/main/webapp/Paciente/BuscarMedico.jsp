
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
                 <h2 class="titleLex">Seleccionar medico.</h2><br>
                 <div class="wrap">
                     <select class="seleccionar" name="categoria">
                         <option value="0">Seleccione la categoria.</option>
                         <option value="NOMBRE">Nombre</option>
                         <option value="ESPECIALIDAD">Especialidad</option>
                         <option value="HORA">Hora disponible</option>
                     </select>
                     <%@include file="SearchBar.html" %>
                 </div>
                 
                 <div class="container">
                     <table class="table table-dark table-bordered">
                         <tr>
                             <th class="text-center">Codigo</th>
                             <th class="text-center">Nombre</th>
                             <th class="text-center">Email</th>
                             <th class="text-center">Hora de Entrada</th>
                             <th class="text-center">Hora de Salida</th>
                             <th class="text-center">Especialidad</th>
                             <th class="text-center">Cita</th>
                         </tr>
                          <% try {
                             String categoria = request.getParameter("categoria");
                             String campo = request.getParameter("campo");
                             BuscadorMedico medico = new BuscadorMedico();
                             ResultSet rs =null;
                             if((campo!=null&&categoria!=null)){
                                    if (categoria.equals("NOMBRE")) {
                                         rs = medico.buscadorNombre(campo);
                                    }else if (categoria.equals("ESPECIALIDAD")) {
                                         rs = medico.buscadorEspecialidad(campo);
                                    }else if (categoria.equals("HORA")) {
                                         rs = medico.buscadorHora(campo);
                                     }else if (categoria.equals("0")) {
                                         rs = medico.mostrarMedicos();
                                     }else{
                                         rs = medico.mostrarMedicos();
                                     }
                                }else{
                                    rs = medico.mostrarMedicos();
                                }
                                
                                 while (rs.next()){ %>
                                        <tr>
                                            <td class="text-center"><%=rs.getString("codigo")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre")%> </td>
                                            <td class="text-center"><%=rs.getString("email")%> </td>
                                            <td class="text-center"><%=rs.getString("hora_entrada")%> </td>
                                            <td class="text-center"><%=rs.getString("hora_salida")%> </td>
                                            <td class="text-center"><%=rs.getString("especialidad_nombre")%> </td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="AgendarConsulta.jsp?codigo=<%=rs.getString("codigo")%>">Agendar consulta</a>
                                            </td>
                                        </tr>
                                    <% } 
                                }catch(SQLException e){

                                }
                                    %>
                     </table>
                 </div>
             </form>
      </section>
    </body>
</html>
