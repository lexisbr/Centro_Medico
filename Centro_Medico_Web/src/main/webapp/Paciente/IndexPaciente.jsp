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
    <head>
        <meta charset="utf-8">
        <title>Home | Centro Medico</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="index">
      <!--HEADER-->
      <header id="encabezado">
          <h1>
              <img id="logoEncabezado" src="img/logo.png" alt="logo">
          </h1>
      </header>
      
      <!--NAVIGATION-->
      <nav class="navbar">
          <ul class="menu">
              <li><a href="#">Agendar</a>
                  <ul class="submenu">
                      <li><a href="Paciente/AgendarConsulta.jsp">Consulta</a></li>
                      <li><a href="#">Examen de Laboratorio</a></li>
                  </ul>
              </li>
              <li><a href="#">Citas Programadas</a>
                  <ul class="submenu">
                      <li><a href="">Consultas</a></li>
                      <li><a href="#">Examenes de Laboratorio</a></li>
                  </ul>
              </li>
              <li><a href="#">Informacion</a>
                  <ul class="submenu">
                      <li><a href="#">Buscar medico</a></li>
                      <li><a href="#">Mi historial medico</a></li>
                  </ul>
              </li>
              <li><a href="#">Reportes</a>
                  <ul class="submenu">
                      <li><a href="#">Examenes realizados</a></li>
                      <li><a href="#">Consultas realizadas</a></li>
                  </ul>
              </li>
          </ul>
      </nav>

      <!--Informacion de usuario-->
      <section class="contenido">
          <h2 class="title">Informacion de Usuario</h2>
          <%String codigo = String.valueOf(session.getAttribute("user"));
            Paciente paciente = new Paciente(codigo);
            paciente.consultarDatos();%>
          <h1>DPI: <%=paciente.getDpi()%><h1>  
          <h1>Nombre: <%=paciente.getNombre()%><h1> 
          <h1>Sexo: <%=paciente.getSexo()%><h1> 
          <h1>Fecha de Nacimiento: <%=String.valueOf(paciente.getFecha_nacimiento())%><h1> 
          <h1>Peso: <%=paciente.getPeso()%><h1>         
          <h1>Tipo de Sangre: <%=paciente.getTipo_sangre()%><h1>
          <h1>Telefono: <%=paciente.getTelefono()%><h1>       
          <h1>Email: <%=paciente.getEmail()%><h1>         
      </section>
    </body>
</html>
