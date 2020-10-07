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
    
    
    
     /*
        METODO PARA MOSTRAR LOS PACIENTES CON SU CANTIDAD DE INFORMES
    */
    
    public ResultSet pacienteCantidadInformes(String fecha1,String fecha2){
        String query = "SELECT COUNT(*) AS informes,P.* FROM INFORME_CONSULTA I INNER JOIN PACIENTE P ON P.codigo=I.paciente_codigo WHERE I.medico_codigo=?&&(I.fecha BETWEEN ? AND ? ) GROUP BY P.codigo ORDER BY informes ASC";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo_medico());
            st.setString(2,fecha1);
            st.setString(3,fecha2);
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
    
    public ResultSet pacienteInformesConsulta(String codigo_paciente){
        String query = "SELECT * FROM INFORME_CONSULTA WHERE paciente_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,codigo_paciente);
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
    
    public ResultSet pacienteInformesExamen(String codigo_paciente){
        String query = "SELECT * FROM INFORME_EXAMEN WHERE paciente_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,codigo_paciente);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            return null;
        }   
    }
    
    
}
