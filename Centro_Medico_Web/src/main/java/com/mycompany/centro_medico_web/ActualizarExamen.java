/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.centro_medico_web;

import Entidades.Examen_laboratorio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lex
 */
@WebServlet(name = "ActualizarExamen", urlPatterns = {"/ActualizarExamen"})
public class ActualizarExamen extends HttpServlet {

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
            out.println("<title>Servlet ActualizarExamen</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizarExamen at " + request.getContextPath() + "</h1>");
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
        
        if (request.getParameter("boton") != null && request.getParameter("nombre_examen") != null && request.getParameter("descripcion") != null && request.getParameter("costo") != null && request.getParameter("tipo_archivo") != null) {
            String nombre_examen = request.getParameter("nombre_examen");
            String descripcion = request.getParameter("descripcion");
            String costo = request.getParameter("costo");
            String tipo_archivo = request.getParameter("tipo_archivo");
            String requiere_orden = request.getParameter("requiere_orden");
            boolean requiereorden = false;
            if (requiere_orden.equals("true")) {
                requiereorden = true;
            } else {
                requiereorden = false;
            }
            
            Examen_laboratorio examen = new Examen_laboratorio(0,nombre_examen,requiereorden,descripcion,Double.parseDouble(costo),tipo_archivo);
            
            
             
                                  
        }
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
        processRequest(request, response);
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
