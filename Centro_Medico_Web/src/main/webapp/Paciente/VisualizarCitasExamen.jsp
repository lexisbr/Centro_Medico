<%-- 
    Document   : VisualizarCitasExamen
    Created on : 6/10/2020, 00:02:52
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasPaciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <script>
        function alerta() {
            alert("Se cancelo la cita.");
        }
    </script>
    <%@include file="Encabezado.html" %>
    <%
        String codigo_paciente = session.getAttribute("user").toString();
        CitasPaciente citas = new CitasPaciente(codigo_paciente);
        if (request.getParameter("codigo") != null) {
            try {
                citas.eliminarCitaExamen(Integer.parseInt(request.getParameter("codigo")));
            } catch (Exception e) {
                System.out.println("error al eliminar " + e);
            }

        }

    %>
    <section class="contenidoLex">
        <form action="VisualizarCitasExamen.jsp" method="POST">
            <h2 class="titleLex">Visualizar citas de examen</h2><br>
            <div class="wrap">
                <h2>Ingrese codigo de cita de examen:</h2>
                <%@include file="SearchBar.html" %>
            </div>

            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Laboratorista</th>
                        <th class="text-center">Tipo</th>
                    </tr>
                    <% try {
                            String campo = request.getParameter("campo");

                            ResultSet rs = null;
                            if (campo != null) {
                                if (campo.equals("")) {
                                    rs = citas.citasExamen();
                                } else {
                                    rs = citas.citasExamenBuscar(campo);
                                }
                            } else {
                                  rs = citas.citasExamen();
                              }
                              while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("fecha")%> </td>
                        <td class="text-center"><%=rs.getString("hora")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_lab")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_examen")%> </td>
                        <td>
                            <a class="btn btn-warning btn-sm" href="VisualizarCitasExamen.jsp?codigo=<%=rs.getString("codigo")%>" name="eliminar" onclick="alerta()">Cancelar cita.</a>
                        </td>
                    </tr>
                    <% }
                        } catch (SQLException e) {
                            System.out.println("error " + e);

                        }
                    %>
                </table>
            </div>
        </form>
    </section>
</body>
</html>
