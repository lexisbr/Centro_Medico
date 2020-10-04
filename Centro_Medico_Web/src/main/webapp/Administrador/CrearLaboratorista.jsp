<%-- 
    Document   : CrearLaboratorista
    Created on : 4/10/2020, 03:22:49
    Author     : lex
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Laboratorista"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page import="Entidades.Examen_laboratorio"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Registrar Laboratorista</h2>
              <hr>
              <div class="centrar">
                  <form action="" method="post" class="form-control" style="width: 500px; height: 900px; background: #ccccff;">
                      <div class="form-group">
                          <input type="text" name="codigo" class="form-control" placeholder="Codigo" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="nombre" class="form-control" placeholder="Nombre" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="numero_registro"  step="1" min="0" class="form-control" placeholder="Numero de registro de MSPAS" required=""/>
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
                           <h1 class="titulo_fecha">Fecha de inicio</h1>
                          <input type="date" name="fecha_inicio" value="" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div>
                      <div class="div-examen">
                          <select class="seleccionar-examen" name="examen" required="">
                              <option value="">Seleccione examen</option>
                      <%
                          try {
                                  BuscadorExamenes examen = new BuscadorExamenes();
                                  ResultSet rs = examen.mostrarExamenes();
                                  while(rs.next()){
                                    String nombre = rs.getString("nombre");
                                    String codigo = String.valueOf(rs.getInt("codigo"));
                                    %>
                                          <option value="<%=codigo%>"><%=nombre%></option>
                                  <%}
                              } catch (Exception e) {


                              }
                      %>
                           </select>
                      </div>
                      <div class="form-group">
                          <input type="password" name="password" class="form-control" placeholder="Password" required=""/>
                      </div>
                           <h1>Dias que trabaja</h1>
                        <div class="caja">
                           <input type="checkbox" name="LUNES" value="LUNES">
                           <label for="LUNES" style="position: relative; float: left;">Lunes</label>
                        </div>
                        <div class="caja">   
                            <input type="checkbox" name="MARTES" value="MARTES">
                           <label for="MARTES" style="position: relative; float: left;">Martes</label>
                        </div>
                        <div class="caja">
                           <input type="checkbox" name="MIERCOLES" value="MIERCOLES">
                           <label for="MIERCOLES" style="position: relative; float: left;">Miercoles</label>
                        </div>
                        <div class="caja">
                           <input type="checkbox" name="JUEVES" value="JUEVES">
                           <label for="JUEVES" style="position: relative; float: left;">Jueves</label>
                        </div>   
                        <div class="caja">   
                           <input type="checkbox" name="VIERNES" value="VIERNES" >
                           <label for="VIERNES" style="position: relative; float: left;">Viernes</label>
                        </div>   
                        <div class="caja">   
                           <input type="checkbox" name="SABADO" value="SABADO">
                           <label for="SABADO" style="position: relative; float: left;">Sabado</label>
                        </div>   
                        <div class="caja">   
                           <input type="checkbox" name="DOMINGO" value="DOMINGO">
                           <label for="DOMINGO" style="position: relative; float: left;">Domingo</label>
                        </div>


                      <%
                          try {
                              if (request.getParameter("guardar")!=null) {
                                  String codigo = request.getParameter("codigo");
                                  String nombre = request.getParameter("nombre");
                                  String numero_registro = request.getParameter("numero_registro");
                                  String dpi = request.getParameter("dpi");
                                  String telefono = request.getParameter("telefono");
                                  String email = request.getParameter("email");
                                  String fecha_inicio = request.getParameter("fecha_inicio");
                                  String password = request.getParameter("password");
                                  String examen = request.getParameter("examen");
                                  Laboratorista lab = new Laboratorista(codigo, nombre, numero_registro, dpi, telefono, email,LocalDate.parse(fecha_inicio), password,examen);
                                  lab.insertarLaboratorista();
                                  
                                  ArrayList dias_trabajo = new ArrayList();
                                  if (request.getParameter("LUNES") != null) {
                                          dias_trabajo.add("Lunes");
                                      }
                                  if (request.getParameter("MARTES") != null) {
                                          dias_trabajo.add("Martes");
                                      }
                                  if (request.getParameter("MIERCOLES") != null) {
                                          dias_trabajo.add("Miercoles");
                                      }
                                  if (request.getParameter("JUEVES") != null) {
                                          dias_trabajo.add("Jueves");
                                      }
                                  if (request.getParameter("VIERNES") != null) {
                                          dias_trabajo.add("Viernes");
                                      }
                                  if (request.getParameter("SABADO") != null) {
                                          dias_trabajo.add("Sabado");
                                      }
                                  if (request.getParameter("DOMINGO") != null) {
                                          dias_trabajo.add("Domingo");
                                      }
                                  lab.generarDias(dias_trabajo, codigo);
                                      %>
                                       <div class="mensaje-exito">
                                            <h1>Laboratorista registrado con exito</h1>
                                        </div>
                                 <% }
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
