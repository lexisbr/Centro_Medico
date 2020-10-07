<%-- 
    Document   : OrdenesLab
    Created on : 7/10/2020, 01:44:48
    Author     : lex
--%>

<%@page import="Funcionalidades.BuscadorOrdenes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <%@include file="Encabezado.html" %>
    <section class="contenidoLex">
        <form action="VisualizarOrdenes.jsp" method="POST">
            <h2 class="titleLex">Seleccionar orden.</h2><br>
            <div class="wrap">
                <%@include file="SearchBar.html" %>
            </div>

            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Examen</th>
                        <th class="text-center">Codigo del medico</th>
                    </tr>
                    <% try {
                            String codigo_paciente = String.valueOf(session.getAttribute("user"));
                            String campo = request.getParameter("campo");
                            BuscadorOrdenes orden = new BuscadorOrdenes();
                            ResultSet rs = null;
                            if (campo != null) {
                               rs=orden.mostrarOrdenes(codigo_paciente);
                            } else {
                                rs=orden.mostrarOrdenes(codigo_paciente);
                                  }

                                  while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("descripcion")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
                        <td class="text-center"><%=rs.getString("medico_codigo")%> </td>
                        <td>
                            <a class="btn btn-warning btn-sm" href="../DescargarOrden?codigo=<%=rs.getString("codigo")%>">Descargar PDF</a>
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
