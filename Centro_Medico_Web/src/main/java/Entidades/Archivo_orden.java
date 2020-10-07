package Entidades;

import Funcionalidades.Encriptador;
import MYSQL.Conexion;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author lex
 */
public class Archivo_orden {

    private InputStream archivo;
    private int orden_examen_codigo;

    public Archivo_orden(InputStream archivo, int orden_examen_codigo) {
        this.archivo = archivo;
        this.orden_examen_codigo = orden_examen_codigo;
    }

    public Archivo_orden(int orden_examen_codigo) {
        this.orden_examen_codigo = orden_examen_codigo;
    }

    public InputStream getArchivo() {
        return archivo;
    }

    public int getOrden_examen_codigo() {
        return orden_examen_codigo;
    }

    public void setArchivo(InputStream archivo) {
        this.archivo = archivo;
    }

    public void setOrden_examen_codigo(int orden_examen_codigo) {
        this.orden_examen_codigo = orden_examen_codigo;
    }

    public void insertarArchivo_orden() throws SQLException {
        String query = "INSERT INTO ARCHIVO_ORDEN VALUES(?,?)";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setBlob(1, getArchivo());
            st.setInt(2, getOrden_examen_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }

    public void obtenerArchivo() {
        String query = "SELECT * FROM ARCHIVO_ORDEN WHERE orden_examen_codigo=?";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1, getOrden_examen_codigo());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                setArchivo(rs.getBlob(1).getBinaryStream());
            }
        } catch (SQLException e) {
        }
    }

}
