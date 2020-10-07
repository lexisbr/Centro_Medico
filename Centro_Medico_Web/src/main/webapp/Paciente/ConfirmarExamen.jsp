<%-- 
    Document   : ConfirmarExamen
    Created on : 6/10/2020, 18:13:20
    Author     : lex
--%>

<%@page import="Entidades.Cita_examen"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Funcionalidades.BuscadorCitas"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Funcionalidades.ConsultarDiasTrabajo"%>
<%@page import="Entidades.Laboratorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Encabezado-->
    <%@include file="Encabezado.html" %>
    <% try {
            Boolean disponible = false;
            String usuario = String.valueOf(session.getAttribute("user"));
            String codigo_lab = request.getParameter("codigo_lab");
            Laboratorista lab = new Laboratorista(codigo_lab);
            lab.consultarDatosExamen();
            session.setAttribute("archivo",lab.isRequiere_orden());
            ConsultarDiasTrabajo dias = new ConsultarDiasTrabajo();
            ArrayList lista_dias = new ArrayList(dias.diasTrabajo(lab.getCodigo()));
            try {
                String diaSemana[] = {"Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};
                Date fechaSemana = Date.valueOf(request.getParameter("fecha"));
                String dia = String.valueOf(fechaSemana.getDay());
                int diaSeleccionado = Integer.parseInt(dia);
                for (int i = 0; i < lista_dias.size(); i++) {
                    if (lista_dias.get(i).equals(diaSemana[diaSeleccionado])) {
                        disponible = true;
                        System.out.println("disponible " + lista_dias.get(i));
                    }
                }
            } catch (Exception e) {
                System.out.println("fecha " + e);
            }


    %>
    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Registrar Cita</h2>
            <hr>
            <div class="centrar">
                <form action="../AgendarExamen" method="post" class="form-control"  enctype="multipart/form-data" style="width: 500px; height: 750px; background: #ccccff;">
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
                        <input type="text" readonly=""  name="codigo_paciente" class="form-control" value="<%= usuario%>"/>
                    </div>
                    <div class="form-group">
                        <h1>Fecha</h1>
                        <input type="date" name="fecha" readonly="" value="<%= request.getParameter("fecha") %>" min="2018-01-01" max="2022-01-01" style="position: relative; ">
                    </div>
                    <%if (lab.isRequiere_orden()) { %>    
                    <div class="form-group" style="width: 100%; margin-top: 15px; position: relative; float: left;">
                        <h1>Ingrese orden</h1>
                        <input type="file" name="dataFile" accept=".pdf" required="">
                    </div>    
                    <%}%>
                    <div class="form-group">
                        <select class="custom-select" name="tiempo" required="">
                            <%
                                try {
                                    if ((request.getParameter("fecha") != null) && (disponible)) {
                                        String fecha = request.getParameter("fecha");
                                        BuscadorCitas busc = new BuscadorCitas(lab.getCodigo(), Date.valueOf(fecha));
                                        ArrayList horasDisponibles = new ArrayList(busc.citasExamenDisponibles());

                                                for (int i = 0; i < horasDisponibles.size(); i++) {%>
                            <option value="<%=horasDisponibles.get(i)%>"><%=horasDisponibles.get(i)%></option>
                            <% }
                                                     } else {%>
                            <option value="">No selecciono una dia correcto.</option>
                            <%}

                                } catch (Exception e) {
                                }

                            %>
                        </select>
                    </div>
                    <input type="submit" value="Guardar" class="guardar"/>
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
