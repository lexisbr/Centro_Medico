/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

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
    
    
    
    
    
    
}
