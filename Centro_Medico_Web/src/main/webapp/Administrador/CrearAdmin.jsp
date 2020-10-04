<%-- 
    Document   : CrearAdmin
    Created on : 4/10/2020, 06:33:24
    Author     : lex
--%>

<%@page import="Entidades.Administrador"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Registrar Administrador</h2>
              <hr>
              <div class="centrar">
                  <form action="" method="post" class="form-control" style="width: 500px; height: 500px; background: #ccccff;">
                      <div class="form-group">
                          <input type="text" name="codigo" class="form-control" placeholder="Codigo" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="text" name="nombre" class="form-control" placeholder="Nombre" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="number" name="dpi"  step="1" min="0" class="form-control" placeholder="DPI" required=""/>
                      </div>
                      <div class="form-group">
                          <input type="password" name="password" class="form-control" placeholder="Password" required=""/>
                      </div>


                      <%
                          try {
                              if (request.getParameter("guardar")!=null) {
                                  String codigo = request.getParameter("codigo");
                                  String nombre = request.getParameter("nombre");
                                  String dpi = request.getParameter("dpi");
                                  String password = request.getParameter("password");
                                  
                                  Administrador admin = new Administrador(codigo, nombre, dpi, password);
                                  admin.insertarAdministrador();
                                  

                      %>
                      <div class="mensaje-exito">
                          <h1>Administrador registrado con exito</h1>
                      </div>
                      
                      <%                              }

                          } catch (Exception e) {
                          }
                      %>
                      
                      <input type="submit" value="Guardar" class="guardar" name="guardar"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
