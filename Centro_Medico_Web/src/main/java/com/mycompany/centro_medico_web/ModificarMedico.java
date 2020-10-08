/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Medico;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lex
 */
@WebServlet(name = "ModificarMedico", urlPatterns = {"/ModificarMedico"})
public class ModificarMedico extends HttpServlet {

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
            out.println("<title>Servlet ModificarMedico</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarMedico at " + request.getContextPath() + "</h1>");
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
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String numero_colegiado = request.getParameter("numero_colegiado");
            String dpi = request.getParameter("dpi");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String hora_entrada = request.getParameter("hora_entrada");
            String hora_salida = request.getParameter("hora_salida");
            String fecha = request.getParameter("fecha");
            String password = request.getParameter("password");

            LocalTime horaEntradaIngresada = LocalTime.parse(hora_entrada);
            LocalTime horaSalidaIngresada = LocalTime.parse(hora_salida);

            if ((horaEntradaIngresada.isBefore(horaSalidaIngresada))) {
                Medico medico = new Medico(codigo, nombre, numero_colegiado, dpi, telefono, email, horaEntradaIngresada, horaSalidaIngresada, LocalDate.parse(fecha), password);
                medico.actualizarMedico();
                response.sendRedirect("Administrador/ExitoModificar.jsp");
            }else{
                response.sendRedirect("Administrador/FalloModificar.jsp");
            }
            }catch (Exception e) {
        }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
