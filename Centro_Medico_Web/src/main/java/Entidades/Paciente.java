/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Funcionalidades.Encriptador;
import MYSQL.Conexion;
import com.google.protobuf.Message;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Base64;
import javax.swing.JOptionPane;
import sun.jvm.hotspot.ui.action.ShowAction;
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
    
    public Paciente(String codigo){
        this.codigo = codigo;
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
   
    
        
    /*
        Metodo para insertar un paciente nuevo.
    */
    public void insertarPaciente() throws SQLException, UnsupportedEncodingException{
        
        String query = "INSERT INTO PACIENTE VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
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
    /*
        METODO PARA OBTENER DATOS DE PACIENTE
    */
    
    public void consultarDatos() throws UnsupportedEncodingException{
        String query = "SELECT * FROM PACIENTE WHERE codigo=?";
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                setNombre(rs.getString(2));
                setSexo(rs.getString(3));
                setFecha_nacimiento(rs.getDate(4).toLocalDate());
                setDpi(rs.getString(5));
                setTelefono(rs.getString(6));
                setPeso(rs.getString(7));
                setTipo_sangre(rs.getString(8));
                setEmail(rs.getString(9));
                setPassword(Encriptador.desencriptar(rs.getString("password")));
            }
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
    
     /*
        Metodo para actualizar un paciente.
    */
    public void actualizarPaciente() throws SQLException, UnsupportedEncodingException{
        String query = "UPDATE PACIENTE SET nombre=?, sexo=?, fecha_nacimiento=?, dpi=?, telefono=?, peso=?, tipo_sangre=?, email=?, password=? WHERE codigo=?";
        
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(10,getCodigo());
            st.setString(1,getNombre());
            st.setString(2,getSexo());
            st.setDate(3,Date.valueOf(getFecha_nacimiento()));
            st.setString(4,getDpi());
            st.setString(5,getTelefono());
            st.setString(6,getPeso());
            st.setString(7,getTipo_sangre());
            st.setString(8,getEmail());
            st.setString(9,getPassword());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
}
