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
      <script>
        function alerta() {
            alert("Actualizado con exito");
        }
      </script>
      <% String codigo_medico;
          
          try {
               codigo_medico = request.getParameter("codigo");
               
          } catch (Exception e) {
               codigo_medico = String.valueOf(session.getAttribute("codigo_medico"));
          }
          if(codigo_medico==null){
              codigo_medico = String.valueOf(session.getAttribute("codigo_medico"));
          }
          System.out.println(codigo_medico);
          
          Medico medico = new Medico(codigo_medico);
          medico.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Examen</h2>
              <hr>
              <div class="centrar">
                  <form action="ModificarMedico.jsp" method="post" class="form-control" style="width: 500px; height: 850px; background: #ccccff;">
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


                      <%
                          try {
                              if (request.getParameter("boton") != null) {
                                  String nombre = request.getParameter("nombre");
                                  String numero_colegiado = request.getParameter("numero_colegiado");
                                  String dpi = request.getParameter("dpi");
                                  String telefono = request.getParameter("telefono");
                                  String email = request.getParameter("email");
                                  String hora_entrada = request.getParameter("hora_entrada");
                                  String hora_salida = request.getParameter("hora_salida");
                                  String fecha = request.getParameter("fecha");
                                  String password = request.getParameter("password");
                                  
                                  LocalTime horaEntradaIngresada = LocalTime.parse(hora_entrada);
                                  LocalTime horaSalidaIngresada = LocalTime.parse(hora_salida);
                                  
                                  if((horaEntradaIngresada.isBefore(horaSalidaIngresada))){
                                    medico.setNombre(nombre);
                                    medico.setNumero_colegiado(numero_colegiado);
                                    medico.setDpi(dpi);
                                    medico.setTelefono(telefono);
                                    medico.setEmail(email);
                                    medico.setHora_entrada(LocalTime.parse(hora_entrada));
                                    medico.setHora_salida(LocalTime.parse(hora_salida));
                                    medico.setFecha_inicio(LocalDate.parse(fecha));
                                    medico.setPassword(password);


                                    medico.actualizarMedico();  

                                    
                                      %>
                                       <div class="mensaje-exito">
                                            <h1>Medico registrado con exito</h1>
                                        </div>
                      
                                 <% response.sendRedirect("ModificarMedico.jsp");
                                    session.setAttribute("codigo_medico", medico.getCodigo());

                                     
                                    }else{ %>
                                    <h3>No ingreso correctamente las horas</h3>
                                  <%} 
                              }
                          } catch (Exception e) {
                            System.out.println("Error "+e);
                          }
                      %>
                      <input type="submit" name="boton" value="Guardar" class="guardar" onclick="alerta()"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
