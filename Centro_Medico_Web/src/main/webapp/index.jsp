<%-- 
    Document   : index
    Created on : 28/09/2020, 01:16:35
    Author     : lex
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola Mundo</h1>
        <% 
            Conexion.iniciarConexion();
            /*Paciente paciente = new Paciente("codigo1","nombre","masc",LocalDate.now(),"22222","4545454","45","a+","asdsad@fdf","555555");
            paciente.insertarPaciente();
            Medico medico = new Medico("codigo1","nombre","45646","778787","7878778","aaa@aaa",LocalTime.now(),LocalTime.now(),LocalDate.now(),"sdsds");
            medico.insertarMedico();
            Administrador admin = new Administrador("codigo1", "soyadmin", "55555", "passs");
            admin.insertarAdministrador();
            Especialidad espec = new Especialidad("DENTISTA");
            espec.insertarEspecialidad();
            Consulta consulta = new Consulta(0,100.00,"DENTISTA");
            consulta.insertarConsulta();
            Cita_medica cita = new Cita_medica("codigo1",LocalDate.now(),LocalTime.now(),"codigo1","codigo1",1);
            cita.insertarCita_medica();*/
            
            Cita_examen citaex = new Cita_examen(0, LocalDate.now(), LocalTime.now(), null, "codigo1", "prueba1");
            citaex.insertarCita_examen();
            
            Informe_consulta inf = new Informe_consulta("codigo1","aaaaa",LocalDate.now(),LocalTime.now(),1,"codigo1","codigo1");
            inf.insertarInforme_consulta();
            
            Informe_examen inf1 = new Informe_examen("codigo1","aaaaa",LocalDate.now(),LocalTime.now(),"prueba1","codigo1","codigo1");
            inf1.insertarInforme_examen();
            

               
        
        %>
        
    </body>
</html>
