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
public class Examen_laboratorio {
    private int codigo;
    private String nombre;
    private boolean requiere_orden;
    private String descripcion;
    private double costo;
    private String tipo_archivo;

    public Examen_laboratorio(int codigo, String nombre, boolean requiere_orden, String descripcion, double costo, String tipo_archivo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.requiere_orden = requiere_orden;
        this.descripcion = descripcion;
        this.costo = costo;
        this.tipo_archivo = tipo_archivo;
    }
    
    public Examen_laboratorio(int codigo){
        this.codigo = codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setRequiere_orden(boolean requiere_orden) {
        this.requiere_orden = requiere_orden;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setTipo_archivo(String tipo_archivo) {
        this.tipo_archivo = tipo_archivo;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public boolean isRequiere_orden() {
        return requiere_orden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getCosto() {
        return costo;
    }

    public String getTipo_archivo() {
        return tipo_archivo;
    }
    
    public void insertarExamen_laboratorio() throws SQLException{
        String query = "INSERT INTO EXAMEN_LABORATORIO VALUES(?,?,?,?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            st.setString(2,getNombre());
            if(isRequiere_orden()){
                st.setInt(3,1);
            }else{
                st.setInt(3,0);
            }
            st.setString(4,getDescripcion());
            st.setDouble(5,getCosto());
            st.setString(6,getTipo_archivo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
     public void actualizarExamen_laboratorio() throws SQLException{
        String query = "UPDATE EXAMEN_LABORATORIO SET nombre=?, requiere_orden=?, descripcion=?, costo=?, tipo_archivo=? WHERE codigo=?";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(6,getCodigo());
            st.setString(1,getNombre());
            if(isRequiere_orden()){
                st.setInt(2,1);
            }else{
                st.setInt(2,0);
            }
            st.setString(3,getDescripcion());
            st.setDouble(4,getCosto());
            st.setString(5,getTipo_archivo());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    public void consultarDatos(){
        String query = "SELECT * FROM EXAMEN_LABORATORIO WHERE codigo=?";
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                setNombre(rs.getString(2));
                if(rs.getInt(3)==1){
                    setRequiere_orden(true);
                }else{
                    setRequiere_orden(false);
                }
                
                setDescripcion(rs.getString(4));
                System.out.println("descp "+getDescripcion());
                setCosto(rs.getDouble(5));
                setTipo_archivo(rs.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
    
    
    
    
}
