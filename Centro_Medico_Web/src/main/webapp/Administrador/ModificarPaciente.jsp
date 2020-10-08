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
      <script>
          
        function alerta() {
            alert("Actualizado con exito");
        }
      </script>
      <% String codigo_paciente;
          
          try {
               codigo_paciente = request.getParameter("codigo");
               
          } catch (Exception e) {
               codigo_paciente = String.valueOf(session.getAttribute("codigo_paciente"));
               System.out.println("entra aqui "+codigo_paciente);
          }
          if(codigo_paciente==null){
              codigo_paciente = String.valueOf(session.getAttribute("codigo_paciente"));
               System.out.println("entra aqui "+codigo_paciente);
          }
         
          
          Paciente paciente = new Paciente(codigo_paciente);
          paciente.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Paciente</h2>
              <hr>
              <div class="centrar">
                  <form action="ModificarPaciente.jsp" method="post" class="form-control" style="width: 500px; height: 1000px; background: #ccccff;">
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


                      <% 
                          try {
                               if (request.getParameter("boton")!=null&&request.getParameter("codigo") != null && request.getParameter("nombre") != null && !request.getParameter("sexo").equals("null") && request.getParameter("fecha") != null && request.getParameter("dpi") != null && request.getParameter("peso") != null && request.getParameter("sangre") != null && request.getParameter("email") != null && request.getParameter("password") != null) {
                                  String nombre = request.getParameter("nombre");
                                  String sexo = request.getParameter("sexo");
                                  String fecha_nacimiento = request.getParameter("fecha");
                                  String dpi = request.getParameter("dpi");
                                  String telefono = request.getParameter("telefono");
                                  String peso = request.getParameter("peso");
                                  String tipo_sangre = request.getParameter("sangre");
                                  String email = request.getParameter("email");
                                  String password = request.getParameter("password");
                                  
                                  paciente.setNombre(nombre);
                                  paciente.setSexo(sexo);
                                  paciente.setFecha_nacimiento(LocalDate.parse(fecha_nacimiento));
                                  paciente.setDpi(dpi);
                                  paciente.setTelefono(telefono);
                                  paciente.setPeso(peso);
                                  paciente.setTipo_sangre(tipo_sangre);
                                  paciente.setEmail(email);
                                  paciente.setPassword(password);
                                  paciente.actualizarPaciente();
                                  
                                  %>
                                  <div class="mensaje-exito">
                                      <h1>Examen actualizado con exito</h1>
                                  </div>
                                  
                                  <%  
                                      response.sendRedirect("ModificarPaciente.jsp");
                                      session.setAttribute("codigo_paciente",paciente.getCodigo());
                                       System.out.println(codigo_paciente);
                                    
                                      
                              }

                          } catch (Exception e) {
                          }
                      %>
                      <input type="submit" name="boton" value="Guardar" class="guardar" onclick="alerta()"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
