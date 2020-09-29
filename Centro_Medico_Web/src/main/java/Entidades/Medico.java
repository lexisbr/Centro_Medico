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
public class Medico {
    private String codigo;
    private String nombre;
    private String numero_colegiado;
    private String dpi;
    private String telefono;
    private String email;
    private LocalTime hora_entrada;
    private LocalTime hora_salida;
    private LocalDate fecha_inicio;
    private String password;

    public Medico(String codigo, String nombre, String numero_colegiado, String dpi, String telefono, String email, LocalTime hora_entrada, LocalTime hora_salida, LocalDate fecha_inicio, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.numero_colegiado = numero_colegiado;
        this.dpi = dpi;
        this.telefono = telefono;
        this.email = email;
        this.hora_entrada = hora_entrada;
        this.hora_salida = hora_salida;
        this.fecha_inicio = fecha_inicio;
        this.password = password;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setNumero_colegiado(String numero_colegiado) {
        this.numero_colegiado = numero_colegiado;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setHora_entrada(LocalTime hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public void setHora_salida(LocalTime hora_salida) {
        this.hora_salida = hora_salida;
    }

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNumero_colegiado() {
        return numero_colegiado;
    }

    public String getDpi() {
        return dpi;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public LocalTime getHora_entrada() {
        return hora_entrada;
    }

    public LocalTime getHora_salida() {
        return hora_salida;
    }

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public String getPassword() {
        return password;
    }
    
    public void insertarMedico() throws SQLException{
        String query = "INSERT INTO MEDICO VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            st.setString(2,getNombre());
            st.setString(3,getNumero_colegiado());
            st.setString(4,getDpi());
            st.setString(5,getTelefono());
            st.setString(6,getEmail());
            st.setTime(7,Time.valueOf(getHora_entrada()));
            st.setTime(8,Time.valueOf(getHora_salida()));
            st.setDate(9,Date.valueOf(getFecha_inicio()));     
            st.setString(10,getPassword());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    
    
}
