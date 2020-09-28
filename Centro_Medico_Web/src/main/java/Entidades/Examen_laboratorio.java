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
public class Examen_laboratorio {
    private String codigo;
    private String nombre;
    private boolean requiere_orden;
    private String descripcion;
    private double costo;
    private String tipo_archivo;
    private String laboratorista_codigo;

    public Examen_laboratorio(String codigo, String nombre, boolean requiere_orden, String descripcion, double costo, String tipo_archivo, String laboratorista_codigo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.requiere_orden = requiere_orden;
        this.descripcion = descripcion;
        this.costo = costo;
        this.tipo_archivo = tipo_archivo;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setRequiere_orden(boolean requiere_orden) {
        this.requiere_orden = requiere_orden;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setTipo_archivo(String tipo_archivo) {
        this.tipo_archivo = tipo_archivo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public boolean isRequiere_orden() {
        return requiere_orden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getCosto() {
        return costo;
    }

    public String getTipo_archivo() {
        return tipo_archivo;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }
    
    
    
    
    
    
}
