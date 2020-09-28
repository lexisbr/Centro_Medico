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
public class Consulta {
    private int codigo;
    private double costo;
    private String nombre_especialidad;

    public Consulta(int codigo, double costo, String nombre_especialidad) {
        this.codigo = codigo;
        this.costo = costo;
        this.nombre_especialidad = nombre_especialidad;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setNombre_especialidad(String nombre_especialidad) {
        this.nombre_especialidad = nombre_especialidad;
    }

    public int getCodigo() {
        return codigo;
    }

    public double getCosto() {
        return costo;
    }

    public String getNombre_especialidad() {
        return nombre_especialidad;
    }
    
    
    
}
