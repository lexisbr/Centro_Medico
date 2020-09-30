<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 04:01:28
    Author     : lex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
    
         <section class="contenidoLex">
          <div class="container">
              <table class="table table-bordered">
                  <tr>
                      <th class="text-center">Nombre</th>
                      <th class="text-center">Email</th>
                      <th class="text-center">Hora de Entrada</th>
                      <th class="text-center">Hora de Salida</th>
                      <th class="text-center">Especialidad</th>
                  </tr>
                  <% Medico medico = new Medico();
                      ResultSet rs = medico.buscadorNombre("nombre");
                      while (rs.next()) {%>
                  <tr>
                      <td class="text-center"><%=rs.getString("nombre")%> </td>
                      <td class="text-center"><%=rs.getString("email")%> </td>
                      <td class="text-center"><%=rs.getString("hora_entrada")%> </td>
                      <td class="text-center"><%=rs.getString("hora_salida")%> </td>
                      <td>
                          <a class="btn btn-warning btn-sm">Agendar Cita</a>
                      </td>
                  </tr>
                  <%}%>
              </table>
          </div>
      </section>
    </body>
</html>
