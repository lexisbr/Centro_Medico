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

/**
 *
 * @author lex
 */
public class Administrador {
    private String codigo;
    private String nombre;
    private String dpi;
    private String password;

    public Administrador(String codigo, String nombre, String dpi, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.dpi = dpi;
        this.password = password;
    }
    
    public Administrador(String codigo){
        this.codigo = codigo;

    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
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

    public String getDpi() {
        return dpi;
    }

    public String getPassword() {
        return password;
    }
    
    
    public void insertarAdministrador() throws SQLException, UnsupportedEncodingException{
        String query = "INSERT INTO ADMINISTRADOR VALUES(?,?,?,?)";
        
        try { 
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            st.setString(2,getNombre());
            st.setString(3,getDpi()); 
            st.setString(4,getPassword());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    public void consultarDatos() throws UnsupportedEncodingException{
        String query = "SELECT * FROM ADMINISTRADOR WHERE codigo=?";
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                setNombre(rs.getString("nombre"));
                setDpi(rs.getString("dpi"));
                setPassword(Encriptador.desencriptar(rs.getString("password")));
            }
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
    
    /*
        Metodo para actualizar un laboratorista.
    */
    public void actualizarAdmin() throws SQLException, UnsupportedEncodingException{
        String query = "UPDATE ADMINISTRADOR SET nombre=?, dpi=?, password=? WHERE codigo=?";
        try {
            //Se encripta la password
            setPassword(Encriptador.encriptar(getPassword()));
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(4,getCodigo());
            st.setString(1,getNombre());
            st.setString(2,getDpi());
            st.setString(3,getPassword());
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
    }
    
    
    
}
