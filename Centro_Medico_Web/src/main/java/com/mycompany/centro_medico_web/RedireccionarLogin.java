package com.mycompany.centro_medico_web;

import Funcionalidades.Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.xml.soap.SOAPFault;

/**
 *
 * @author lex
 */
@WebServlet(urlPatterns = {"/Index"})
public class RedireccionarLogin extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paginaDestino="Login.jsp";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String user, password, tipo;
        user = request.getParameter("user");
        password = request.getParameter("password");
        tipo = request.getParameter("tipo");
        Login ingresar = new Login(user,password,tipo);
        try {
            if(ingresar.verificarUsuario()){
                session.setAttribute("user",user);
                request.setAttribute("user", user);
                if(tipo.equals("PACIENTE")){
                    paginaDestino = "Paciente/IndexPaciente.jsp"; 
                    request.setAttribute("message", null);
                    session.setAttribute("message",null);
                }else if(tipo.equals("MEDICO")){
                    paginaDestino = "Medico/IndexMedico.jsp"; 
                    request.setAttribute("message", null);
                    session.setAttribute("message",null);
                    
                }else if(tipo.equals("LABORATORISTA")){
                    paginaDestino = "Laboratorista/IndexLab.jsp"; 
                    request.setAttribute("message", null);
                    session.setAttribute("message",null);
                    
                }else if(tipo.equals("ADMINISTRADOR")){
                    paginaDestino = "Administrador/IndexAdmin.jsp";
                    request.setAttribute("message", null);
                    session.setAttribute("message",null);
                }
                
                
            }else{
               String mensaje = "Error";
               request.setAttribute("message",mensaje);
               session.setAttribute("message",mensaje);
            }
            response.sendRedirect(paginaDestino);
            
        } catch (SQLException ex) {
            Logger.getLogger(RedireccionarLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
