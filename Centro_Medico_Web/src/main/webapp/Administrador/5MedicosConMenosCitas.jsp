<%-- 
    Document   : 5MedicosConMenosCitas
    Created on : 8/10/2020, 02:26:48
    Author     : lex
--%>

<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="Funcionalidades.BuscadorInformes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorCitas citas = new BuscadorCitas();
    %>
    <section class="contenidoLex">
            <h2 class="titleLex">5 Medicos con menos citas</h2><br>
            <div class="wrap">
                <h2>Fecha inicio:<%=fecha_inicio%></h2>
                <h2>Fecha final:<%=fecha_final%></h2>
            </div>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Medico</th>
                        <th class="text-center">Cantidad de citas</th>
                    </tr>
                    <% try {
                            ResultSet rs = citas.cantidadCitasMedicas(fecha_inicio, fecha_final);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
                        <td class="text-center"><%=rs.getString("citas")%> </td>
                    </tr>
                    <% }
                        } catch (SQLException e) {
                            System.out.println("error " + e);

                        }
                    %>
                </table>
                <h2 class="titleLex" style="margin-top: 80px;">Medicos sin citas</h2><br>
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Medico</th>
                        <th class="text-center">Cantidad de citas</th>
                    </tr>
                    <% try {
                            ResultSet rs = citas.cantidadMedicosSinCitas();
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
                        <td class="text-center"><%=rs.getString("citas")%> </td>
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
