<%-- 
    Document   : CrearPaciente
    Created on : 3/10/2020, 15:52:51
    Author     : lex
--%>

<%@page import="Entidades.Paciente"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Registrar Paciente</h2>
              <hr>
              <div class="centrar">
                  <form action="" method="post" class="form-control" style="width: 500px; height: 750px; background: #ccccff;">
                      <div class="form-group">
                          <input type="text" name="codigo" class="form-control" placeholder="Codigo" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="nombre" class="form-control" placeholder="Nombre" required=""/>
                      </div>
                      <select class="sexo" name="sexo" required="">
                              <option value="">Sexo</option>
                              <option value="MASCULINO">Masculino</option>
                              <option value="FEMENINO">Femenino</option>
                      </select>
                      <div class="form-group">
                           <h1>Fecha de nacimiento</h1>
                          <input type="date" name="fecha" value="" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div>
                      <div class="form-group">
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" placeholder="DPI" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="telefono"  step="1" min="0" class="form-control" placeholder="Telefono" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="peso"  step="1" min="0" class="form-control" placeholder="Peso (Kg)" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="sangre" class="form-control" placeholder="Tipo de sangre" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="email" name="email" class="form-control" placeholder="Email" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="password" name="password" class="form-control" placeholder="Password" required=""/>
                      </div>


                      <%
                          try {
                              if (request.getParameter("codigo") != null && request.getParameter("nombre") != null && !request.getParameter("sexo").equals("null") && request.getParameter("fecha") != null && request.getParameter("dpi") != null && request.getParameter("peso") != null && request.getParameter("sangre") != null && request.getParameter("email") != null && request.getParameter("password") != null) {
                                  String codigo = request.getParameter("codigo");
                                  String nombre = request.getParameter("nombre");
                                  String sexo = request.getParameter("sexo");
                                  String fecha_nacimiento = request.getParameter("fecha");
                                  String dpi = request.getParameter("dpi");
                                  String telefono = request.getParameter("telefono");
                                  String peso = request.getParameter("peso");
                                  String tipo_sangre = request.getParameter("sangre");
                                  String email = request.getParameter("email");
                                  String password = request.getParameter("password");
                                  
                                  Paciente paciente = new Paciente(codigo, nombre, sexo, LocalDate.parse(fecha_nacimiento), dpi, telefono, peso, tipo_sangre, email, password);
                                  paciente.insertarPaciente();

                      %>
                      <div class="mensaje-exito">
                          <h1>Paciente registrado con exito</h1>
                      </div>
                      
                      <%                              }

                          } catch (Exception e) {
                          }
                      %>
                      
                      <input type="submit" value="Guardar" class="guardar"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
