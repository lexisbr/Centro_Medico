<%-- 
    Document   : AgendarExamen
    Created on : 2/10/2020, 21:26:45
    Author     : lex
--%>

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
            lab.consultarDatosExamen();%>
            <section class="contenidoLex">
                <div class="container">
                    <h2 class="titleLex" >Registrar Cita</h2>
                    <hr>
                    <div class="centrar">
                        <form action="" method="post" class="form-control" style="width: 500px; height: 800px; background: #ccccff;">
                            <div class="form-group">
                                <h1>Codigo de laboratorista</h1>
                                <input type="text" readonly="" name="codigo_examen" class="form-control" value="<%= lab.getCodigo()%>"/>
                            </div>
                            <div class="form-group">
                                <h1>Nombre de examen</h1>
                                <input type="text" readonly="" class="form-control" value="<%= lab.getExamen_nombre()%>"/>
                            </div>
                            <div class="form-group">
                                <h1>Precio de examen</h1>
                                <input type="text" readonly="" class="form-control" value="<%= lab.getCosto_examen() %>"/>
                            </div>
                            <div class="form-group">
                                <h1>Codigo de Paciente</h1>
                                <input type="text" readonly=""  name="codigo_paciente" class="form-control" value="<%= usuario %>"/>
                            </div>
                            <div class="form-group">
                                <h1>Fecha</h1>
                                <input type="date" name="fecha" value="<%=request.getParameter("fecha")%>" min="2018-01-01" max="2022-01-01">
                                <button type="submit" class="btn btn-outline-info" name="fecha_ingresada">Verificar disponibilidad</button>
                            </div>
                            <div class="form-group">
                                <select class="custom-select" name="tiempo">
                                    
                                    <%
                                        if (request.getParameter("fecha_ingresada") != null) {
                                            String fecha = request.getParameter("fecha");
                                            BuscadorCitas busc = new BuscadorCitas(lab.getCodigo(), Date.valueOf(fecha));
                                            ArrayList horasDisponibles = new ArrayList(busc.citasExamenDisponibles());

                                            for (int i = 0; i < horasDisponibles.size(); i++) {%>
                                            <option value="<%=horasDisponibles.get(i)%>"><%=horasDisponibles.get(i)%></option>
                                    <% }
                                        }else{%>
                                            <option value="no_verificado">No ha verificado la disponibilidad</option>
                                        <%}

                                    %>
                                </select>
                            </div>
                            <%try {
                                    if (!request.getParameter("tiempo").equals("no_verificado")) {
                                        String fecha = request.getParameter("fecha");
                                        String hora = request.getParameter("tiempo");
                            %>

                            <div class="mensaje-exito">
                                <h1>Cita de registrada con exito</h1>
                            </div>
                            <%
                                    }

                                } catch (Exception e) {
                                }
                            %>
                            <input type="submit" value="Guardar" class="guardar"/>

                        </form>
                        <% 
                            } catch (Exception e) {

                            }

                        %>
                    </div>
                </div>
            </section>
</body>
</html>
