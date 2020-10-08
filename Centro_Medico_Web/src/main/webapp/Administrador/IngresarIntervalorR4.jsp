<%-- 
    Document   : IngresarIntervalorR4
    Created on : 8/10/2020, 03:22:21
    Author     : lex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <!--Informacion de usuario-->
    <section class="contenidoLex">
        <form action="ExamenesMasDemandados.jsp">
            <h2 class="titleLex">Ingrese intervalo de tiempo</h2>
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
