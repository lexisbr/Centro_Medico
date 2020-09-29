/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import MYSQL.Conexion;
import java.sql.Blob;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Cita_examen {
    private int codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private Blob orden_medico;
    private String paciente_codigo;
    private String laboratorista_codigo;

    public Cita_examen(int codigo, LocalDate fecha, LocalTime hora, Blob orden_medico, String paciente_codigo, String laboratorista_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.orden_medico = orden_medico;
        this.paciente_codigo = paciente_codigo;        
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public void setOrden_medico(Blob orden_medico) {
        this.orden_medico = orden_medico;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public Blob getOrden_medico() {
        return orden_medico;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }
    
    public void insertarCita_examen() throws SQLException{
        String query = "INSERT INTO CITA_EXAMEN VALUES(?,?,?,?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            st.setDate(2,Date.valueOf(getFecha()));
            st.setTime(3,Time.valueOf(getHora()));
            st.setBlob(4,getOrden_medico());
            st.setString(5,getPaciente_codigo());
            st.setString(6,getLaboratorista_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    
    
    
    
}
