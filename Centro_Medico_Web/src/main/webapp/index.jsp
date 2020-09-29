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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola Mundo</h1>
        <% 
            Conexion.iniciarConexion();
            /*Paciente paciente = new Paciente("codigo1","nombre","masc",LocalDate.now(),"22222","4545454","45","a+","asdsad@fdf","555555");
            paciente.insertarPaciente();
            
            Administrador admin = new Administrador("codigo1", "soyadmin", "55555", "passs");
            admin.insertarAdministrador();
            Especialidad espec = new Especialidad("DENTISTA");
            espec.insertarEspecialidad();
            Consulta consulta = new Consulta(0,100.00,"DENTISTA");
            consulta.insertarConsulta();
            Cita_medica cita = new Cita_medica("codigo1",LocalDate.now(),LocalTime.now(),"codigo1","codigo1",1);
            cita.insertarCita_medica();
            Informe_consulta inf = new Informe_consulta("codigo1","aaaaa",LocalDate.now(),LocalTime.now(),1,"codigo1","codigo1");
            inf.insertarInforme_consulta();
            Especializacion esp = new Especializacion("DENTISTA", "codigo1");
            esp.insertarEspecializacion();
            Dias_trabajo dias = new Dias_trabajo(0, "LUNES", "prueba1");
            dias.insertarDias_trabajo();
            Orden_examen ord = new Orden_examen(0, "dddd", "codigo1", "codigo1", "prueba1");
            ord.insertarOrden_examen();
            Informe_examen inf1 = new Informe_examen("codigo2","aaaaa",LocalDate.now(),LocalTime.now(),"prueba1","codigo1","prueba1");
            inf1.insertarInforme_examen();
            Dias_trabajo dias1 = new Dias_trabajo(0, "MIERCOLES", "prueba1");
            dias1.insertarDias_trabajo();
            Cita_examen citaex = new Cita_examen(0, LocalDate.now(), LocalTime.now(), null, "codigo1", "prueba1");
            citaex.insertarCita_examen();
            Medico medico = new Medico("codigo5","nombre","45646","778787","7878778","aaa@aaa",LocalTime.now(),LocalTime.now(),LocalDate.now(),"sdsds","GENERAL");
            medico.insertarMedico();*/
            Login login = new Login("codigo","12345","PACIENTE");
            if(login.verificarUsuario()){
                JOptionPane.showMessageDialog(null, "Ingresa");
            }else{
                JOptionPane.showMessageDialog(null, "Credenciales incorrectas");
            }
            
            
            
           
            

               
        
        %>
        
    </body>
</html>
