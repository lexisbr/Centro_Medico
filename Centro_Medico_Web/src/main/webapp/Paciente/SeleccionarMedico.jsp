<%-- 
    Document   : SeleccionarMedico
    Created on : 8/10/2020, 00:36:27
    Author     : lex
--%>

<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <!--Informacion de usuario-->
    <section class="contenidoLex">
        <h2 class="titleLex">Escoja al medico</h2>
        <form action="ConsultasConMedico.jsp">
            <div class="div-examen">
                <select class="seleccionar-examen" style="position: relative; right: -12px; margin-top: 30px;"name="codigo_medico" required="">
                    <%
                        try {
                            BuscadorMedico medico = new BuscadorMedico();
                            ResultSet rs = medico.mostrarMedicos();
                            while (rs.next()) {
                                String nombre = rs.getString("nombre");
                                String codigo = rs.getString("codigo");
                    %>
                    <option value="<%=codigo%>"><%=nombre%></option>
                    <%}
                        } catch (Exception e) {

                        }
                    %>
                </select>
            </div>
            <h2 class="titleLex" style="margin-top: 25px">Ingrese intervalo de tiempo</h2>
            <div style="display: block; margin-left: auto; margin-right: auto;">
                <h1 style="position: relative; bottom: 0px; margin-top: 10px; left: 30%;">Fecha inicio</h1>
                <input type="date" name="fecha1" value="" min="2000-01-01" max="2022-01-01" required="">
            </div>
            <div style="display: block; margin-left: auto; margin-right: auto;">
                <h1 style="position: relative; bottom: 0px; margin-top: 10px; left: 30%;">Fecha final</h1>
                <input type="date" name="fecha2" value="" min="2000-01-01" max="2022-01-01" required="">
            </div>
            <input type="submit" value="Ingresar" class="guardar" style="margin-top: 45px;"/>
        </form>
    </section>
</body>
</html>
