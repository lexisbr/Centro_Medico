<%-- 
    Document   : VisualizarCitasIntervalo
    Created on : 7/10/2020, 19:52:55
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Funcionalidades.BuscadorInformes"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String codigo_lab = session.getAttribute("user").toString();
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorInformes informes = new BuscadorInformes();
    %>
    <section class="contenidoLex">
        <form action="" method="POST">
            <h2 class="titleLex">Informes realizados en intervalo</h2>
            <h2>Fecha inicio: <%=fecha_inicio %></h2><br>
            <h2>Fecha final: <%=fecha_final %></h2><br>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Cantidad de informes</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.pacienteCantidadInformesIntervalo(codigo_lab, fecha_inicio, fecha_final);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("fecha")%> </td>
                        <td class="text-center"><%=rs.getString("numero_informes")%> </td>
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
