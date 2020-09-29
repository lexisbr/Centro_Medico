package Entidades;

import MYSQL.Conexion;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lex
 */
public class Archivo_informe {
    private Blob archivo;
    private String informe_examen_codigo;

    public Archivo_informe(Blob archivo, String informe_examen_codigo) {
        this.archivo = archivo;
        this.informe_examen_codigo = informe_examen_codigo;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public String getInforme_examen_codigo() {
        return informe_examen_codigo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public void setInforme_examen_codigo(String informe_examen_codigo) {
        this.informe_examen_codigo = informe_examen_codigo;
    }
    
    public void insertarArchivo_informe() throws SQLException{
        String query = "INSERT INTO ARCHIVO_INFORME VALUES(?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setBlob(1,getArchivo());
            st.setString(2,getInforme_examen_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
  
    
    
}
