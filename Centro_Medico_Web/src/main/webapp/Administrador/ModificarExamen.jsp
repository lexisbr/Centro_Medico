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
      <% int examen_codigo;
          
          try {
               examen_codigo = Integer.parseInt(request.getParameter("codigo"));
          } catch (Exception e) {
              String codigo = String.valueOf(session.getAttribute("codigo_examen"));
               examen_codigo = Integer.parseInt(codigo);
          }
          
          
          
          Examen_laboratorio examen = new Examen_laboratorio(examen_codigo);
          examen.consultarDatos();
      %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Examen</h2>
              <hr>
              <div class="centrar">
                  <form action="ModificarExamen.jsp" method="post" class="form-control" style="width: 500px; height: 740px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=examen.getCodigo()%>"/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre de examen</h1>
                          <input type="text" name="nombre_examen" class="form-control" value="<%=examen.getNombre() %>"/>
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
                          <textarea name="descripcion" class="textarea" rows="5" cols="40" style="width: 100%;" value=""><%=examen.getDescripcion()%></textarea>
                      </div>
                      <div class="form-group">
                          <h1>Costo</h1>
                          <input type="number" name="costo"  step="0.01" min="0" class="form-control" value="<%=examen.getCosto()%>"/>
                      </div>
                      <div class="form-group">
                           <h1>Tipo de Archivo</h1>
                          <input type="text" name="tipo_archivo" class="form-control" value="<%= examen.getTipo_archivo()%>"/>
                      </div>


                      <% boolean resultado;
                          try {
                              Double.parseDouble(request.getParameter("costo"));
                              resultado = true;
                          } catch (Exception excepcion) {
                              resultado = false;
                          }
                          
                          try {
                              if (request.getParameter("boton")!=null&&resultado&&request.getParameter("nombre_examen")!=null&&request.getParameter("descripcion")!=null&&request.getParameter("costo")!=null&&request.getParameter("tipo_archivo") != null) {
                                  String nombre_examen = request.getParameter("nombre_examen");
                                  String descripcion = request.getParameter("descripcion");
                                  String costo = request.getParameter("costo");
                                  String tipo_archivo = request.getParameter("tipo_archivo");
                                  String requiere_orden = request.getParameter("requiere_orden");
                                  boolean requiereorden=false;
                                  if(requiere_orden.equals("true")){
                                      requiereorden=true;
                                  }else{
                                      requiereorden=false;
                                  }
                                  examen.setNombre(nombre_examen);
                                  examen.setDescripcion(descripcion);
                                  examen.setCosto(Double.parseDouble(costo));
                                  examen.setRequiere_orden(requiereorden);
                                  examen.setTipo_archivo(tipo_archivo);
                                  examen.actualizarExamen_laboratorio();
                                  %>
                                  <h1>Examen se ha actualizado</h1>
                                  
                                  <%  
                                      response.sendRedirect("ModificarExamen.jsp");
                                      session.setAttribute("codigo_examen",request.getParameter("codigo"));
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
