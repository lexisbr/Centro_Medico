/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import MYSQL.Conexion;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lex
 */
public class Especializacion {
    private String especialidad_nombre;
    private String medico_codigo;

    public Especializacion(String especialidad_nombre, String medico_codigo) {
        this.especialidad_nombre = especialidad_nombre;
        this.medico_codigo = medico_codigo;
    }

    public String getEspecialidad_nombre() {
        return especialidad_nombre;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setEspecialidad_nombre(String especialidad_nombre) {
        this.especialidad_nombre = especialidad_nombre;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }
    
    public void insertarEspecializacion() throws SQLException{
        String query = "INSERT INTO ESPECIALIZACION VALUES(?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getEspecialidad_nombre());
            st.setString(2,getMedico_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }   


    
}
