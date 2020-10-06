<%-- 
    Document   : index
    Created on : 28/09/2020, 01:16:35
    Author     : lex
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Funcionalidades.Login"%>
<%@page import="Entidades.Dias_trabajo"%>
<%@page import="Entidades.Orden_examen"%>
<%@page import="Entidades.Especializacion"%>
<%@page import="Entidades.Informe_examen"%>
<%@page import="Entidades.Informe_consulta"%>
<%@page import="Entidades.Cita_examen"%>
<%@page import="Entidades.Cita_medica"%>
<%@page import="Entidades.Consulta"%>
<%@page import="Entidades.Especialidad"%>
<%@page import="Entidades.Administrador"%>
<%@page import="Entidades.Laboratorista"%>
<%@page import="Entidades.Examen_laboratorio"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Entidades.Medico"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Paciente"%>
<%@page import="MYSQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <!-- Encabezado -->
      <%@include file="Encabezado.html" %>
      <!--Informacion de usuario-->
      <section class="contenidoLex">
          <h2 class="titleLex">Informacion de Usuario</h2>
          <%
            String codigo = String.valueOf(session.getAttribute("user"));
            Administrador admin = new Administrador(codigo);
            admin.consultarDatos();%>
          <h1>Codigo: <%=admin.getCodigo()%></h1>  
          <h1>DPI: <%=admin.getDpi()%></h1>  
          <h1>Nombre: <%=admin.getNombre()%></h1> 
      </section>
    </body>
</html>