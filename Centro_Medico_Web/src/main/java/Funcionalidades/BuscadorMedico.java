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
public class BuscadorMedico {
    
    
    
    /*
        METODO PARA MOSTRAR TODOS LOS MEDICOS
    */
    
    public ResultSet mostrarMedicos(){
        String query = "SELECT M.*,E.especialidad_nombre FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo";
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
        METODO PARA BUSCAR MEDICO POR NOMBRE
    */
    public ResultSet buscadorNombre(String nombre) throws SQLException{
        String query = "SELECT M.*,E.especialidad_nombre FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo WHERE nombre LIKE '%"+nombre+"%'";
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
        METODO PARA BUSCAR MEDICO POR ESPECIALIDAD
    */
    
     public ResultSet buscadorEspecialidad(String nombre)  throws SQLException{
        String query = "SELECT M.*,E.especialidad_nombre FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo WHERE E.especialidad_nombre LIKE '%"+nombre+"%'";
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
        METODO PARA BUSCAR MEDICO POR HORA
    */
    
     public ResultSet buscadorHora(String hora) throws SQLException{
        String query = "SELECT M.*,E.especialidad_nombre FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo WHERE hora_salida>='"+hora+"' AND '"+hora+"'>=hora_entrada";
         
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            System.out.println("ERROR "+e);
            return null;
        }   
    }
     
     /*
        METODO SELECT MEDICO POR CODIGO
    */
     
    public ResultSet selectMedico(String codigo) throws SQLException{
        String query = "SELECT M.*,E.especialidad_nombre,C.costo FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo INNER JOIN CONSULTA C ON E.especialidad_nombre=C.nombre_especialidad WHERE M.codigo=?";
        System.out.println("codigo: "+codigo);
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,codigo);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            System.out.println("ERROR "+e);
            return null;
        }   
    }
    
    /*
        METODO PARA BUSCAR MEDICO POR CODIGO
    */
    public ResultSet buscadorCodigo(String codigo) throws SQLException{
        String query = "SELECT M.*,E.especialidad_nombre FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo WHERE M.codigo LIKE '%"+codigo+"%'";
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
        METODO PARA OBTENER LOS MEDICOS CON MAYOR CANTIDAD DE EXAMENES REQUERIDOS
    */
    public ResultSet medicosOrdenes() throws SQLException{
        String query = "SELECT COUNT(*) AS ordenes,M.codigo,M.nombre FROM MEDICO M INNER JOIN ORDEN_EXAMEN O ON O.medico_codigo=M.codigo GROUP BY M.codigo ORDER BY ordenes ASC;";
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
