<%-- 
    Document   : VisualizarCitaMedica
    Created on : 4/10/2020, 18:45:04
    Author     : lex
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.CitasPaciente"%>
<%@page import="Entidades.Cita_medica"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <script>
        function alerta() {
            alert("Se cancelo la cita.");
        }
    </script>
      <%@include file="Encabezado.html" %>
      <% 
          String codigo_paciente = session.getAttribute("user").toString();
          CitasPaciente citas = new CitasPaciente(codigo_paciente);
          if(request.getParameter("codigo")!=null){
            try {
                    System.out.println("entra a eliminar");
                    citas.eliminarCita(Integer.parseInt(request.getParameter("codigo")));
                } catch (Exception e) {
                    System.out.println("error al eliminar "+e);
                }
            
         }
      
      %>
         <section class="contenidoLex">
             <form action="VisualizarCitaMedica.jsp" method="POST">
                  <h2 class="titleLex">Visualizar citas medicas</h2><br>
                 <div class="wrap">
                     <h2>Ingrese codigo de cita medica:</h2>
                     <%@include file="SearchBar.html" %>
                 </div>
                 
                 <div class="container">
                     <table class="table table-dark table-bordered">
                       <tr>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Fecha</th>
                          <th class="text-center">Hora</th>
                          <th class="text-center">Medico</th>
                          <th class="text-center">Tipo</th>
                      </tr>
                      <% try {
                             String campo = request.getParameter("campo");
                             
                             ResultSet rs =null;
                             if(campo!=null){
                                 if(campo.equals("")){
                                    rs = citas.citasMedicas();
                                 }else{
                                      rs = citas.citasMedicasBuscar(campo);
                                 }
                                }else{
                                    rs = citas.citasMedicas();
                                }
                                 while (rs.next()){ %>
                                        <tr>
                                            <td class="text-center"><%=rs.getString("codigo")%> </td>
                                            <td class="text-center"><%=rs.getString("fecha")%> </td>
                                            <td class="text-center"><%=rs.getString("hora")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre_medico")%> </td>
                                            <td class="text-center"><%=rs.getString("nombre_consulta")%> </td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="VisualizarCitaMedica.jsp?codigo=<%=rs.getString("codigo")%>" name="eliminar" onclick="alerta()">Cancelar cita.</a>
                                            </td>
                                        </tr>
                                    <% } 
                                }catch(SQLException e){
                                    System.out.println("error "+e);

                                }
                                    %>
                     </table>
                 </div>
             </form>
      </section>
    </body>
</html>
