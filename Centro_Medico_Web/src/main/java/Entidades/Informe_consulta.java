package Entidades;

import MYSQL.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Informe_consulta {
    private int codigo; 
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private int consulta_codigo;
    private String paciente_codigo;
    private String medico_codigo;

    public Informe_consulta(int codigo, String descripcion, LocalDate fecha, LocalTime hora, int consulta_codigo, String paciente_codigo, String medico_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.consulta_codigo = consulta_codigo;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
    }

    public int getCodigo() {
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

    public int getConsulta_codigo() {
        return consulta_codigo;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setCodigo(int codigo) {
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

    public void setConsulta_codigo(int consulta_codigo) {
        this.consulta_codigo = consulta_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }
    
    public void insertarInforme_consulta() throws SQLException{
       String query = "INSERT INTO INFORME_CONSULTA VALUES(?,?,?,?,?,?,?)";
        
       try { 
           //Se establecen los parametros del PreparedStament
           PreparedStatement st = Conexion.getConexion().prepareStatement(query);
           st.setInt(1,getCodigo());
           st.setString(2,getDescripcion());
           st.setDate(3,Date.valueOf(getFecha()));
           st.setTime(4,Time.valueOf(getHora()));
           st.setInt(5,getConsulta_codigo());
           st.setString(6,getPaciente_codigo());
           st.setString(7,getMedico_codigo());
           //Ejecuta el insert
           st.execute();
           st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
}
