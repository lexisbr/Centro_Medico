/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import MYSQL.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author lex
 */
public class Examen_laboratorio {
    private String codigo;
    private String nombre;
    private boolean requiere_orden;
    private String descripcion;
    private double costo;
    private String tipo_archivo;

    public Examen_laboratorio(String codigo, String nombre, boolean requiere_orden, String descripcion, double costo, String tipo_archivo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.requiere_orden = requiere_orden;
        this.descripcion = descripcion;
        this.costo = costo;
        this.tipo_archivo = tipo_archivo;
    }

    public void setCodigo(String codigo) {
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

    public String getCodigo() {
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
            st.setString(1,getCodigo());
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
    
    
    
    
}
