<%-- 
    Document   : CitaIntervalo
    Created on : 7/10/2020, 05:54:45
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%try {
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        String codigo_medico = session.getAttribute("user").toString();
        CitasMedico citas = new CitasMedico(codigo_medico);

    %>
    <section class="contenidoLex">
        <form action="CitasHoy.jsp" method="POST">
            <h2 class="titleLex">Visualizar citas medicas</h2><br>
            <div class="wrap">
                <h2>Fecha inicio:<%=fecha_inicio%></h2>
                <h2>Fecha final:<%=fecha_final%></h2>
            </div>

            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Paciente</th>
                        <th class="text-center">Tipo</th>
                    </tr>
                    <% 
                            ResultSet rs = citas.citasMedicasBuscar(fecha_inicio,fecha_final);
                              while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("fecha")%> </td>
                        <td class="text-center"><%=rs.getString("hora")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_paciente")%> </td>
                        <td class="text-center"><%=rs.getString("nombre_consulta")%> </td>
                        <td>
                            <a class="btn btn-warning btn-sm" href="GenerarInforme.jsp?codigo=<%=rs.getString("codigo")%>" name="eliminar">Generar informe.</a>
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
