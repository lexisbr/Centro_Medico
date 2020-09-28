<%-- 
    Document   : index
    Created on : 28/09/2020, 01:16:35
    Author     : lex
--%>

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
        <% Conexion.iniciarConexion();
           Paciente paciente = new Paciente("prueba2","Alejandro","masculino",LocalDate.now(),"13213131","45454455","85","o+","aaa@gmail.com","HOLA");
           paciente.insertarPaciente();
       
        %>
        
    </body>
</html>
