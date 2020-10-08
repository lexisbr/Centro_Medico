<%-- 
    Document   : BuscarPaciente
    Created on : 3/10/2020, 18:52:40
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorPaciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarPaciente.jsp" method="POST">
               <h2 class="titleLex">Buscar paciente</h2><br>
              <div class="wrap">
                  <h2>Ingrese codigo de paciente:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered" style="font-size: 15px;">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">Sexo</th>
                          <th class="text-center">Fecha de Nacimiento</th>
                          <th class="text-center">DPI</th>
                          <th class="text-center">Telefono</th>
                          <th class="text-center">Peso</th>
                          <th class="text-center">Tipo de Sangre</th>
                          <th class="text-center">Email</th>
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
                          <td class="text-center"><%=rs.getString("telefono")%> </td>
                          <td class="text-center"><%=rs.getString("peso")%> </td>
                          <td class="text-center"><%=rs.getString("tipo_sangre")%> </td>
                          <td class="text-center"><%=rs.getString("email")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="ModificarPaciente.jsp?codigo=<%=rs.getString("codigo")%>">Modificar</a>
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
