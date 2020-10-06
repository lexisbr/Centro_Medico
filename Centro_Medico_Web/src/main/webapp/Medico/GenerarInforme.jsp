<%-- 
    Document   : GenerarInforme
    Created on : 6/10/2020, 02:08:24
    Author     : lex
--%>

<%@page import="Entidades.Informe_consulta"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <% try {
         LocalTime hora = LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute());
         String usuario = String.valueOf(session.getAttribute("user"));
         String codigo_cita = request.getParameter("codigo");
         CitasMedico cita = new CitasMedico(usuario);
         ResultSet rs = cita.citasMedicasBuscar(codigo_cita);
         while (rs.next()) { %>
         <section class="contenidoLex">
             <div class="container">
                 <h2 class="titleLex" >Registrar informe</h2>
                 <hr>
                 <div class="centrar">
                     <form action="../RegistrarInformeMedico" method="post" class="form-control" style="width: 500px; height: 750px; background: #ccccff;">
                         <div class="form-group">
                             <h1>Codigo de cita</h1>
                             <input type="text" readonly="" name="codigo_cita" class="form-control" value="<%= codigo_cita %>"/>
                         </div>
                         <div class="form-group">
                             <h1>Codigo de paciente</h1>
                             <input type="text" readonly="" name="codigo_paciente" class="form-control" value="<%= rs.getString("paciente_codigo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Codigo de medico</h1>
                             <input type="text" readonly="" class="form-control" name="codigo_medico" value="<%= rs.getString("medico_codigo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Codigo de consulta</h1>
                             <input type="text" readonly="" name="codigo_consulta" class="form-control" value="<%= rs.getString("consulta_codigo")%>"/>
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
                     }catch(Exception e) {
                        
                      }
                     
                     %>
                 </div>
             </div>
         </section>
    </body>
</html>
