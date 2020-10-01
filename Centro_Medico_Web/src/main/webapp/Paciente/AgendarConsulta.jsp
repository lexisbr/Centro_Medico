<%-- 
    Document   : AgendarCita
    Created on : 30/09/2020, 02:56:58
    Author     : lex
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="Funcionalidades.BuscadorMedico"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        
       <!--Encabezado-->
      <%@include file="Encabezado.html" %>
      <% try {
         String usuario = String.valueOf(session.getAttribute("user"));
         String codigo = request.getParameter("codigo");
         BuscadorMedico medico = new BuscadorMedico();
         ResultSet rs = medico.selectMedico(codigo);
         while (rs.next()) { %>
         <section class="contenidoLex">
             <div class="container">
                 <h2 class="titleLex" >Registrar Cita</h2>
                 <hr>
                 <div class="centrar">
                     <form action="" method="post" class="form-control" style="width: 500px; height: 700px; background: #ccccff;">
                         <div class="form-group">
                             <h1>Codigo de medico</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("codigo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Nombre de medico</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("nombre")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Especialidad</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("especialidad_nombre")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Precio de consulta</h1>
                             <input type="text" readonly="" class="form-control" value="<%= rs.getString("costo")%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Codigo de Paciente</h1>
                             <input type="text" readonly="" class="form-control" value="<%= usuario%>"/>
                         </div>
                         <div class="form-group">
                             <h1>Fecha</h1>
                             <input type="date" id="start" name="trip-start" value="<%=LocalDate.now()%>" min="2018-01-01" max="2022-01-01">
                             <input type="submit" value="Verificar disponibilidad" class="btn btn-outline-info"/>
                         </div>
                         <div class="form-group">
                             <select class="custom-select">
                                 <option selected>Seleccione hora</option>
                                 <option value="1">One</option>
                             </select>
                         </div>

                         <br>
                         <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
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
