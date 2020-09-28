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
public class Orden_examen {
    private int codigo;
    private String descripcion;
    private String medico_codigo;
    private String paciento_codigo;
    private String examen_laboratorio_codigo;

    public Orden_examen(int codigo, String descripcion, String medico_codigo, String paciento_codigo, String examen_laboratorio_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.medico_codigo = medico_codigo;
        this.paciento_codigo = paciento_codigo;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public String getPaciento_codigo() {
        return paciento_codigo;
    }

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }

    public void setPaciento_codigo(String paciento_codigo) {
        this.paciento_codigo = paciento_codigo;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    
    
    
    
    
    
    
}
