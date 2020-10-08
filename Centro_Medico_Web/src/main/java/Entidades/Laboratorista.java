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
import java.util.ArrayList;

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
    private int examen_laboratorio_codigo;
    private String examen_nombre;
    private double costo_examen;
    private boolean requiere_orden;

    public void setRequiere_orden(boolean requiere_orden) {
        this.requiere_orden = requiere_orden;
    }

    public boolean isRequiere_orden() {
        return requiere_orden;
    }

    public void setCosto_examen(double costo_examen) {
        this.costo_examen = costo_examen;
    }

    public double getCosto_examen() {
        return costo_examen;
    }

    public void setExamen_nombre(String examen_nombre) {
        this.examen_nombre = examen_nombre;
    }

    public Laboratorista(String codigo, String nombre, String numero_registro, String dpi, String telefono, String email, LocalDate fecha_inicio, String password, int examen_laboratorio_codigo) {
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
    
    public Laboratorista(String codigo){
        this.codigo = codigo;
        
    }
    public Laboratorista(){
    
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

    public void setExamen_laboratorio_codigo(int examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public String getExamen_nombre() {
        return examen_nombre;
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

    public int getExamen_laboratorio_codigo() {
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
            st.setInt(9,getExamen_laboratorio_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    public String obtenerCodigoLaboratorista(String codigo_examen) {
        String query = "SELECT codigo FROM LABORATORISTA WHERE examen_laboratorio_codigo=?";
        String codigo = "";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, codigo_examen);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                codigo = rs.getString("codigo");
            }
            return codigo;

        } catch (SQLException e) {
            return null;
        }
    }
    
    public void generarDias(ArrayList dias,String codigo) throws SQLException {
        for (int i = 0; i < dias.size(); i++) {
            Dias_trabajo nuevoDia=new Dias_trabajo(0, dias.get(i).toString(), codigo);
            nuevoDia.insertarDias_trabajo();
        }
        
    }
    
    /*
        METODO PARA OBTENER DATOS DE LABORATORISTA
    */
    
     public void consultarDatos() throws UnsupportedEncodingException {
        String query = "SELECT L.*,E.nombre AS nombre_examen FROM LABORATORISTA L INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE L.codigo=?";
        
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                setNombre(rs.getString(2));
                setNumero_registro(rs.getString(3));
                setDpi(rs.getString(4));
                setTelefono(rs.getString(5));
                setEmail(rs.getString(6));
                setFecha_inicio(LocalDate.parse(rs.getString(7)));
                setPassword(Encriptador.desencriptar(rs.getString("password")));
                setExamen_laboratorio_codigo(rs.getInt("examen_laboratorio_codigo"));
                setExamen_nombre(rs.getString("nombre_examen"));
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }
     
     /*
        Metodo para actualizar un laboratorista.
    */
    public void actualizarLaboratorista() throws SQLException, UnsupportedEncodingException{
        String query = "UPDATE LABORATORISTA SET nombre=?, numero_registro=?, dpi=?, telefono=?, email=?, fecha_inicio=?, password=?, examen_laboratorio_codigo=? WHERE codigo=?";
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(9,getCodigo());
            st.setString(1,getNombre());
            st.setString(2,getNumero_registro());
            st.setString(3,getDpi());
            st.setString(4,getTelefono());
            st.setString(5,getEmail());
            st.setDate(6,Date.valueOf(getFecha_inicio()));
            st.setString(7,getPassword());
            st.setInt(8,getExamen_laboratorio_codigo());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
    
    
    /*
        METODO PARA OBTENER DATOS DE LABORATORISTA CON EXAMEN 
    */
    
     public void consultarDatosExamen() throws UnsupportedEncodingException {
        String query = "SELECT L.*,E.nombre as examen,E.costo,E.requiere_orden FROM LABORATORISTA L INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=L.examen_laboratorio_codigo WHERE L.codigo=?";
        
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                setNombre(rs.getString(2));
                setNumero_registro(rs.getString(3));
                setDpi(rs.getString(4));
                setTelefono(rs.getString(5));
                setEmail(rs.getString(6));
                setFecha_inicio(LocalDate.parse(rs.getString(7)));
                setPassword(Encriptador.desencriptar(rs.getString("password")));
                setExamen_laboratorio_codigo(rs.getInt("examen_laboratorio_codigo"));
                setExamen_nombre(rs.getString("examen"));
                setCosto_examen(rs.getDouble("costo"));
                System.out.println(rs.getInt("requiere_orden"));
                if(rs.getInt("requiere_orden")==1){
                    setRequiere_orden(true);
                }else{
                    setRequiere_orden(false);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }
    
    
}
