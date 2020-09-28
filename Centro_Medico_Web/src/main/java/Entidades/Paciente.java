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
import java.time.LocalDate;
import sun.jvm.hotspot.utilities.soql.SOQLException;

/**
 *
 * @author lex
 */
public class Paciente {
    private String codigo;
    private String nombre;
    private String sexo;
    private LocalDate fecha_nacimiento;
    private String dpi;
    private String telefono;
    private String peso; 
    private String tipo_sangre; 
    private String email; 
    private String password; 

    public Paciente(String codigo, String nombre, String sexo, LocalDate fecha_nacimiento, String dpi, String telefono, String peso, String tipo_sangre, String email, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.sexo = sexo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.dpi = dpi;
        this.telefono = telefono;
        this.peso = peso;
        this.tipo_sangre = tipo_sangre;
        this.email = email;
        this.password = password;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getSexo() {
        return sexo;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public String getDpi() {
        return dpi;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getPeso() {
        return peso;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    
    public void insertarPaciente() throws SQLException{
        String query = "INSERT INTO PACIENTE VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            st.setString(2,getNombre());
            st.setString(3,getSexo());
            st.setDate(4,Date.valueOf(getFecha_nacimiento()));
            st.setString(5,getDpi());
            st.setString(6,getTelefono());
            st.setString(7,getPeso());
            st.setString(8,getTipo_sangre());
            st.setString(9,getEmail());
            st.setString(10,getPassword());
            //Ejecuta el insert
            st.execute();
            st.close();
            
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    
}
