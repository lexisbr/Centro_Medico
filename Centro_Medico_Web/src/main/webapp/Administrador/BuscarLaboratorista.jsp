<%-- 
    Document   : BuscarLaboratorista
    Created on : 4/10/2020, 05:06:49
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorLaboratorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <form action="BuscarLaboratorista.jsp" method="POST">
               <h2 class="titleLex">Buscar laboratorista</h2><br>
              <div class="wrap">
                  <h2>Ingrese codigo de laboratorista:</h2>
                  <%@include file="SearchBar.html" %>
              </div>

              <div class="container">
                  <table class="table table-dark table-bordered">
                      <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">DPI</th>
                          <th class="text-center">Telefono</th>
                          <th class="text-center">Email</th>
                      </tr>
                      <% try {
                              String campo = request.getParameter("campo");
                              BuscadorLaboratorista lab = new BuscadorLaboratorista();
                              ResultSet rs = null;
                              if (campo != null) {
                                  rs = lab.buscadorCodigo(campo);
                              } else {
                                  rs = lab.mostrarLaboratorista();
                                  }

                                  while (rs.next()) {
                                   
                      %>
                      <tr>
                          <td class="text-center"><%=rs.getString("codigo")%> </td>
                          <td class="text-center"><%=rs.getString("nombre")%> </td>
                          <td class="text-center"><%=rs.getString("dpi")%> </td>
                          <td class="text-center"><%=rs.getString("telefono")%> </td>
                          <td class="text-center"><%=rs.getString("email")%> </td>
                          <td>
                              <a class="btn btn-warning btn-sm" href="ModificarLaboratorista.jsp?codigo=<%=rs.getString("codigo")%>">Modificar</a>
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
