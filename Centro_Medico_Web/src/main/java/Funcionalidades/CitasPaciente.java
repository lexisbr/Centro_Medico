/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funcionalidades;

import MYSQL.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class CitasPaciente {
    private String codigo_paciente;

    public CitasPaciente(String codigo_paciente) {
        this.codigo_paciente = codigo_paciente;
    }

    public String getCodigo_paciente() {
        return codigo_paciente;
    }

    public void setCodigo_paciente(String codigo_paciente) {
        this.codigo_paciente = codigo_paciente;
    }

    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN PACIENTE
    */
    public ResultSet citasMedicas() {
        String query = "SELECT C.*,M.nombre AS nombre_medico ,E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN MEDICO M ON M.codigo=C.medico_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.paciente_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_paciente());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN PACIENTE FILTRANDO POR CODIGO
    */
    
    public ResultSet citasMedicasBuscar(String campo) {
        String query = "SELECT C.*,M.nombre AS nombre_medico ,E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN MEDICO M ON M.codigo=C.medico_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.codigo="+campo+" ";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA CANCELAR CITAS MEDICAS DE UN PACIENTE
    */
    
    public void eliminarCita(int codigo){
         String query = "DELETE FROM CITA_MEDICA WHERE codigo=?";
         System.out.println("codigo de cita "+codigo);
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1, codigo);
            //Ejecuta el delete
            st.execute();
            st.close();
            
        } catch (SQLException e) {

        }
    }
    
     /*
    METODO PARA OBTENER LAS CITAS DE EXAMEN DE UN PACIENTE
    */
    public ResultSet citasExamen() {
        String query = " SELECT C.*,L.nombre as nombre_lab,E.nombre as nombre_examen FROM CITA_EXAMEN C INNER JOIN LABORATORISTA L ON L.codigo=C.laboratorista_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.paciente_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_paciente());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA OBTENER LAS CITAS DE EXAMEN DE UN PACIENTE FILTRANDO POR CODIGO
    */
    
    public ResultSet citasExamenBuscar(String campo) {
        String query = " SELECT C.*,L.nombre as nombre_lab,E.nombre as nombre_examen FROM CITA_EXAMEN C INNER JOIN LABORATORISTA L ON L.codigo=C.laboratorista_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.codigo="+campo+" ";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA CANCELAR CITAS MEDICAS DE UN PACIENTE
    */
    
    public void eliminarCitaExamen(int codigo){
         String query = "DELETE FROM CITA_EXAMEN WHERE codigo=?";
         System.out.println("codigo de cita "+codigo);
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1, codigo);
            //Ejecuta el delete
            st.execute();
            st.close();
            
        } catch (SQLException e) {

        }
    }

}
