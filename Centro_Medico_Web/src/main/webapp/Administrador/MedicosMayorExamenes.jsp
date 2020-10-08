<%-- 
    Document   : MedicosMayorExamenes
    Created on : 8/10/2020, 03:48:14
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%@include file="Encabezado.html" %>
    <%
        BuscadorMedico informes = new BuscadorMedico();

    %>
    <section class="contenidoLex">
            <h2 class="titleLex">Medicos con mas ordenes requeridas</h2><br>
            <div class="wrap">
            </div>
            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Medico</th>
                        <th class="text-center">Examen</th>
                        <th class="text-center">Cantidad de ordenes</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.medicosOrdenes();
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("medico")%> </td>
                        <td class="text-center"><%=rs.getString("nombre")%> </td>
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
