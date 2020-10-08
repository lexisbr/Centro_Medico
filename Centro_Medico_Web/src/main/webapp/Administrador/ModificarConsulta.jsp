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
      <% int consulta_codigo = Integer.parseInt(request.getParameter("codigo"));
          
          Consulta consulta = new Consulta(consulta_codigo);
          consulta.consultarDatos();
      %>
     
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Consulta</h2>
              <hr>
              <div class="centrar">
                  <form action="../ModificarConsulta" method="post" class="form-control" style="width: 500px; height: 400px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=consulta.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Especialidad</h1>
                          <input type="text" readonly="" name="nombre_examen" class="form-control" value="<%=consulta.getNombre_especialidad()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Costo</h1>
                          <input type="number" name="costo"  id="costo" step="0.01" min="0" class="form-control" value="<%=consulta.getCosto()%>" required=""/>
                      </div>
                      <input type="submit" name="boton" value="Guardar" class="guardar" onclick="alerta()"/>
                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
