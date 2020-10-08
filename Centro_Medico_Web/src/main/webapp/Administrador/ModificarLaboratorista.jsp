<%-- 
    Document   : ModificarLaboratorista
    Created on : 4/10/2020, 05:32:04
    Author     : lex
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Laboratorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <%  String codigo_lab = request.getParameter("codigo");
          Laboratorista lab = new Laboratorista(codigo_lab);
          lab.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Laboratorista</h2>
              <hr>
              <div class="centrar">
                  <form action="../ModificarLab" method="post" class="form-control" style="width: 500px; height: 900px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=lab.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre</h1>
                          <input type="text" name="nombre" class="form-control" value="<%=lab.getNombre()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Numero de colegiado</h1>
                          <input type="number" name="numero_registro"  step="1" min="0" class="form-control" value="<%=lab.getNumero_registro()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>DPI</h1>
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" value="<%=lab.getDpi()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Telefono</h1>
                          <input type="number" name="telefono"  step="1" min="0" class="form-control" value="<%=lab.getTelefono()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Email</h1>
                          <input type="text" name="email" class="form-control" value="<%=lab.getEmail()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Fecha de inicio</h1>
                          <input type="date" name="fecha" value="<%=String.valueOf(lab.getFecha_inicio())%>" min="1900-01-01" max="<%= LocalDate.now()%>" required="">
                      </div><br><br>
                      <h1>Examen que realiza</h1>
                      <div class="div-examen">
                          <select class="seleccionar-examen" name="examen_codigo" style="margin-top: 15px;margin-bottom: 15px; left: -130px;" required="">
                      <%
                          try {
                                  int codigo_examen = lab.getExamen_laboratorio_codigo();
                                  BuscadorExamenes examen = new BuscadorExamenes();
                                  ResultSet rs1 = examen.buscadorCodigoSin(codigo_examen);
                                  ResultSet rs2 = examen.buscadorCodigoEspecifico(codigo_examen);
                                  while(rs2.next()){
                                    String nombre = rs2.getString("nombre");
                                    String codigo = String.valueOf(rs2.getInt("codigo"));
                                    %>
                                          <option value="<%=codigo%>"><%=nombre%></option>
                                  <%}
                                  while(rs1.next()){
                                    String nombre = rs1.getString("nombre");
                                    String codigo = String.valueOf(rs1.getInt("codigo"));
                                    %>
                                          <option value="<%=codigo%>"><%=nombre%></option>
                                  <%}
                                  

                              } catch (Exception e) {


                              }
                      %>
                           </select>
                      </div>
                      <div class="form-group">
                          <h1>Password</h1>
                          <input type="password" name="password" class="form-control" value="<%=lab.getPassword()%>" required=""/>
                      </div>
                      <input type="submit" name="boton" value="Guardar" class="guardar"/>
                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
