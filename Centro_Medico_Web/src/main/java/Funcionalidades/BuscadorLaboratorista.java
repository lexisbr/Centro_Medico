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
public class BuscadorLaboratorista {
    
    /*
        METODO PARA MOSTRAR TODOS LOS LABORATORISTAS
    */
    
    public ResultSet mostrarLaboratorista(){
        String query = "SELECT * FROM LABORATORISTA ";
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
        METODO PARA BUSCAR LABORATORISTA POR CODIGO
    */
    public ResultSet buscadorCodigo(String codigo) throws SQLException{
        String query = "SELECT * FROM LABORATORISTA WHERE codigo LIKE '%"+codigo+"%'";
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
        METODO PARA MOSTRAR TODOS LOS LABORATORISTAS CON EL EXAMEN QUE REALIZA
    */
    
    public ResultSet mostrarLaboratoristaExamen(){
        String query = "SELECT L.*,E.nombre as examen FROM LABORATORISTA L INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo ";
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
        METODO PARA BUSCAR LABORATORISTA POR CODIGO CON EXAMEN QUE REALIZA
    */
    public ResultSet buscadorCodigoExamen(String codigo) throws SQLException{
        String query = "SELECT L.*,E.nombre as examen FROM LABORATORISTA L INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE L.codigo LIKE '%"+codigo+"%'";
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
