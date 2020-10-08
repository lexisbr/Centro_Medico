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
public class CitasMedico {
    
    private String codigo_medico;

    public CitasMedico(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

    public CitasMedico() {
    }

    public String getCodigo_medico() {
        return codigo_medico;
    }

    public void setCodigo_medico(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

   
    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN MEDICO
    */
    public ResultSet citasMedicas() {
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
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
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=?&&C.codigo LIKE '%"+campo+"%' ";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
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
    
    public ResultSet citasMedicasBuscarEspecifico(String campo) {
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=?&&C.codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
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
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN MEDICO EN DIA EN CURSO
    */
    public ResultSet citasMedicas(String fecha) {
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=? && C.fecha=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
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
    public ResultSet buscarCitasMedicasHoy(String campo,String fecha) {
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=? && C.fecha=? && C.codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
            st.setString(2, fecha);
            st.setString(3, campo);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    /*
    METODO PARA OBTENER LAS CITAS MEDICAS DE UN PACIENTE FILTRANDO POR CODIGO EN UN INTERVALO DE TIEMPO
    */
    
    public ResultSet citasMedicasBuscar(String fecha1, String fecha2) {
        String query = "SELECT C.*,P.nombre AS nombre_paciente, E.nombre_especialidad AS nombre_consulta FROM CITA_MEDICA C INNER JOIN PACIENTE P ON P.codigo=C.paciente_codigo INNER JOIN CONSULTA E ON E.codigo=C.consulta_codigo WHERE C.medico_codigo=?&&C.fecha BETWEEN ? AND ?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
            st.setString(2, fecha1);
            st.setString(3, fecha2);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
            return null;

        }

    }
    
    
    
}
