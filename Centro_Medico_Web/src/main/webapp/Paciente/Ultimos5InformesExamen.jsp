<%-- 
    Document   : Ultimos5InformesExamen
    Created on : 7/10/2020, 22:56:05
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
        BuscadorInformes informes = new BuscadorInformes();

    %>
    <section class="contenidoLex">
        <form action="CitasHoy.jsp" method="POST">
            <h2 class="titleLex">Ultimos 5 examenes realizados</h2><br>
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
                            ResultSet rs = informes.pacienteInformesExamenUltimos(codigo_paciente);
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
