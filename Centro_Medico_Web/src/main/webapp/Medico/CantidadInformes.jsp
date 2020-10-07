<%-- 
    Document   : CantidadInformes
    Created on : 7/10/2020, 06:58:03
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Funcionalidades.BuscadorInformes"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String fecha_inicio= request.getParameter("fecha1");
        String fecha_final= request.getParameter("fecha2");
        String codigo_medico = session.getAttribute("user").toString();
        BuscadorInformes informes = new BuscadorInformes(codigo_medico);

    %>
    <section class="contenidoLex">
        <form action="CitasHoy.jsp" method="POST">
            <h2 class="titleLex">Pacientes con más informes medicos</h2><br>
             <div class="wrap">
                <h2>Fecha inicio:<%=fecha_inicio%></h2>
                <h2>Fecha final:<%=fecha_final%></h2>
            </div>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">DPI</th>
                        <th class="text-center">Cantidad Informes</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.pacienteCantidadInformes(fecha_inicio,fecha_final);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
                        <td class="text-center"><%=rs.getString("dpi")%> </td>
                        <td class="text-center"><%=rs.getString("informes")%> </td>
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
