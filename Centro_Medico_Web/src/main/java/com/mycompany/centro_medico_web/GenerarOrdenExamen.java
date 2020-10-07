/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Archivo_orden;
import Entidades.Orden_examen;
import com.itextpdf.kernel.pdf.PdfDocument;
import static com.itextpdf.kernel.pdf.PdfName.Font;
import static com.itextpdf.kernel.pdf.PdfName.FontFamily;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.awt.Font;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lex
 */
@WebServlet(name = "GenerarOrdenExamen", urlPatterns = {"/GenerarOrdenExamen"})
public class GenerarOrdenExamen extends HttpServlet {

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
            out.println("<title>Servlet GenerarOrdenExamen</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerarOrdenExamen at " + request.getContextPath() + "</h1>");
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
            String descripcion = request.getParameter("descripcion");
            String codigo_medico = request.getParameter("codigo_medico");
            String codigo_paciente = request.getParameter("codigo_paciente");
            int codigo_examen = Integer.parseInt(request.getParameter("codigo_examen"));

            Orden_examen orden = new Orden_examen(0, descripcion, codigo_medico, codigo_medico, codigo_examen);
            int codigo_orden = orden.insertarOrden();
            System.out.println("codigo orden " + codigo_orden);
            
            
            String contextPath = getServletContext().getRealPath(File.separator);
            
             //Crea una carpeta para guardar las ordenes
            File directorio = new File(contextPath+"/Ordenes-medicas");
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                    System.out.println("Directorio ordenes creados");
                }
            }

            

            String path = contextPath + "/Ordenes-medicas/orden_" + codigo_paciente+"_"+codigo_orden+".pdf";

            PdfWriter writer = new PdfWriter(path);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);
            String orden_m = "Codigo de la orden : " + codigo_orden;
            String doctor = "Codigo del medico que genero la orden : " + codigo_medico;
            String paciente = "Codigo del paciente que debe realizar examen: " + codigo_paciente;
            String examen = "Codigo de examen: " + codigo_examen;
            String desc = "Descripcion: " + descripcion;
            Paragraph para1 = new Paragraph(orden_m);
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
            
            String pdfFileName = "Ordenes-medicas/orden_" + codigo_paciente +"_"+codigo_orden+".pdf";
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
            
            Archivo_orden orden_archivo = new Archivo_orden(fileInputStream, codigo_orden);
            orden_archivo.insertarArchivo_orden();
            
            response.sendRedirect("Medico/ExitoOrden.jsp");


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
