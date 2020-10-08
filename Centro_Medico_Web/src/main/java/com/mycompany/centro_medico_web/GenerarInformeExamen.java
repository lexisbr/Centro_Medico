/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Informe_examen;
import Funcionalidades.CitasLab;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
@WebServlet(name = "GenerarInformeExamen", urlPatterns = {"/GenerarInformeExamen"})
public class GenerarInformeExamen extends HttpServlet {

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
            out.println("<title>Servlet GenerarInformeExamen</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerarInformeExamen at " + request.getContextPath() + "</h1>");
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
            String descripcion = request.getParameter("descripcion");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String examen_codigo = request.getParameter("examen_codigo");
            String paciente_codigo = request.getParameter("paciente_codigo");
            String lab_codigo = request.getParameter("lab_codigo");
            
            Informe_examen informe = new Informe_examen(0, descripcion, LocalDate.parse(fecha), LocalTime.parse(hora), examen_codigo, paciente_codigo, lab_codigo);
            int codigo_informe = informe.insertarInforme_examen();
            
            CitasLab eliminar = new CitasLab();
            eliminar.eliminarCita(codigo_cita);
            
            String contextPath = getServletContext().getRealPath(File.separator);
            
             //Crea una carpeta para guardar las ordenes
            File directorio = new File(contextPath+"/Informes-examenes");
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                    System.out.println("Directorio ordenes creados");
                }
            }

            

            String path = contextPath + "/Informes-examenes/informe_" + paciente_codigo+"_"+codigo_informe+".pdf";

            PdfWriter writer = new PdfWriter(path);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);
            String informe_g = "Codigo del informe: " + codigo_informe;
            String doctor = "Codigo del laboratorista que genero el informe: " + lab_codigo;
            String paciente = "Codigo del paciente: " + paciente_codigo;
            String examen = "Codigo de examen: " + examen_codigo;
            String desc = "Descripcion: " + descripcion;
            Paragraph para1 = new Paragraph(informe_g);
            Paragraph para2 = new Paragraph(doctor);
            Paragraph para3 = new Paragraph(paciente);
            Paragraph para4 = new Paragraph(examen);
            Paragraph para5 = new Paragraph(desc);
            document.add(para1);
            document.add(para2);
            document.add(para3);
            document.add(para4);
            document.add(para5);
            document.close();
            
            String pdfFileName = "Informes-examenes/informe_" + paciente_codigo +"_"+codigo_informe+".pdf";
            File pdfFile = new File(path);
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
            response.setContentLength((int) pdfFile.length());

            FileInputStream fileInputStream = new FileInputStream(pdfFile);
            OutputStream responseOutputStream = response.getOutputStream();
            int bytes;
            while ((bytes = fileInputStream.read()) != -1) {
                responseOutputStream.write(bytes);
            }
            
            response.sendRedirect("Laboratorista/ExitoInforme.jsp");
            
        } catch (Exception e) {
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
