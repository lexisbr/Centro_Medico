<%-- 
    Document   : AgendarExamen
    Created on : 2/10/2020, 21:26:45
    Author     : lex
--%>

<%@page import="Funcionalidades.ConsultarDiasTrabajo"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Entidades.Cita_examen"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="java.sql.Date"%>
<%@page import="Entidades.Laboratorista"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funcionalidades.BuscadorExamenes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <%@include file="Encabezado.html" %>
    <% try {
            String usuario = String.valueOf(session.getAttribute("user"));
            String codigo_lab = request.getParameter("codigo");
            Laboratorista lab = new Laboratorista(codigo_lab);
            lab.consultarDatosExamen();
            ConsultarDiasTrabajo dias = new ConsultarDiasTrabajo();
            ArrayList lista_dias = new ArrayList(dias.diasTrabajo(lab.getCodigo()));
    %>
    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Registrar Cita</h2>
            <hr>
            <div class="centrar">
                <form action="ConfirmarExamen.jsp" method="post" class="form-control" style="width: 500px; height: 700px; background: #ccccff;">
                    <div class="form-group">
                        <h1>Codigo de laboratorista</h1>
                        <input type="text" readonly="" name="codigo_lab" class="form-control" value="<%= lab.getCodigo()%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Nombre de examen</h1>
                        <input type="text" readonly="" class="form-control" value="<%= lab.getExamen_nombre()%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Precio de examen</h1>
                        <input type="text" readonly="" class="form-control" value="<%= lab.getCosto_examen()%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Codigo de Paciente</h1>
                        <input type="text" readonly=""  name="codigo_paciente" class="form-control" value="<%=usuario%>"/>
                    </div>
                    <div style="width: 150px; height: 150px;">
                    <h1>Dias que trabaja</h1>
                    <%
                       for (int i = 0; i < lista_dias.size(); i++) {%>
                     <div class="caja">  
                        <label style="position: relative; float: left;" name="<%=lista_dias.get(i)%>"><%=lista_dias.get(i)%></label>
                    </div>
                    <% }%>
                    </div>
                    <div class="form-group">
                        <h1 style="">Fecha</h1>
                        <input type="date" name="fecha" value="" min="2018-01-01" max="2022-01-01" style="" required="">
                    </div>
                    <div style="position: relative; float: bottom; bottom: -15%; left: -15%;">
                          <button type="submit" class="btn btn-outline-info" name="fecha_ingresada" style="font-size: 18px; width: 180px; height: 60px; display: block; margin-left: auto; margin-right: auto;">Verificar disponibilidad</button>
                    </div>
                </form>
                <%
                    } catch (Exception e) {
                        System.out.println("error al cargar " + e);
                    }

                %>
            </div>
        </div>
    </section>
</body>
</html>
