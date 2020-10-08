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
public class BuscadorInformes {

    private String codigo_medico;

    public BuscadorInformes(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

    public BuscadorInformes() {
    }

    public String getCodigo_medico() {
        return codigo_medico;
    }

    public void setCodigo_medico(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

    /////////////////////////////
    /*    INFORMES DE CONSULTA */
    ///////////////////////////
    /*
        METODO PARA MOSTRAR LOS PACIENTES CON SU CANTIDAD DE INFORMES DE CONSULTA
     */
    public ResultSet pacienteCantidadInformes(String fecha1, String fecha2) {
        String query = "SELECT COUNT(*) AS informes,P.* FROM INFORME_CONSULTA I INNER JOIN PACIENTE P ON P.codigo=I.paciente_codigo WHERE I.medico_codigo=?&&(I.fecha BETWEEN ? AND ? ) GROUP BY P.codigo ORDER BY informes ASC";
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

    /*
        METODO PARA MOSTRAR LOS INFORMES DE CONSULTA DE PACIENTE
     */
    public ResultSet pacienteInformesConsulta(String codigo_paciente) {
        String query = "SELECT * FROM INFORME_CONSULTA WHERE paciente_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR LOS ULTIMOS 5 INFORMES DE CONSULTA DE PACIENTE
     */
    public ResultSet pacienteInformesConsultaUltimos(String codigo_paciente) {
        String query = "SELECT * FROM INFORME_CONSULTA I INNER JOIN CONSULTA C ON C.codigo=I.consulta_codigo WHERE paciente_codigo=? ORDER BY fecha DESC LIMIT 5";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }
    
     /*
        METODO PARA MOSTRAR LOS ULTIMOS 5 INFORMES DE CONSULTA DE PACIENTE
     */
    public ResultSet pacienteInformesConsultaMedico(String codigo_paciente, String codigo_medico, String fecha1, String fecha2) {
        String query = "SELECT I.*,M.nombre,C.nombre_especialidad FROM INFORME_CONSULTA I INNER JOIN CONSULTA C ON C.codigo=I.consulta_codigo INNER JOIN MEDICO M ON M.codigo=I.medico_codigo WHERE I.paciente_codigo=? && I.medico_codigo=? && I.fecha BETWEEN ? AND ?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            st.setString(2, codigo_medico);
            st.setString(3, fecha1);
            st.setString(4, fecha2);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }
    
     /*
        METODO PARA MOSTRAR LOS 10 MEDICOS CON MAS INFORMES EN UN INTERVALO
     */
    public ResultSet obtenerMedicosConMasInformes(String fecha1, String fecha2) {
        String query = "SELECT COUNT(*) AS informes,M.nombre FROM MEDICO M INNER JOIN INFORME_CONSULTA I ON M.codigo=I.medico_codigo WHERE I.fecha BETWEEN ? AND ? GROUP BY M.nombre ORDER BY informes DESC LIMIT 10";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }
    
   
    
    /////////////////////////////
    /*    INFORMES DE EXAMEN */
    ///////////////////////////
    
    /*
        METODO PARA MOSTRAR LOS INFORMES DE EXAMEN DE PACIENTE
     */
    public ResultSet pacienteInformesExamen(String codigo_paciente) {
        String query = "SELECT * FROM INFORME_EXAMEN WHERE paciente_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR LOS INFORMES DE EXAMEN REALIZADOS POR LAB EN EL DIA EN CURSO
     */
    public ResultSet pacienteInformesExamenHoy(String codigo_lab, String fecha) {
        String query = "SELECT * FROM INFORME_EXAMEN WHERE laboratorista_codigo=? && fecha=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_lab);
            st.setString(2, fecha);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR LOS INFORMES DE EXAMEN REALIZADOS POR DIA EN UN INTERVALO
     */
    public ResultSet pacienteCantidadInformesIntervalo(String codigo_lab, String fecha1, String fecha2) {
        String query = "SELECT COUNT(*) AS numero_informes,fecha FROM INFORME_EXAMEN  WHERE fecha BETWEEN ? AND ? && laboratorista_codigo=? GROUP BY fecha";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            st.setString(3, codigo_lab);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR LAS 10 FECHAS CON MAS INFORMES DE EXAMEN REALIZADOS
     */
    public ResultSet pacienteCantidadInformesFecha(String codigo_lab) {
        String query = "SELECT COUNT(*) AS numero_informes,fecha FROM INFORME_EXAMEN  WHERE laboratorista_codigo=? GROUP BY fecha ORDER BY fecha DESC LIMIT 10";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_lab);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR LOS ULTIMOS 5 INFORMES DE EXAMEN DE PACIENTE
     */
    public ResultSet pacienteInformesExamenUltimos(String codigo_paciente) {
        String query = "SELECT I.*,E.nombre FROM INFORME_EXAMEN I INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=I.examen_laboratorio_codigo WHERE I.paciente_codigo=? ORDER BY fecha DESC LIMIT 5";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA MOSTRAR INFORMES DE UN TIPO DE EXAMEN EN UN INTERVALO DE TIEMPO
     */
    public ResultSet pacienteInformesExamenTipo(String codigo_paciente, String codigo_examen, String fecha1, String fecha2) {
        String query = "SELECT I.*,E.nombre FROM INFORME_EXAMEN I INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=I.examen_laboratorio_codigo WHERE I.paciente_codigo=? && E.codigo=? && fecha BETWEEN ? AND ?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_paciente);
            st.setString(2, codigo_examen);
            st.setString(3, fecha1);
            st.setString(4, fecha2);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

}
