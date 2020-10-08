<%-- 
    Document   : VisualizarInformesHoy
    Created on : 7/10/2020, 19:54:52
    Author     : lex
--%>

<%@page import="Funcionalidades.BuscadorInformes"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <%
        String codigo_lab = session.getAttribute("user").toString();
        String fecha = LocalDate.now().toString();
        BuscadorInformes informes = new BuscadorInformes();
    %>
    <section class="contenidoLex">
        <form action="" method="POST">
            <h2 class="titleLex">Informes realizados hoy</h2>
            <h2><%=LocalDate.now()%></h2><br>

            <div class="container">
                <table class="table table-dark table-bordered">
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Paciente</th>
                    </tr>
                    <% try {
                            ResultSet rs = informes.pacienteInformesExamenHoy(codigo_lab, fecha);
                            while (rs.next()) {%>
                    <tr>
                        <td class="text-center"><%=rs.getString("codigo")%> </td>
                        <td class="text-center"><%=rs.getString("descripcion")%> </td>
                        <td class="text-center"><%=rs.getString("hora")%> </td>
                        <td class="text-center"><%=rs.getString("paciente_codigo")%> </td>
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
