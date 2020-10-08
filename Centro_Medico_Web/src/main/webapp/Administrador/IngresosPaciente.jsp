<%-- 
    Document   : IngresosPaciente
    Created on : 8/10/2020, 04:12:08
    Author     : lex
--%>

<%@page import="Funcionalidades.BuscadorPaciente"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorPaciente informes = new BuscadorPaciente();

    %>
    <section class="contenidoLex">
        <h2 class="titleLex">Ingresos obtenidos por paciente</h2><br>
        <div class="wrap">
            <h2>Fecha inicio:<%=fecha_inicio%></h2>
            <h2>Fecha final:<%=fecha_final%></h2>
        </div>
        <div class="container">
            <table class="table table-dark table-bordered">
                <tr>
                    <th class="text-center">Codigo</th>
                    <th class="text-center">Paciente</th>
                    <th class="text-center">Ingresos generados</th>
                </tr>
                <% try {
                        ResultSet rs = informes.mostrarIngresos(fecha_inicio, fecha_final);
                        while (rs.next()) {%>
                <tr>
                    <td class="text-center"><%=rs.getString("codigo")%> </td>
                    <td class="text-center"><%=rs.getString("paciente")%> </td>
                    <td class="text-center"><%=rs.getString("ingresos")%> </td>
                </tr>
                <% }
                    } catch (SQLException e) {
                        System.out.println("error " + e);

                    }
                %>
            </table>
        </div>
    </section>
</body>
</html>
