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
    private String codigo;
    private Date fecha;
    private final SimpleDateFormat formato_tiempo = new SimpleDateFormat("hh:mm");

    public BuscadorCitas(String codigo, Date fecha) {
        this.codigo = codigo;
        this.fecha = fecha;
    }
    
    public void setHora_entrada(Time hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public String getCodigo() {
        return codigo;
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
                        horasDisponibles.add(LocalTime.of(Integer.valueOf(horas[i]),0));
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }

    public ResultSet citasMedicas(String hora) {
        String query = "SELECT * FROM CITA_MEDICA WHERE hora=? AND fecha=? AND medico_codigo=?";
        int horaEntera=Integer.valueOf(hora);
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setTime(1, Time.valueOf(LocalTime.of(horaEntera,0)));
            st.setDate(2, getFecha());
            st.setString(3, getCodigo());
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
            st.setString(1, getCodigo());
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
            contador++;
        }
        
        return guardarHoras;
    }
    
   public ArrayList citasExamenDisponibles() {
        try {
            ArrayList horasDisponibles = new ArrayList();
            String hora ="";
            for (int i = 0; i < 24; i++) {
                if(i<=9){
                    hora = "0"+i+":00";
                }else{
                    hora = i+":00";
                }
                if (!citasExamen(hora).next()) {
                        horasDisponibles.add(hora);
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }
   
   public ResultSet citasExamen(String hora) {
        String query = "SELECT * FROM CITA_EXAMEN WHERE hora=? AND fecha=? AND laboratorista_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setTime(1, Time.valueOf(LocalTime.parse(hora)));
            st.setDate(2, getFecha());
            st.setString(3, getCodigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException e) {
             System.out.println("Error cita examen "+e);
        }

        return null;
    }
   

}

    
