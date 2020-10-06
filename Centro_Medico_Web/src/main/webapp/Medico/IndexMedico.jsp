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
     <%@include file="Encabezado.html" %>
      <!--Informacion de usuario-->
      <section class="contenidoLex">
          <h2 class="titleLex">Informacion de Usuario</h2>
          <%
            String codigo = String.valueOf(session.getAttribute("user"));
            Medico medico = new Medico(codigo);
             medico.consultarDatos();%>
          <h1>Codigo: <%=medico.getCodigo()%></h1>  
          <h1>DPI: <%=medico.getDpi()%></h1>  
          <h1>Nombre: <%=medico.getNombre()%></h1> 
          <h1>Numero de colegiado: <%=medico.getNumero_colegiado()%></h1> 
          <h1>Hora de entrada: <%=medico.getHora_entrada().toString() %></h1>         
          <h1>Hora de salida: <%=medico.getHora_salida().toString() %></h1>         
          <h1>Telefono: <%=medico.getTelefono()%></h1>       
          <h1>Email: <%=medico.getEmail()%></h1>         
          <h1>Fecha de inicio: <%=String.valueOf(medico.getFecha_inicio())%></h1> 
      </section>
    </body>
</html>
