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
public class BuscadorExamenes {
    
     /*
        METODO PARA MOSTRAR TODOS LOS EXAMENES
    */
    
    public ResultSet mostrarExamenes(){
        String query = "SELECT * FROM EXAMEN_LABORATORIO";
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
        METODO PARA BUSCAR EXAMENES POR NOMBRE
    */
    public ResultSet buscadorNombre(String nombre) throws SQLException{
        String query = "SELECT * FROM EXAMEN_LABORATORIO WHERE nombre LIKE '%"+nombre+"%'";
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
        METODO PARA BUSCAR EXAMENES POR CODIGO
    */
    public ResultSet buscadorCodigo(String codigo) throws SQLException{
        String query = "SELECT * FROM EXAMEN_LABORATORIO WHERE codigo LIKE '%"+codigo+"%'";
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
        METODO PARA BUSCAR EXAMENES POR NOMBRE
    */
    public ResultSet buscadorCodigoSin(int codigo) throws SQLException{
        String query = "SELECT * FROM EXAMEN_LABORATORIO WHERE codigo!=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,codigo);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            return null;
        }   
    }
    
    /*
        METODO PARA BUSCAR EXAMENES POR CODIGO ESPECIFICO
    */
    public ResultSet buscadorCodigoEspecifico(int codigo) throws SQLException{
        String query = "SELECT * FROM EXAMEN_LABORATORIO WHERE codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,codigo);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            return null;
        }   
    }
    
}
