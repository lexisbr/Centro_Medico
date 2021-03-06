/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import MYSQL.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author lex
 */
public class Orden_examen {

    private int codigo;
    private String descripcion;
    private String medico_codigo;
    private String paciente_codigo;
    private int examen_laboratorio_codigo;

    public Orden_examen(int codigo, String descripcion, String medico_codigo, String paciente_codigo, int examen_laboratorio_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.medico_codigo = medico_codigo;
        this.paciente_codigo = paciente_codigo;
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

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public int getExamen_laboratorio_codigo() {
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

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public void setExamen_laboratorio_codigo(int examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public void insertarOrden_examen() throws SQLException {
        String query = "INSERT INTO ORDEN_EXAMEN VALUES(?,?,?,?,?)";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1, getCodigo());
            st.setString(2, getDescripcion());
            st.setString(3, getMedico_codigo());
            st.setString(4, getPaciente_codigo());
            st.setInt(5, getExamen_laboratorio_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }

    }

    public int insertarOrden() {
        String query = "INSERT INTO ORDEN_EXAMEN VALUES(?,?,?,?,?)";
        int resultado = 0;
        try {

            PreparedStatement st = Conexion.getConexion().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, getCodigo());
            st.setString(2, getDescripcion());
            st.setString(3, getMedico_codigo());
            st.setString(4, getPaciente_codigo());
            st.setInt(5, getExamen_laboratorio_codigo());
            st.execute();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                resultado = rs.getInt(1);
            }
            rs.close();
            st.close();
            return resultado;

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }
    }

}
