<%-- 
    Document   : AgregarEspecialidad
    Created on : 8/10/2020, 05:19:53
    Author     : lex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.Medico"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!--Encabezado-->
    <%@include file="Encabezado.html" %>
    <% try {
            String codigo_medico = request.getParameter("codigo_medico");
            Medico medico = new Medico(codigo_medico);
            medico.consultarDatos();%>
    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Registrar nueva especialidad</h2>
            <hr>
            <div class="centrar">
                <form action="../AgregarEspecialidad" method="post" class="form-control" style="width: 500px; height: 450px; background: #ccccff;">
                    <div class="form-group">
                        <h1>Codigo de medico</h1>
                        <input type="text" readonly="" name="medico_codigo" class="form-control" value="<%= medico.getCodigo() %>"/>
                    </div>
                    <div class="form-group">
                        <h1>Nombre</h1>
                        <input type="text" readonly="" name="medico_nombre" class="form-control" value="<%= medico.getNombre() %>"/>
                    </div>
                    <div class="form-group">
                        <h1>Especialidad</h1>
                        <input type="text" class="form-control" name="especialidad" value="" required=""/>
                    </div>
                    <input type="submit" value="Guardar" class="guardar"/>

                </form>
<%                    } catch (Exception e) {

                    }

                %>
            </div>
        </div>
    </section>
    </body>
</html>
