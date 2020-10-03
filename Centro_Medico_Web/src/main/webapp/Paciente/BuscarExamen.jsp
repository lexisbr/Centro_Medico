<%-- 
    Document   : BuscarExamen
    Created on : 2/10/2020, 21:06:22
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarExamen.jsp" method="POST">
              <div class="wrap">
                  <h2>Ingrese nombre de examen:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">Descripcion</th>
                          <th class="text-center">Costo</th>
                      </tr>
                      <% try {
                              String campo = request.getParameter("campo");
                              BuscadorExamenes examen = new BuscadorExamenes();
                              ResultSet rs = null;
                              if (campo != null) {
                                  rs = examen.buscadorNombre(campo);
                              } else {
                                  rs = examen.mostrarExamenes();
                                  }

                                  while (rs.next()) {%>
                      <tr>
                          <td class="text-center"><%=rs.getString("codigo")%> </td>
                          <td class="text-center"><%=rs.getString("nombre")%> </td>
                          <td class="text-center"><%=rs.getString("descripcion")%> </td>
                          <td class="text-center"><%=rs.getString("costo")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="AgendarExamen.jsp?nombre=<%=rs.getString("nombre")%>">Agendar examen</a>
                          </td>
                      </tr>
                      <% }
                          } catch (SQLException e) {

                          }
                      %>
                  </table>
              </div>
          </form>
      </section>
    </body>
</html>
