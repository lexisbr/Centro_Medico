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
public class BuscarConsultas {
    
     
     /*
        METODO PARA MOSTRAR TODOS LOS EXAMENES
    */
    
    public ResultSet mostrarConsultas(){
        String query = "SELECT * FROM CONSULTA";
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
        String query = "SELECT * FROM CONSULTA WHERE nombre_especialidad LIKE '%"+nombre+"%'";
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
}
