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

/**
 *
 * @author lex
 */
public class CitasLab {
    private String codigo_lab;

    public CitasLab(String codigo_lab) {
        this.codigo_lab = codigo_lab;
    }

    public CitasLab() {
    }
    

    public String getCodigo_lab() {
        return codigo_lab;
    }

    public void setCodigo_lab(String codigo_lab) {
        this.codigo_lab = codigo_lab;
    }
    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN LABORATORISTA
    */
    public ResultSet citasExamen() {
        String query = "SELECT P.nombre AS nombre_paciente,C.fecha,C.hora,C.codigo,E.nombre as nombre_examen FROM LABORATORISTA L INNER JOIN CITA_EXAMEN C ON L.codigo=C.laboratorista_codigo INNER JOIN PACIENTE \n" +
        "P ON P.codigo=C.paciente_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.laboratorista_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_lab());
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
    
    public ResultSet citasExamenBuscar(String campo) {
        String query = "SELECT P.codigo AS codigo_paciente,P.nombre AS nombre_paciente,C.fecha,C.hora,C.codigo,E.nombre as nombre_examen,E.codigo AS codigo_examen FROM LABORATORISTA L INNER JOIN CITA_EXAMEN C ON L.codigo=C.laboratorista_codigo INNER JOIN PACIENTE \n" +
        "P ON P.codigo=C.paciente_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.laboratorista_codigo=?&&C.codigo LIKE '%"+campo+"%' ";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_lab());
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
    
    public ResultSet citasExamenBuscarEspecifico(String campo) {
        String query = "SELECT P.codigo AS codigo_paciente,P.nombre AS nombre_paciente,C.fecha,C.hora,C.codigo,E.nombre as nombre_examen,E.codigo AS codigo_examen FROM LABORATORISTA L INNER JOIN CITA_EXAMEN C ON L.codigo=C.laboratorista_codigo INNER JOIN PACIENTE \n" +
        "P ON P.codigo=C.paciente_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.laboratorista_codigo=?&&C.codigo=? ";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_lab());
            st.setString(2, campo);
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
         String query = "DELETE FROM CITA_EXAMEN WHERE codigo=?";
         System.out.println("codigo para eliminar: "+codigo);
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
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN MEDICO EN DIA EN CURSO
    */
    public ResultSet buscarCitasExamenHoy(String fecha) {
        String query = "SELECT P.nombre AS nombre_paciente,C.fecha,C.hora,C.codigo,E.nombre as nombre_examen FROM LABORATORISTA L INNER JOIN CITA_EXAMEN C ON L.codigo=C.laboratorista_codigo INNER JOIN PACIENTE \n" +
        "P ON P.codigo=C.paciente_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.laboratorista_codigo=? && C.fecha=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_lab());
            st.setString(2, fecha);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN MEDICO EN DIA EN CURSO
    */
    public ResultSet buscarCitasExamenHoy(String campo,String fecha) {
        String query = "SELECT P.nombre AS nombre_paciente,C.fecha,C.hora,C.codigo,E.nombre as nombre_examen FROM LABORATORISTA L INNER JOIN CITA_EXAMEN C ON L.codigo=C.laboratorista_codigo INNER JOIN PACIENTE \n" +
        "P ON P.codigo=C.paciente_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE C.laboratorista_codigo=? && C.fecha=? && C.codigo LIKE '%"+campo+"%'";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_lab());
            st.setString(2, fecha);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }
    }
}
