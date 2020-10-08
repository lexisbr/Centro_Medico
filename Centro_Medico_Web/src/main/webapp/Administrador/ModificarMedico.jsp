<%-- 
    Document   : ModificarMedico
    Created on : 4/10/2020, 01:47:16
    Author     : lex
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <%  String codigo_medico = request.getParameter("codigo");
          
          System.out.println(codigo_medico);
          Medico medico = new Medico(codigo_medico);
          medico.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Medico</h2>
              <hr>
              <div class="centrar">
                  <form action="../ModificarMedico" method="post" class="form-control" style="width: 500px; height: 850px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=medico.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre</h1>
                          <input type="text" name="nombre" class="form-control" value="<%=medico.getNombre()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Numero de colegiado</h1>
                          <input type="number" name="numero_colegiado"  step="1" min="0" class="form-control" value="<%=medico.getNumero_colegiado()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>DPI</h1>
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" value="<%=medico.getDpi()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Telefono</h1>
                          <input type="number" name="telefono"  step="1" min="0" class="form-control" value="<%=medico.getTelefono()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Email</h1>
                          <input type="text" name="email" class="form-control" value="<%=medico.getEmail()%>" required=""/>
                      </div>
                      <div class="form-hora">
                          <h1>Hora de entrada</h1>
                          <input type="time" class="hora" id="appt" value="<%=String.valueOf(medico.getHora_entrada())%>" name="hora_entrada" required>
                      </div> 
                      <div class="form-hora1">   
                          <h1>Hora de salida</h1>
                          <input type="time" class="hora" id="appt" value="<%=String.valueOf(medico.getHora_salida())%>" name="hora_salida" required>
                      </div>
                      <div class="form-group">
                          <h1>Fecha de inicio</h1>
                          <input type="date" name="fecha" value="<%=String.valueOf(medico.getFecha_inicio())%>" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div>
                      <div class="form-group">
                          <h1>Password</h1>
                          <input type="password" name="password" class="form-control" value="<%=medico.getPassword()%>" required=""/>
                      </div>
                      <input type="submit" name="boton" value="Guardar" class="guardar"/>
                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
