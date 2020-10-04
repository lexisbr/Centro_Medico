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
import java.sql.ResultSet;
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
    private String nombre_especialidad;


    public Medico(String codigo, String nombre, String numero_colegiado, String dpi, String telefono, String email, LocalTime hora_entrada, LocalTime hora_salida, LocalDate fecha_inicio, String password, String nombre_especialidad) {
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
        this.nombre_especialidad = nombre_especialidad;
    }
    
    public Medico(String codigo){
        this.codigo = codigo;
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

    public void setNombre_especialidad(String nombre_especialidad) {
        this.nombre_especialidad = nombre_especialidad;
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

    public String getNombre_especialidad() {
        return nombre_especialidad;
    }

    
    /*
        METODO PARA INSERTAR MEDICO
    */
       
    public void insertarMedico() throws SQLException, UnsupportedEncodingException{
        String query = "INSERT INTO MEDICO VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
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
            verificarEspecialidad();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    /*
        METODO PARA GUARDAR LA ESPECIALIDAD DEL MEDICO, SINO EXISTE LA CREA
    */
    
    public void verificarEspecialidad() {
        String query = "SELECT nombre FROM ESPECIALIDAD WHERE nombre=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getNombre_especialidad());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                Especialidad esp = new Especialidad(getNombre_especialidad());
                esp.insertarEspecialidad();
                Especializacion espz = new Especializacion(getNombre_especialidad(), getCodigo());
                espz.insertarEspecializacion();
            } else {
                Especializacion espz = new Especializacion(getNombre_especialidad(), getCodigo());
                espz.insertarEspecializacion();
            }
            st.close();
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }
    
    
         /*
            METODO PARA OBTENER DATOS DE PACIENTE
        */
    
     public void consultarDatos() throws UnsupportedEncodingException {
        String query = "SELECT * FROM MEDICO WHERE codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                setNombre(rs.getString(2));
                setNumero_colegiado(rs.getString(3));
                setDpi(rs.getString(4));
                setTelefono(rs.getString(5));
                setEmail(rs.getString(6));
                setHora_entrada(LocalTime.parse(String.valueOf(rs.getTime(7))));
                setHora_salida(LocalTime.parse(String.valueOf(rs.getTime(8))));
                setFecha_inicio(LocalDate.parse(rs.getString(9)));
                setPassword(Encriptador.desencriptar(rs.getString("password")));
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }
    
    /*
        Metodo para actualizar un medico.
    */
    public void actualizarMedico() throws SQLException, UnsupportedEncodingException{
        String query = "UPDATE MEDICO SET nombre=?, numero_colegiado=?, dpi=?, telefono=?, email=?, hora_entrada=?, hora_salida=?, fecha_inicio=?, password=? WHERE codigo=?";
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(10,getCodigo());
            st.setString(1,getNombre());
            st.setString(2,getNumero_colegiado());
            st.setString(3,getDpi());
            st.setString(4,getTelefono());
            st.setString(5,getEmail());
            st.setTime(6,Time.valueOf(getHora_entrada()));
            st.setTime(7,Time.valueOf(getHora_salida()));
            st.setDate(8,Date.valueOf(getFecha_inicio()));
            st.setString(9,getPassword());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
     
     
     
}

    
