<%-- 
    Document   : VisualizarCitasHoy
    Created on : 7/10/2020, 19:25:06
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Funcionalidades.CitasLab"%>
<%@page import="Funcionalidades.CitasMedico"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String codigo_lab = session.getAttribute("user").toString();
        CitasLab citas = new CitasLab(codigo_lab);
    %>
    <section class="contenidoLex">
        <form action="" method="POST">
            <h2 class="titleLex">Citas agendadas para dia en curso</h2>
            <h2><%=LocalDate.now()%></h2><br>
            <div class="wrap">
                <h2>Ingrese codigo de cita:</h2>
                <%@include file="SearchBar.html" %>
            </div>

            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Paciente</th>
                        <th class="text-center">Examen</th>
                    </tr>
                    <% try {
                            String campo = request.getParameter("campo");

                            ResultSet rs = null;
                            if (campo != null) {
                                if (campo.equals("")) {
                                    rs = citas.buscarCitasExamenHoy(String.valueOf(LocalDate.now()));
                                } else {
                                    rs = citas.buscarCitasExamenHoy(campo, String.valueOf(LocalDate.now()));
                                }
                            } else {
                                rs = citas.buscarCitasExamenHoy(String.valueOf(LocalDate.now()));
                            }
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("fecha")%> </td>
                        <td class="text-center"><%=rs.getString("hora")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_paciente")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_examen")%> </td>
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
