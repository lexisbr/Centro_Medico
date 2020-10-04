<%-- 
    Document   : ModificarAdmin
    Created on : 4/10/2020, 06:51:19
    Author     : lex
--%>

<%@page import="Entidades.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <<!-- Encabezado -->
      <%@include file="Encabezado.html" %>
       <script>
        function alerta() {
                alert("Se ha actualizado");
        }
      </script>
      <% String codigo_admin;
          
          try {
               codigo_admin = request.getParameter("codigo");
          } catch (Exception e) {
               codigo_admin = String.valueOf(session.getAttribute("codigo"));
          }
          if(codigo_admin==null){
              codigo_admin = String.valueOf(session.getAttribute("codigo"));
          }
          
          Administrador admin = new Administrador(codigo_admin);
          admin.consultarDatos();
      %>
     
      <section class="contenidoLex">
          <div class="container">
              <h2 class="titleLex" >Modificar Administrador</h2>
              <hr>
              <div class="centrar">
                  <form action="ModificarAdmin.jsp" method="post" class="form-control" style="width: 500px; height: 500px; background: #ccccff;">
                      <div class="form-group">
                          <h1>Codigo</h1>
                          <input type="text" readonly="" name="codigo" class="form-control" value="<%=admin.getCodigo()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Nombre</h1>
                          <input type="text"  name="nombre" class="form-control" value="<%=admin.getNombre()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>DPI</h1>
                          <input type="number" name="dpi"  id="dpi" step="1" min="0" class="form-control" value="<%=admin.getDpi()%>" required=""/>
                      </div>
                      <div class="form-group">
                          <h1>Password</h1>
                          <input type="password"  name="password" class="form-control" value="<%=admin.getPassword()%>" required=""/>
                      </div>

                      <% 
                          try {
                              if (request.getParameter("boton")!=null) {
                                  String nombre = request.getParameter("nombre");
                                  String dpi = request.getParameter("dpi");
                                  String password = request.getParameter("password");
                                  
                                  admin.setNombre(nombre);
                                  admin.setDpi(dpi);
                                  admin.setPassword(password);
                                  
                                  admin.actualizarAdmin();
                                  %>
                                  <div class="mensaje-exito">
                                      <h1>Consulta actualizado con exito</h1>
                                  </div>
                                  
                                  <%  
                                      response.sendRedirect("ModificarAdmin.jsp");
                                      session.setAttribute("codigo",admin.getCodigo());
                                      
                              }

                          } catch (Exception e) {
                          }
                      %>
                      <input type="submit" name="boton" value="Guardar" class="guardar" onclick="alerta(<%=request.getParameter("costo")%>)"/>

                  </form>
              </div>
          </div>
      </section>
    </body>
</html>
