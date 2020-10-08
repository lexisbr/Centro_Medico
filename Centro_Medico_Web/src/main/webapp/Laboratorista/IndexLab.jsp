<%-- 
    Document   : index
    Created on : 28/09/2020, 01:16:35
    Author     : lex
--%>

<%@page import="Funcionalidades.ConsultarDiasTrabajo"%>
<%@page import="java.util.ArrayList"%>
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
        <h2 class="titleLex">Informacion de Laboratorista</h2>
        <%
            String codigo = String.valueOf(session.getAttribute("user"));
            Laboratorista lab = new Laboratorista(codigo);
            ConsultarDiasTrabajo dias = new ConsultarDiasTrabajo();
            ArrayList lista_dias = new ArrayList(dias.diasTrabajo(lab.getCodigo()));
            lab.consultarDatos();%>
        <h1>Codigo: <%=lab.getCodigo()%></h1>  
        <h1>DPI: <%=lab.getDpi()%></h1>  
        <h1>Nombre: <%=lab.getNombre()%></h1> 
        <h1>Numero de registro ante el MSPAS: <%=lab.getNumero_registro()%></h1> 
        <h1>Examen que realiza: <%=lab.getExamen_nombre()%></h1> 
        <h1>Telefono: <%=lab.getTelefono()%></h1>       
        <h1>Email: <%=lab.getEmail()%></h1>         
        <h1>Fecha de inicio: <%=String.valueOf(lab.getFecha_inicio())%></h1><br>
        <h1 style="color: #000000">Dias que trabaja:</h1>
            <%
             for (int i = 0; i < lista_dias.size(); i++) {%>
                <h1><%=lista_dias.get(i)%></h1>
            <% }%>
    </section>
</body>
</html>
