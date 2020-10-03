<%-- 
    Document   : BuscarConsulta
    Created on : 3/10/2020, 05:43:24
    Author     : lex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscarConsultas"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarConsulta.jsp" method="POST">
              <div class="wrap">
                  <h2>Ingrese nombre de consulta:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Costo</th>
                          <th class="text-center">Especialidad</th>
                      </tr>
                      <% try {
                              String campo = request.getParameter("campo");
                              BuscarConsultas consultas = new BuscarConsultas();
                              ResultSet rs = null;
                              if (campo != null) {
                                  rs = consultas.buscadorNombre(campo);
                              } else {
                                  rs = consultas.mostrarConsultas();
                                  }

                                  while (rs.next()) {
                                   
                      %>
                      <tr>
                          <td class="text-center"><%=rs.getString("codigo")%> </td>
                          <td class="text-center"><%=rs.getString("costo")%> </td>
                          <td class="text-center"><%=rs.getString("nombre_especialidad")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="ModificarConsulta.jsp?codigo=<%=rs.getString("codigo")%>">Modificar</a>
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
