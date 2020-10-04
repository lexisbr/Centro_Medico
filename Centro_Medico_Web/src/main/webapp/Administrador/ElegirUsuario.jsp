<%-- 
    Document   : ElegirUsuario
    Created on : 3/10/2020, 15:37:15
    Author     : lex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <section class="contenidoLex">
        <div class="seleccionar-usuario">
            <a type="submit" href="CrearPaciente.jsp" name="crear" role="button">Crear Paciente</a><br><br>
                <a type="submit" href="CrearMedico.jsp" name="crear" role="button">Crear Medico</a><br><br>
                <a type="submit" href="CrearLaboratorista.jsp" name="crear" role="button">Crear Laboratorista</a><br><br>
                <a type="submit" href="CrearAdmin.jsp" name="crear" role="button">Crear Administrador</a>
        </div>
    </section>
    </body>
</html>
