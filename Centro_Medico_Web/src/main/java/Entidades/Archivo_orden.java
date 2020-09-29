package Entidades;

import MYSQL.Conexion;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lex
 */
public class Archivo_orden {        
    private Blob archivo;
    private int orden_examen_codigo;

    public Archivo_orden(Blob archivo, int orden_examen_codigo) {
        this.archivo = archivo;
        this.orden_examen_codigo = orden_examen_codigo;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public int getOrden_examen_codigo() {
        return orden_examen_codigo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public void setOrden_examen_codigo(int orden_examen_codigo) {
        this.orden_examen_codigo = orden_examen_codigo;
    }
    
    public void insertarArchivo_orden() throws SQLException{
        String query = "INSERT INTO ARCHIVO_ORDEN VALUES(?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setBlob(1,getArchivo());
            st.setInt(2,getOrden_examen_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
}
