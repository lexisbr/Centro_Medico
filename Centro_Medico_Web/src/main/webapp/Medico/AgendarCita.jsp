<%-- 
    Document   : AgendarCita
    Created on : 7/10/2020, 04:30:16
    Author     : lex
--%>

<%@page import="Entidades.Cita_medica"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Consulta"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <% try {
         String codigo_medico = String.valueOf(session.getAttribute("user"));
         String codigo_paciente = request.getParameter("codigo_paciente");
         BuscadorMedico medico = new BuscadorMedico();
         System.out.println("codigo medico "+codigo_medico);
         ResultSet rs = medico.selectMedico(codigo_medico);
         while (rs.next()) { %>
         <section class="contenidoLex">
             <div class="container">
                 <h2 class="titleLex" >Registrar Cita</h2>
                 <hr>
                 <div class="centrar">
                     <form action="ConfirmarCita.jsp" method="post" class="form-control" style="width: 500px; height: 550px; background: #ccccff;">
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
                             <input type="date" name="fecha" value="" min="2018-01-01" max="2022-01-01" required="">
                             <button type="submit" class="btn btn-outline-info" name="fecha_ingresada">Verificar disponibilidad</button>
                         </div>
                     </form>
                     <% }
                     }catch(Exception e) {
                        System.out.println("error jsp "+e);
                        
                      }
                     
                     %>
                 </div>
             </div>
         </section>
    </body>
</html>
