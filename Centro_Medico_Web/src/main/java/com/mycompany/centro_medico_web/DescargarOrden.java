/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Funcionalidades.BuscadorOrdenes;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import org.apache.commons.io.FileUtils;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.security.util.IOUtils;

/**
 *
 * @author lex
 */
@WebServlet(name = "DescargarOrden", urlPatterns = {"/DescargarOrden"})
public class DescargarOrden extends HttpServlet {

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
            out.println("<title>Servlet DescargarOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DescargarOrden at " + request.getContextPath() + "</h1>");
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
        try {
            String codigo_medico="";
            String examen_nombre ="";
            String descripcion = "";
            String codigo_orden = request.getParameter("codigo");
            String paciente_codigo = String.valueOf(request.getSession().getAttribute("user"));
            BuscadorOrdenes orden = new BuscadorOrdenes();
            ResultSet rs = orden.obtenerOrden(codigo_orden);
            while(rs.next()){
                descripcion = rs.getString("descripcion");
                examen_nombre = rs.getString("nombre");
                codigo_medico = rs.getString("medico_codigo");
            }
            rs.close();
            
            String contextPath = getServletContext().getRealPath(File.separator);
            
            //Crea una carpeta para guardar las ordenes
            File directorio = new File(contextPath+"/Ordenes-paciente");
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                    System.out.println("Directorio ordenes creados");
                }
            }
            
            
            String path = contextPath + "/Ordenes-paciente/informe_" + paciente_codigo+"_"+codigo_orden+".pdf";

            PdfWriter writer = new PdfWriter(path);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);
            String codigo_or = "Codigo de la orden: " + codigo_orden;
            String doctor = "Codigo del medico que genero la orden: " + codigo_medico;
            String paciente = "Codigo del paciente: " + paciente_codigo;
            String examen = "Examen que debe realizar: " + examen_nombre;
            String desc = "Descripcion: " + descripcion;
            Paragraph para1 = new Paragraph(codigo_or);
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
            
            String pdfFileName = "Ordenes-paciente/informe_" + paciente_codigo +"_"+codigo_orden+".pdf";
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
            
        } catch (Exception e) {
        }
    }

  

}
