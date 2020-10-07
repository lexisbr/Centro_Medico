<%-- 
    Document   : ConfirmarCita
    Created on : 7/10/2020, 04:38:08
    Author     : lex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="Entidades.Cita_medica"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Consulta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <% try {
         String codigo_medico = request.getParameter("codigo_medico");
         String codigo_paciente = request.getParameter("codigo_paciente");
         BuscadorMedico medico = new BuscadorMedico();
         ResultSet rs = medico.selectMedico(codigo_medico);
         while (rs.next()) { %>
         <section class="contenidoLex">
             <div class="container">
                 <h2 class="titleLex" >Registrar Cita</h2>
                 <hr>
                 <div class="centrar">
                     <form action="../AgendarCitaMedica" method="post" class="form-control" style="width: 500px; height: 750px; background: #ccccff;">
                         <div class="form-group">
                             <h1>Codigo de medico</h1>
                             <input type="text" readonly="" name="codigo_medico" class="form-control" value="<%= rs.getString("codigo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Nombre de medico</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("nombre")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Especialidad</h1>
                             <input type="text" readonly="" name="nombre_especialidad" class="form-control" value="<%= rs.getString("especialidad_nombre")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Precio de consulta</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("costo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Codigo de Paciente</h1>
                             <input type="text" readonly=""  name="codigo_paciente" class="form-control" value="<%= codigo_paciente%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Fecha</h1>
                             <input type="date" name="fecha" value="<%=request.getParameter("fecha")%>" readonly="" min="2018-01-01" max="2022-01-01" required="">
                         </div>
                         <div class="form-group">
                             <select class="custom-select" name="tiempo">
                                 <%
                                     String fecha = request.getParameter("fecha");
                                     BuscadorCitas busc = new BuscadorCitas("codigo1",Date.valueOf(fecha));
                                     ArrayList horasDisponibles = new ArrayList(busc.citasMedicasDisponibles());

                                     for (int i = 0; i < horasDisponibles.size(); i++) {%>
                                     <option value="<%=horasDisponibles.get(i)%>"><%=horasDisponibles.get(i)%></option>
                                    <% }
                                 %>
                             </select>
                         </div>
                             <input type="submit" value="Guardar" class="guardar"/>
                     </form>
                     <% }
                     }catch(Exception e) {
                        
                      }
                     
                     %>
                 </div>
             </div>
         </section>
    </body>
</html>
