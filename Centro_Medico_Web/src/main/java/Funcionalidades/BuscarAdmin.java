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
public class BuscarAdmin {
    
    /*
        METODO PARA MOSTRAR TODOS LOS MEDICOS
    */
    
    public ResultSet mostrarAdmin(){
        String query = "SELECT * FROM ADMINISTRADOR";
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
        METODO PARA BUSCAR ADMINISTRADOR POR CODIGO
    */
    public ResultSet buscadorCodigo(String codigo) throws SQLException{
        String query = "SELECT * FROM ADMINISTRADOR WHERE codigo LIKE '%"+codigo+"%'";
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
