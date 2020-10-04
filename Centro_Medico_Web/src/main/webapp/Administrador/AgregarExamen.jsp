<%-- 
    Document   : AgregarExamen
    Created on : 2/10/2020, 23:44:53
    Author     : lex
--%>

<%@page import="Entidades.Examen_laboratorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Registrar Examen</h2>
              <hr>
              <div class="centrar">
                  <form action="" method="post" class="form-control" style="width: 500px; height: 580px; background: #ccccff;">
                      <div class="form-group">
                          <input type="text" name="nombre_examen" class="form-control" placeholder="Nombre de examen" required=""/>
                      </div>
                      <div class="radios" data-toggle="buttons">
                          <h1>Requiere orden</h1>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="true" autocomplete="off" >Si
                          </label>
                          <label class="radio">
                              <input type="radio" name="requiere_orden" value="false" autocomplete="off" checked>No
                          </label>
                      </div>
                      <div class="form-group">
                          <textarea name="descripcion" class="textarea" rows="5" cols="40" style="width: 100%;" placeholder="Descripcion" required=""></textarea>
                      </div>
                      <div class="form-group">
                          <input type="number" name="costo"  step="0.01" min="0" class="form-control" placeholder="Costo" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="tipo_archivo" class="form-control" placeholder="Tipo de archivo (IMG o PDF)" required=""/>
                      </div>


                      <% boolean resultado;
                          try {
                              Double.parseDouble(request.getParameter("costo"));
                              resultado = true;
                          } catch (Exception excepcion) {
                              resultado = false;
                          }
                          
                          try {
                              if (resultado&&request.getParameter("nombre_examen")!=null&&request.getParameter("descripcion")!=null&&request.getParameter("costo")!=null&&request.getParameter("tipo_archivo") != null) {
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
                                  
                                  Examen_laboratorio examen = new Examen_laboratorio(0, nombre_examen, requiereorden, descripcion,Double.parseDouble(costo), tipo_archivo);
                                  examen.insertarExamen_laboratorio();
                      %>

                      <div class="mensaje-exito">
                          <h1>Examen registrado con exito</h1>
                      </div>
                      <% 
                              }

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
