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
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Cita_medica {
    private String codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private String paciente_codigo;
    private String medico_codigo;
    private int consulta_codigo;

    public Cita_medica(String codigo, LocalDate fecha, LocalTime hora, String paciente_codigo, String medico_codigo, int consulta_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
        this.consulta_codigo = consulta_codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }

    public void setConsulta_codigo(int consulta_codigo) {
        this.consulta_codigo = consulta_codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public int getConsulta_codigo() {
        return consulta_codigo;
    }
   
    public void insertarCita_medica() throws SQLException{
        String query = "INSERT INTO CITA_MEDICA VALUES(?,?,?,?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            st.setDate(2,Date.valueOf(getFecha()));
            st.setTime(3,Time.valueOf(getHora()));
            st.setString(4,getPaciente_codigo());
            st.setString(5,getMedico_codigo());
            st.setInt(6,getConsulta_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    
}
