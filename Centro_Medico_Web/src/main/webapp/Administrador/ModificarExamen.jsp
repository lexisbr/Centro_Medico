<%-- 
    Document   : ModificarExamen
    Created on : 3/10/2020, 01:43:03
    Author     : lex
--%>

<%@page import="Entidades.Examen_laboratorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <% 
          int examen_codigo = Integer.parseInt(request.getParameter("codigo"));
          
          Examen_laboratorio examen = new Examen_laboratorio(examen_codigo);
          examen.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Examen</h2>
              <hr>
              <div class="centrar">
                  <form action="../ModificarExamen" method="post" class="form-control" style="width: 500px; height: 740px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=examen.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre de examen</h1>
                          <input type="text" name="nombre_examen" class="form-control" value="<%=examen.getNombre() %>" required=""/>
                      </div>
                      <div class="radios" data-toggle="buttons">
                          <h1>Requiere orden</h1>
                          <%if(examen.isRequiere_orden()){%>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="true" autocomplete="off" checked>Si
                          </label>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="false" autocomplete="off" >No
                          </label>
                          
                          <%}else{%>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="true" autocomplete="off">Si
                          </label>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="false" autocomplete="off" checked>No
                          </label>

                          <%}                         
                          %>
                          
                      </div>
                      <div class="form-group">
                          <h1>Descripcion</h1>
                          <textarea name="descripcion" class="textarea" rows="5" cols="40" style="width: 100%;" value="" required=""><%=examen.getDescripcion()%></textarea>
                      </div>
                      <div class="form-group">
                          <h1>Costo</h1>
                          <input type="number" name="costo"  step="0.01" min="0" class="form-control" value="<%=examen.getCosto()%>" required=""/>
                      </div>
                      <div class="form-group">
                           <h1>Tipo de Archivo</h1>
                          <input type="text" name="tipo_archivo" class="form-control" value="<%= examen.getTipo_archivo()%>" required=""/>
                      </div>
                      <input type="submit" name="boton" value="Guardar" class="guardar"/>
                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
