<%-- 
    Document   : Visualizar10Fecha
    Created on : 7/10/2020, 20:39:05
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
        String codigo_lab = session.getAttribute("user").toString();
        String fecha_inicio = request.getParameter("fecha1");
        String fecha_final = request.getParameter("fecha2");
        BuscadorInformes informes = new BuscadorInformes();
    %>
    <section class="contenidoLex">
        <form action="" method="POST">
            <h2 class="titleLex">10 fechas con más informes realizados</h2>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Cantidad de informes</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.pacienteCantidadInformesFecha(codigo_lab);
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
