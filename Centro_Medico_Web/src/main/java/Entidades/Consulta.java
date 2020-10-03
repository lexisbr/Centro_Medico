/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import MYSQL.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author lex
 */
public class Consulta {
    private int codigo;
    private double costo;
    private String nombre_especialidad;

    public Consulta(int codigo, double costo, String nombre_especialidad) {
        this.codigo = codigo;
        this.costo = costo;
        this.nombre_especialidad = nombre_especialidad;
    }
    
    public Consulta(String nombre_especialidad){
        this.nombre_especialidad = nombre_especialidad;
    }
    
    public Consulta(int codigo){
        this.codigo = codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setNombre_especialidad(String nombre_especialidad) {
        this.nombre_especialidad = nombre_especialidad;
    }

    public int getCodigo() {
        return codigo;
    }

    public double getCosto() {
        return costo;
    }

    public String getNombre_especialidad() {
        return nombre_especialidad;
    }
    
    public void insertarConsulta() throws SQLException{
        String query = "INSERT INTO CONSULTA VALUES(?,?,?)";
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            st.setDouble(2,getCosto());
            st.setString(3,getNombre_especialidad());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    public String obtenerCodigoConsulta(){
        String query = "SELECT codigo FROM CONSULTA WHERE nombre_especialidad=?";
        String codigo = "";
        
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getNombre_especialidad());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                codigo=rs.getString("codigo");
            }
            return codigo;
            
        } catch (Exception e) {
            return null;
        }
        
    }
    
     public void consultarDatos(){
        String query = "SELECT * FROM CONSULTA WHERE codigo=?";
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                setCosto(rs.getDouble("costo"));
                setNombre_especialidad(rs.getString("nombre_especialidad"));
            }
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
     
     public void actualizarConsulta() throws SQLException{
        String query = "UPDATE CONSULTA SET costo=? WHERE codigo=?";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setDouble(2,getCodigo());
            st.setDouble(1,getCosto());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    } 
}
