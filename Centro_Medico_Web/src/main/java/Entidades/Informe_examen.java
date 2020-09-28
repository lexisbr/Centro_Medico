/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Informe_examen {
    private String codigo;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private String examen_laboratorio_codigo;
    private String paciente_codigo;
    private String laboratorista_codigo;

    public Informe_examen(String codigo, String descripcion, LocalDate fecha, LocalTime hora, String examen_laboratorio_codigo, String paciente_codigo, String laboratorista_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
        this.paciente_codigo = paciente_codigo;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
    
    
}
