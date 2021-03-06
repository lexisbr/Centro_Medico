<%-- 
    Document   : Login
    Created on : 29/09/2020, 21:40:10
    Author     : lex
--%>

<%@page import="Entidades.Administrador"%>
<%@page import="Entidades.Examen_laboratorio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Entidades.Medico"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Entidades.Paciente"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="jdk.nashorn.internal.scripts.JO"%>
<%@page import="MYSQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login | Centro Medico</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="login">
        <div class="login-box">
            <img class="logo" src="img/logo.png" alt="Logo hospital">
            <h1>Centro Medico</h1>
            <%  try {
                    Conexion.iniciarConexion();
                } catch (Exception e) {
                    System.out.println("Error login "+e);
                }
                
                if(session.getAttribute("message")!=null){%>
                    <h3 class="error">Las credenciales no son validas.</h3>
                <%
                }
             %>
            <form class="" action="Index" method="POST">
                <!--USUARIO-->
                <select name="tipo">
                            <option value="0">Seleccione su tipo de usuario.</option>
                            <option value="ADMINISTRADOR">Administrador</option>
                            <option value="PACIENTE">Paciente</option>
                            <option value="MEDICO">Medico</option>
                            <option value="LABORATORISTA">Laboratorista</option>
                </select>

                <label for="usuario">Usuario</label>
                <input type="text" name="user" placeholder="Ingresa tu usuario.">

                <!--CONTRASEÑA-->
                <label for="password">Contraseña</label>
                <input type="password" name="password" placeholder="Ingresa tu contraseña.">

                <input type="submit" value="Ingresar">
                <a href="./CrearPaciente.jsp">Crear una cuenta.</a></br>
            </form>
        </div>
    </body>
</html>
