<%-- 
    Document   : GenerarInformeExamen
    Created on : 7/10/2020, 18:15:16
    Author     : lex
--%>

<%@page import="Funcionalidades.CitasLab"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasMedico"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <%@include file="Encabezado.html" %>
    <% try {
            LocalTime hora = LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute());
            String codigo_lab = String.valueOf(session.getAttribute("user"));
            String codigo_cita = request.getParameter("codigo");
            CitasLab cita = new CitasLab(codigo_lab);
            ResultSet rs = cita.citasExamenBuscarEspecifico(codigo_cita);
              while (rs.next()) {%>
    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Registrar informe</h2>
            <hr>
            <div class="centrar">
                <form action="../GenerarInformeExamen" method="post" class="form-control" style="width: 500px; height: 750px; background: #ccccff;">
                    <div class="form-group">
                        <h1>Codigo de cita</h1>
                        <input type="text" readonly="" name="codigo_cita" class="form-control" value="<%= codigo_cita%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Codigo de paciente</h1>
                        <input type="text" readonly="" name="paciente_codigo" class="form-control" value="<%= rs.getString("codigo_paciente")%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Codigo de laboratorista</h1>
                        <input type="text" readonly="" class="form-control" name="lab_codigo" value="<%= codigo_lab %>"/>
                    </div>
                    <div class="form-group">
                        <h1>Codigo de examen</h1>
                        <input type="text" readonly="" name="examen_codigo" class="form-control" value="<%= rs.getString("codigo_examen")%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Fecha</h1>
                        <input type="date" name="fecha" readonly="" value="<%=LocalDate.now()%>" min="" max="" required="">
                    </div>
                    <div class="form-group">
                        <h1 style="position: relative; float: left; bottom: 40px; left: 42px;">Hora</h1>
                        <input type="text" readonly="" name="hora" class="form-control" style="width: 100px; position: relative; bottom: 16px;" value="<%= hora.toString()%>"/>
                    </div>    
                    <div class="form-group">
                        <textarea name="descripcion" class="textarea" rows="5" cols="40" style="width: 100%;" placeholder="Descripcion" required=""></textarea>
                    </div>
                    <input type="submit" value="Guardar" class="guardar"/>

                </form>
                <% }
                    } catch (Exception e) {

                    }

                %>
            </div>
        </div>
    </section>
</body>
</html>
