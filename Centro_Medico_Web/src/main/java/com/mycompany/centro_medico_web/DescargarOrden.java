/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import org.apache.commons.io.FileUtils;
import Entidades.Archivo_informe;
import Entidades.Archivo_orden;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
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
        
        
       /* int codigo_orden = Integer.parseInt(request.getParameter("codigo"));
        System.out.println("codigo servlet " + codigo_orden);
        Archivo_orden orden = new Archivo_orden(codigo_orden);
        
        String pdfFileName = "pdfPrueba.pdf";
        String contextPath = getServletContext().getRealPath(File.separator);
        
        int b = orden.getArchivo().read();
        
        FileOutputStream os = new FileOutputStream(contextPath+pdfFileName);
        os.write(b);*/
        
        
        

    /*    String pdfFileName = "pdfPrueba.pdf";
        String contextPath = getServletContext().getRealPath(File.separator);
        File pdfFile = new File(contextPath + pdfFileName);
        FileUtils.copyInputStreamToFile(orden.getArchivo(), pdfFile);

//        FileInputStream input = new FileInputStream(pdfFile);
//        response.setContentType("application/pdf");
//        response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
//        response.setContentLength((int) pdfFile.length());
//        FileOutputStream fos = new FileOutputStream(pdfFile);
//        byte[] buffer = new byte[orden.getArchivo().available()];
//        FileInputStream fileInputStream = new FileInputStream(pdfFile);
//        OutputStream responseOutputStream = response.getOutputStream();
//        int bytes;
        
        int bytes;

        while ((bytes = orden.getArchivo().read()) != -1) {
            fos.write(buffer);
        }
        fos.close();*/

    }

  

}
