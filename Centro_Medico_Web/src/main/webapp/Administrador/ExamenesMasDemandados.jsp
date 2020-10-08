<%-- 
    Document   : ExamenesMasDemandados
    Created on : 8/10/2020, 03:04:45
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%@include file="Encabezado.html" %>
    <%
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorExamenes informes = new BuscadorExamenes();

    %>
    <section class="contenidoLex">
            <h2 class="titleLex">10 Medicos con más informes de consulta</h2><br>
            <div class="wrap">
                <h2>Fecha inicio:<%=fecha_inicio%></h2>
                <h2>Fecha final:<%=fecha_final%></h2>
            </div>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Examen</th>
                        <th class="text-center">Veces que se ha realizado</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.obtenerExamenesDemandados(fecha_inicio, fecha_final);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("examen")%> </td>
                        <td class="text-center"><%=rs.getString("cantidad")%> </td>
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
