/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funcionalidades;

import Entidades.Especialidad;
import Entidades.Especializacion;
import MYSQL.Conexion;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author lex
 */
public class Login {
    private String username;
    private String password;
    private String tipo_usuario;

    public Login(String username, String password, String tipo_usuario) {
        this.username = username;
        this.password = password;
        this.tipo_usuario = tipo_usuario;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }
    
    /*
        Metodo que verifica las credenciales ingresadas
    */
    public boolean verificarUsuario() throws SQLException, UnsupportedEncodingException{
        //Verifica si el usuario existe
        if(verificarExistenciaUsuario()){
            //Verifica si la contrasenia es correcta
            if(verificarPassword()){
                return true;
            }
        }
        return false;
    }
    
    /*
        Metodo que verifica la existencia del usuario ingresado
    */
   private boolean verificarExistenciaUsuario() throws SQLException, UnsupportedEncodingException{
        String query = "SELECT codigo FROM "+getTipo_usuario()+" WHERE codigo=?";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getUsername());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            if (!rs.next())
                {
                    //Si el resulset esta vacio significa que no existe usuario.
                    st.close();
                    JOptionPane.showMessageDialog(null,"No existe");
                    return false;
                }else{
                    //Si contiene algo si existe usuario
                    st.close();
                    JOptionPane.showMessageDialog(null,"Usuario correcto");
                    return true;
                }          
        } catch (SQLException e) {
            System.out.println("Error "+e);
            return false;
        }
    }
   
   /*
        Metodo que verifica la contrasenia del usuario dado sea la misma que la contrasenia ingresada
   */
   private boolean verificarPassword() throws SQLException, UnsupportedEncodingException{
        String query = "SELECT password FROM "+getTipo_usuario()+" WHERE codigo=?";
        String passwordDescifrada="";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getUsername());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                //Cuando se obtiene la contrasenia se desencripta y se guarda
                passwordDescifrada=Encriptador.desencriptar(rs.getString("password"));
            }
            rs.close();
            st.close();
            //Verificamos que la contrasenia guardada sea igual a la contrasenia ingresada
            if(passwordDescifrada.equals(getPassword())){
                JOptionPane.showMessageDialog(null,"Contraseña correcta");
                return true;
            }else{
                JOptionPane.showMessageDialog(null,"Contraseña incorrecta");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error "+e);
            return false;
        }
    }
    
    
    
}
