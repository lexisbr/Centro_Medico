<%-- 
    Document   : BuscarPacienteCita
    Created on : 7/10/2020, 04:28:45
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Funcionalidades.BuscadorPaciente"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarPacienteCita.jsp" method="POST">
               <h2 class="titleLex">Agendar nueva cita</h2><br>
              <div class="wrap">
                  <h2>Ingrese codigo de paciente:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">Sexo</th>
                          <th class="text-center">Fecha de Nacimiento</th>
                          <th class="text-center">DPI</th>
                      </tr>
                      <% try {
                              String campo = request.getParameter("campo");
                              BuscadorPaciente paciente = new BuscadorPaciente();
                              ResultSet rs = null;
                              if (campo != null) {
                                  rs = paciente.buscadorCodigo(campo);
                              } else {
                                  rs = paciente.mostrarPacientes();
                                  }

                                  while (rs.next()) {
                                   
                      %>
                      <tr>
                          <td class="text-center"><%=rs.getString("codigo")%> </td>
                          <td class="text-center"><%=rs.getString("nombre")%> </td>
                          <td class="text-center"><%=rs.getString("sexo")%> </td>
                          <td class="text-center"><%=rs.getString("fecha_nacimiento")%> </td>
                          <td class="text-center"><%=rs.getString("dpi")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="AgendarCita.jsp?codigo_paciente=<%=rs.getString("codigo")%>">Agendar cita</a>
                          </td>
                      </tr>
                      <%
                          
                          
                          }
                          } catch (SQLException e) {

                          }
                      %>
                  </table>
              </div>
          </form>
      </section>
    </body>
</html>
