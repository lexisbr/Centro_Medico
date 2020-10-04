<%-- 
    Document   : CrearMedico
    Created on : 3/10/2020, 22:10:25
    Author     : lex
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="Entidades.Medico"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Registrar Medico</h2>
              <hr>
              <div class="centrar">
                  <form action="" method="post" class="form-control" style="width: 500px; height: 800px; background: #ccccff;">
                      <div class="form-group">
                          <input type="text" name="codigo" class="form-control" placeholder="Codigo" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="nombre" class="form-control" placeholder="Nombre" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="numero_colegiado"  step="1" min="0" class="form-control" placeholder="Numero de colegiado" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" placeholder="DPI" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="telefono"  step="1" min="0" class="form-control" placeholder="Telefono" required=""/>
                      </div>
                       <div class="form-group">
                          <input type="email" name="email" class="form-control" placeholder="Email" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="especialidad" class="form-control" placeholder="Especialidad" required=""/>
                      </div>
                       <div class="form-hora">
                            <h1>Hora de entrada</h1>
                          <input type="time" class="hora" id="appt" value="00:00" name="hora_entrada" required>
                        </div> 
                      
                       <div class="form-hora1">   
                            <h1>Hora de salida</h1>
                          <input type="time" class="hora" id="appt" value="00:00" name="hora_salida" required>
                       </div><br>
                      <div class="form-group">
                           <h1 class="titulo_fecha">Fecha de inicio</h1>
                          <input type="date" name="fecha_inicio" value="" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div>
                      <div class="form-group">
                          <input type="password" name="password" class="form-control" placeholder="Password" required=""/>
                      </div>


                      <%
                          try {
                              if (request.getParameter("guardar")!=null) {
                                  String codigo = request.getParameter("codigo");
                                  String nombre = request.getParameter("nombre");
                                  String numero_colegiado = request.getParameter("numero_colegiado");
                                  String dpi = request.getParameter("dpi");
                                  String telefono = request.getParameter("telefono");
                                  String email = request.getParameter("email");
                                  String hora_entrada = request.getParameter("hora_entrada");
                                  String hora_salida = request.getParameter("hora_salida");
                                  String fecha_inicio = request.getParameter("fecha_inicio");
                                  String password = request.getParameter("password");
                                  String especialidad = request.getParameter("especialidad");
                                  
                                  LocalTime horaEntradaIngresada = LocalTime.parse(hora_entrada);
                                  LocalTime horaSalidaIngresada = LocalTime.parse(hora_salida);
                                  
                                  if((horaEntradaIngresada.isBefore(horaSalidaIngresada))){
                                      Medico medico = new Medico(codigo, nombre, numero_colegiado, dpi, telefono, email, horaEntradaIngresada, horaSalidaIngresada, LocalDate.parse(fecha_inicio), password,especialidad);
                                      medico.insertarMedico();
                                      %>
                                       <div class="mensaje-exito">
                                            <h1>Medico registrado con exito</h1>
                                        </div>
                      
                                 <% }else{ %>
                                    <h3>No ingreso correctamente las horas</h3>
                                  <%} %>
                      <%        }

                          } catch (Exception e) {
                                System.out.println("error " +e);
                          }
                      %>
                      
                      <input type="submit" value="Guardar" class="guardar" name="guardar"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
