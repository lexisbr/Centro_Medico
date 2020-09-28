/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Cita_examen {
    private int codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private Blob archivo;
    private String paciente_codigo;
    private String examen_laboratorista_codigo;
    private String laboratorista_codigo;

    public Cita_examen(int codigo, LocalDate fecha, LocalTime hora, Blob archivo, String paciente_codigo, String examen_laboratorista_codigo, String laboratorista_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.archivo = archivo;
        this.paciente_codigo = paciente_codigo;
        this.examen_laboratorista_codigo = examen_laboratorista_codigo;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setExamen_laboratorista_codigo(String examen_laboratorista_codigo) {
        this.examen_laboratorista_codigo = examen_laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public String getExamen_laboratorista_codigo() {
        return examen_laboratorista_codigo;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }
    
    
    
    
    
    
    
}
