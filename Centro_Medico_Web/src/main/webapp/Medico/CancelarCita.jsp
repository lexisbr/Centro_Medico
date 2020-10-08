<%-- 
    Document   : CancelarCita
    Created on : 7/10/2020, 06:11:11
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasMedico"%>
<%@page import="Funcionalidades.CitasPaciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
      <% 
          String codigo_medico = session.getAttribute("user").toString();
          CitasMedico citas = new CitasMedico(codigo_medico);
      %>
         <section class="contenidoLex">
             <form action="CancelarCita.jsp" method="POST">
                  <h2 class="titleLex">Cancelar cita</h2><br>
                 <div class="wrap">
                     <h2>Ingrese codigo de cita medica:</h2>
                     <%@include file="SearchBar.html" %>
                 </div>
                 
                 <div class="container">
                     <table class="table table-dark table-bordered">
                       <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Fecha</th>
                          <th class="text-center">Hora</th>
                          <th class="text-center">Paciente</th>
                          <th class="text-center">Tipo</th>
                      </tr>
                      <% try {
                             String campo = request.getParameter("campo");
                             
                             ResultSet rs =null;
                             if(campo!=null){
                                 if(campo.equals("")){
                                    rs = citas.citasMedicas();
                                 }else{
                                      rs = citas.citasMedicasBuscar(campo);
                                 }
                                }else{
                                    rs = citas.citasMedicas();
                                }
                                 while (rs.next()){ %>
                                        <tr>
                                            <td class="text-center"><%=rs.getString("codigo")%> </td>
                                            <td class="text-center"><%=rs.getString("fecha")%> </td>
                                            <td class="text-center"><%=rs.getString("hora")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre_paciente")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre_consulta")%> </td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="../EliminarCita?codigo=<%=rs.getString("codigo")%>" name="eliminar">Cancelar cita.</a>
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
