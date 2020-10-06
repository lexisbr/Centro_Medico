/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Informe_consulta;
import Funcionalidades.CitasMedico;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lex
 */
@WebServlet(name = "RegistrarInformeMedico", urlPatterns = {"/RegistrarInformeMedico"})
public class RegistrarInformeMedico extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarInformeMedico</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarInformeMedico at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int codigo_cita = Integer.parseInt(request.getParameter("codigo_cita"));
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            System.out.println("hora "+hora);
            String descripcion = request.getParameter("descripcion");
            String codigo_medico = request.getParameter("codigo_medico");
            String codigo_paciente = request.getParameter("codigo_paciente");
            String codigo_consulta = request.getParameter("codigo_consulta");
            Informe_consulta informe = new Informe_consulta(0, descripcion, LocalDate.parse(fecha), LocalTime.parse(hora), Integer.parseInt(codigo_consulta), codigo_paciente, codigo_medico);
            informe.insertarInforme_consulta();
            CitasMedico eliminar_cita = new CitasMedico(codigo_medico);
            eliminar_cita.eliminarCita(codigo_cita);
            response.sendRedirect("Medico/InformeGenerado.jsp");
            
        } catch (Exception e) {
            System.out.println("error servlet "+e);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
