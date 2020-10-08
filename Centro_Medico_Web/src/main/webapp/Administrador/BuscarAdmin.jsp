<%-- 
    Document   : BuscarAdmin
    Created on : 4/10/2020, 06:43:16
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscarAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarAdmin.jsp" method="POST">
               <h2 class="titleLex">Buscar administrador</h2><br>
              <div class="wrap">
                  <h2>Ingrese codigo de admin:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">DPI</th>
                      </tr>
                      <% try {
                              String campo = request.getParameter("campo");
                              BuscarAdmin examen = new BuscarAdmin();
                              ResultSet rs = null;
                              if (campo != null) {
                                  rs = examen.buscadorCodigo(campo);
                              } else {
                                  rs = examen.mostrarAdmin();
                                  }

                              while (rs.next()) {
                      %>
                      <tr>
                          <td class="text-center"><%=rs.getString("codigo")%> </td>
                          <td class="text-center"><%=rs.getString("nombre")%> </td>
                          <td class="text-center"><%=rs.getString("dpi")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="ModificarAdmin.jsp?codigo=<%=rs.getString("codigo")%>">Modificar</a>
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
