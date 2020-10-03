<%-- 
    Document   : ModificarConsulta
    Created on : 3/10/2020, 05:40:45
    Author     : lex
--%>

<%@page import="Entidades.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <% int consulta_codigo;
          
          try {
               consulta_codigo = Integer.parseInt(request.getParameter("codigo"));
          } catch (Exception e) {
              String codigo = String.valueOf(session.getAttribute("codigo_consulta"));
               consulta_codigo = Integer.parseInt(codigo);
          }
          
          
          
          Consulta consulta = new Consulta(consulta_codigo);
          consulta.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Consulta</h2>
              <hr>
              <div class="centrar">
                  <form action="ModificarConsulta.jsp" method="post" class="form-control" style="width: 500px; height: 400px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=consulta.getCodigo()%>"/>
                      </div>
                      <div class="form-group">
                          <h1>Especialidad</h1>
                          <input type="text" readonly="" name="nombre_examen" class="form-control" value="<%=consulta.getNombre_especialidad()%>"/>
                      </div>
                      <div class="form-group">
                          <h1>Costo</h1>
                          <input type="number" name="costo"  step="0.01" min="0" class="form-control" value="<%=consulta.getCosto()%>"/>
                      </div>

                      <% boolean resultado;
                          try {
                              Double.parseDouble(request.getParameter("costo"));
                              resultado = true;
                          } catch (Exception excepcion) {
                              resultado = false;
                          }
                          
                          try {
                              if (request.getParameter("boton")!=null&&resultado&&request.getParameter("costo")!=null) {
                                  String costo = request.getParameter("costo");
                                  
                                  consulta.setCosto(Double.parseDouble(costo));
                                  consulta.actualizarConsulta();
                                  %>
                                  <h1>Examen se ha actualizado</h1>
                                  
                                  <%  
                                      response.sendRedirect("ModificarConsulta.jsp");
                                      session.setAttribute("codigo_consulta",request.getParameter("codigo"));
                              }

                          } catch (Exception e) {
                          }
                      %>
                      <input type="submit" name="boton" value="Guardar" class="guardar"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>