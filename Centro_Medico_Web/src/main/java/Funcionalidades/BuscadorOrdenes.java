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
public class BuscadorOrdenes {
    
    
    /*
        METODO PARA MOSTRAR TODOS LAS ORDENES
    */
    
    public ResultSet mostrarOrdenes(String codigo_paciente){
        String query = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=O.examen_laboratorio_codigo WHERE O.paciente_codigo=?";
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
        METODO PARA MOSTRAR TODOS LAS ORDENES
    */
    
    public ResultSet mostrarOrdenesBuscar(String codigo_paciente, String campo){
        String query = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=O.examen_laboratorio_codigo WHERE O.paciente_codigo=? && O.codigo LIKE '%"+campo+"%'";
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
        METODO PARA MOSTRAR TODOS LAS ORDENES
    */
    
    public ResultSet obtenerOrden(String codigo){
        String query = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=O.examen_laboratorio_codigo WHERE O.codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            return null;
        }   
    }
    
}
