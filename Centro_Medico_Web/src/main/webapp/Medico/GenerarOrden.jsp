<%-- 
    Document   : GenerarOrden
    Created on : 6/10/2020, 21:41:04
    Author     : lex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Encabezado.html" %>
    <% try {
            String codigo_medico = String.valueOf(session.getAttribute("user"));
            String codigo_paciente = request.getParameter("codigo_paciente");%>
    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Generar orden de examen</h2>
            <hr>
            <div class="centrar">
                <form action="../GenerarOrdenExamen" method="post" class="form-control" style="width: 500px; height: 530px; background: #ccccff;">
                    <div class="form-group">
                        <h1>Codigo de paciente</h1>
                        <input type="text" readonly="" name="codigo_paciente" class="form-control" value="<%= codigo_paciente %>"/>
                    </div>
                    <div class="form-group">
                        <h1>Codigo de medico</h1>
                        <input type="text" readonly="" class="form-control" name="codigo_medico" value="<%= codigo_medico %>"/>
                    </div>
                     <div class="div-examen">
                          <select class="seleccionar-examen" name="codigo_examen" style="margin-top: 15px;  margin-bottom: 15px;" required="">
                              <option value="">Seleccione examen</option>
                      <%
                                  BuscadorExamenes examen = new BuscadorExamenes();
                                  ResultSet rs = examen.mostrarExamenes();
                                  while(rs.next()){
                                    String nombre = rs.getString("nombre");
                                    String codigo = String.valueOf(rs.getInt("codigo"));
                                    %>
                                        <option value="<%=codigo%>"><%=nombre%></option>
                                  <%}
                      %>
                           </select>
                      </div>
                    <div class="form-group">
                        <textarea name="descripcion" class="textarea" rows="5" cols="40" style="width: 100%;" placeholder="Descripcion" required=""></textarea>
                    </div>
                    <input type="submit" value="Guardar" class="guardar"/>

                </form>
                <% 
                    } catch (Exception e) {

                    }

                %>
            </div>
        </div>
    </section>
</body>
</html>
