/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funcionalidades;

import MYSQL.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *
 * @author lex
 */
public class BuscadorCitas {

    private Time hora_entrada;
    private Time hora_salida;
    private String codigo_medico;
    private Date fecha;
    private final SimpleDateFormat formato_tiempo = new SimpleDateFormat("hh:mm");

    public BuscadorCitas(String codigo_medico, Date fecha) {
        this.codigo_medico = codigo_medico;
        this.fecha = fecha;
    }
    
    public void setHora_entrada(Time hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }

    public void setCodigo_medico(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public Time getHora_entrada() {
        return hora_entrada;
    }

    public Time getHora_salida() {
        return hora_salida;
    }

    public String getCodigo_medico() {
        return codigo_medico;
    }

    public Date getFecha() {
        return fecha;
    }
    
    public ArrayList citasMedicasDisponibles() {
        try {
            obtenerHoras();
            String[] horas = obtenerHorasDisponibles();
            ArrayList horasDisponibles = new ArrayList();
            for (int i = 0; i < horas.length; i++) {
                if (!citasMedicas(horas[i]).next()) {
                        horasDisponibles.add(horas[i]);
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }

    public ResultSet citasMedicas(String hora) {
        String query = "SELECT * FROM CITA_MEDICA WHERE hora=? AND fecha=? AND medico_codigo=?";
        
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setTime(1, Time.valueOf(LocalTime.parse(hora)));
            st.setDate(2, getFecha());
            st.setString(3, getCodigo_medico());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {

        }

        return null;
    }

    public void obtenerHoras() {
        String query = "SELECT hora_entrada, hora_salida FROM MEDICO WHERE codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getCodigo_medico());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                setHora_entrada(rs.getTime("hora_entrada"));
                setHora_salida(rs.getTime("hora_salida"));
            }
           
        } catch (SQLException e) {
            System.out.println("error cita " + e);
        }
    }

    public String[] obtenerHorasDisponibles() {
        //Obtenemos la diferencia en milisegundos
        long diferencia_milisegundos = getHora_salida().getTime() - getHora_entrada().getTime();
        //Convertimos la diferencia en horas
        int diferencia_horas = (int) ((diferencia_milisegundos / (1000 * 60 * 60)) % 24);
        //Obtenemos la hora inicial y final
        String[] obtener_horainicio = getHora_entrada().toString().split(":");
        String[] obtener_horafinal = getHora_salida().toString().split(":");
        //Lo convertimos a int
        int hora_inicio = Integer.parseInt(obtener_horainicio[0]);
        int hora_final = Integer.parseInt(obtener_horafinal[0]);
        //Array para guardar las horas entre el intervalo
        String[] guardarHoras = new String[diferencia_horas];
        //Contador para array
        int contador = 0;
        //Se van guardando las hora entre el intervalo
        for (int i = hora_inicio; i < hora_final; i++) {
            guardarHoras[contador] = String.valueOf(i);
            guardarHoras[contador]+= ":00";
            contador++;
        }
        
        return guardarHoras;
    }
    
}

    
