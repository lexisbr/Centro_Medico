/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Funcionalidades.Encriptador;
import MYSQL.Conexion;
import java.io.UnsupportedEncodingException;
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
public class Laboratorista {
    private String codigo;
    private String nombre;
    private String numero_registro;
    private String dpi;
    private String telefono;
    private String email;
    private LocalDate fecha_inicio;
    private String password;
    private String examen_laboratorio_codigo;

    public Laboratorista(String codigo, String nombre, String numero_registro, String dpi, String telefono, String email, LocalDate fecha_inicio, String password, String examen_laboratorio_codigo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.numero_registro = numero_registro;
        this.dpi = dpi;
        this.telefono = telefono;
        this.email = email;
        this.fecha_inicio = fecha_inicio;
        this.password = password;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setNumero_registro(String numero_registro) {
        this.numero_registro = numero_registro;
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

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    

    public String getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNumero_registro() {
        return numero_registro;
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

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public String getPassword() {
        return password;
    }

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }
    
    public void insertarLaboratorista() throws SQLException, UnsupportedEncodingException{
        String query = "INSERT INTO LABORATORISTA VALUES(?,?,?,?,?,?,?,?,?)";
        
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            st.setString(2,getNombre());
            st.setString(3,getNumero_registro());
            st.setString(4,getDpi());
            st.setString(5,getTelefono());
            st.setString(6,getEmail());
            st.setDate(7,Date.valueOf(getFecha_inicio()));     
            st.setString(8,getPassword());
            st.setString(9,getExamen_laboratorio_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
}
