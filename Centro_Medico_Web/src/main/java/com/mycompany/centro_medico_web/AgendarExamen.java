/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Cita_examen;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author lex
 */
@WebServlet(name = "AgendarExamen", urlPatterns = {"/AgendarExamen"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class AgendarExamen extends HttpServlet {

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
            out.println("<title>Servlet AgendarExamen</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AgendarExamen at " + request.getContextPath() + "</h1>");
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
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("tiempo");
            String codigo_lab = request.getParameter("codigo_lab");
            String codigo_paciente = request.getParameter("codigo_paciente");

            boolean necesita_orden = Boolean.parseBoolean(String.valueOf(request.getSession().getAttribute("archivo")));
            if (necesita_orden) {
                Part filePart = request.getPart("dataFile");
                InputStream fileStream = filePart.getInputStream();
                InputStream mimeType = filePart.getInputStream();

                Cita_examen cita = new Cita_examen(0, LocalDate.parse(fecha), LocalTime.parse(hora), fileStream, codigo_paciente, codigo_lab);
                cita.insertarCita_examen();
            }else{
                Cita_examen cita = new Cita_examen(0, LocalDate.parse(fecha), LocalTime.parse(hora), null, codigo_paciente, codigo_lab);
                cita.insertarCita_examen();
            }

            response.sendRedirect("Paciente/ExitoCitaExamen.jsp");

        } catch (Exception e) {
            System.out.println("error en servlet " + e);
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
