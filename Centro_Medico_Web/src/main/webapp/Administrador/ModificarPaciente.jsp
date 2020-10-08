<%-- 
    Document   : ModificarPaciente
    Created on : 3/10/2020, 19:22:24
    Author     : lex
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <% String codigo_paciente = request.getParameter("codigo");
          
          Paciente paciente = new Paciente(codigo_paciente);
          paciente.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Paciente</h2>
              <hr>
              <div class="centrar">
                  <form action="../ModificarPaciente" method="post" class="form-control" style="width: 500px; height: 1000px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=paciente.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre</h1>
                          <input type="text" name="nombre" class="form-control" value="<%=paciente.getNombre() %>" required=""/>
                      </div>
                      <h1>Sexo</h1>
                      <select class="sexo" name="sexo">
                         <% if(paciente.getSexo().equals("MASCULINO")){%>
                              <option value="MASCULINO" >Masculino</option>
                              <option value="FEMENINO">Femenino</option>
                         <%}else{%>
                              <option value="FEMENINO">Femenino</option>
                              <option value="MASCULINO" >Masculino</option>
                         <%}%>
                      </select>
                      <div class="form-group">
                          <h1>Fecha de nacimiento</h1>
                           <input type="date" name="fecha" value="<%=String.valueOf(paciente.getFecha_nacimiento())%>" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div><br><br>
                      <div class="form-group">
                          <h1>DPI</h1>
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" value="<%=paciente.getDpi()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Telefono</h1>
                          <input type="number" name="telefono"  step="1" min="0" class="form-control" value="<%=paciente.getTelefono()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Peso</h1>
                          <input type="number" name="peso"  step="1" min="0" class="form-control" value="<%=paciente.getTelefono()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Tipo de sangre</h1>
                          <input type="text" name="sangre" class="form-control" value="<%=paciente.getTipo_sangre()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Email</h1>
                          <input type="text" name="email" class="form-control" value="<%=paciente.getEmail()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Password</h1>
                          <input type="password" name="password" class="form-control" value="<%=paciente.getPassword()%>" required=""/>
                      </div>
                      <input type="submit" name="boton" value="Guardar" class="guardar"/>
                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
