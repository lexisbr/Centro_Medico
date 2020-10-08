<%-- 
    Document   : InformesTipo
    Created on : 8/10/2020, 00:00:16
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorInformes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String codigo_paciente = String.valueOf(session.getAttribute("user"));
        String codigo_examen = request.getParameter("codigo_examen");
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorInformes informes = new BuscadorInformes();

    %>
    <section class="contenidoLex">
        <form action="CitasHoy.jsp" method="POST">
            <h2 class="titleLex">Examenes realizados</h2><br>
            <div class="wrap">
                <h2>Fecha inicio:<%=fecha_inicio%></h2>
                <h2>Fecha final:<%=fecha_final%></h2>
            </div>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Examen</th>
                        <th class="text-center">Codigo de Laboratorista</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.pacienteInformesExamenTipo(codigo_paciente,codigo_examen,fecha_inicio,fecha_final);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("descripcion")%> </td>
                        <td class="text-center"><%=rs.getString("fecha")%> </td>
                        <td class="text-center"><%=rs.getString("hora")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
                        <td class="text-center"><%=rs.getString("laboratorista_codigo")%> </td>
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
