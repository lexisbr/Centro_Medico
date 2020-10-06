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
            Boolean disponible = false;
            String usuario = String.valueOf(session.getAttribute("user"));
            String codigo_lab = request.getParameter("codigo");
            Laboratorista lab = new Laboratorista(codigo_lab);
            lab.consultarDatosExamen();
            ConsultarDiasTrabajo dias = new ConsultarDiasTrabajo();
            ArrayList lista_dias = new ArrayList(dias.diasTrabajo(lab.getCodigo()));
        try {
                String diaSemana[] = {"Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};
                Date fechaSemana = Date.valueOf(request.getParameter("fecha"));
                String dia = String.valueOf(fechaSemana.getDay());
                int diaSeleccionado = Integer.parseInt(dia);
                for (int i = 0; i < lista_dias.size(); i++) {
                        if(lista_dias.get(i).equals(diaSemana[diaSeleccionado])){
                            disponible = true;
                            System.out.println("disponible "+lista_dias.get(i));
                        }
                    }
            } catch (Exception e) {
                System.out.println("fecha "+e);
            }
    
    
    %>
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
                            <h1>Dias que trabaja</h1>
                            
                                <%
                                    for (int i = 0; i < lista_dias.size(); i++) {%>
                                    <div class="caja">   
                                        <label style="position: relative; float: left;" name="<%=lista_dias.get(i)%>"><%=lista_dias.get(i)%></label>
                                    </div>
                                <%  }

                                %>
                            <div class="form-group">
                                <h1>Fecha</h1>
                                <input type="date" name="fecha" value="<%=request.getParameter("fecha")%>" min="2018-01-01" max="2022-01-01" style="position: relative; top: -15px;">
                                <button type="submit" class="btn btn-outline-info" name="fecha_ingresada">Verificar disponibilidad</button>
                            </div>
                            <%if(lab.isRequiere_orden()){ %>    
                            <div class="form-group">
                                <h1>Ingrese orden</h1>
                                <input type="file" name="fichero" accept=".pdf">
                            </div>    
                            <%}%>
                            <div class="form-group">
                                <select class="custom-select" name="tiempo">
                                    <%  
                                        
                                        if ((request.getParameter("fecha_ingresada") != null)&&(disponible)) {
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
                                        if(!request.getParameter("tiempo").equals("no_verificado")){
                                        String fecha = request.getParameter("fecha");
                                        String hora = request.getParameter("tiempo");
                                        String archivo = request.getParameter("fichero");
                                       
                                        Cita_examen cita = new Cita_examen(0, LocalDate.parse(fecha),LocalTime.parse(hora),archivo, usuario, lab.getCodigo());
                                        cita.insertarCita_examen();
                            %>

                            <div class="mensaje-exito">
                                <h1>Cita de registrada con exito</h1>
                            </div>
                            <%
                                }
                                } catch (Exception e) {
                                    System.out.println("error guardar "+e);
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
