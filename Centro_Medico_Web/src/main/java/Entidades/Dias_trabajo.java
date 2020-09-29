package Entidades;

import MYSQL.Conexion;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lex
 */
public class Dias_trabajo {
    private int codigo;
    private String dias;
    private String laboratorista_codigo;

    public Dias_trabajo(int codigo, String dias, String laboratorista_codigo) {
        this.codigo = codigo;
        this.dias = dias;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getDias() {
        return dias;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setDias(String dias) {
        this.dias = dias;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
    public void insertarDias_trabajo() throws SQLException{
        String query = "INSERT INTO DIAS_TRABAJO VALUES(?,?,?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setInt(1,getCodigo());
            st.setString(2,getDias());
            st.setString(3,getLaboratorista_codigo());
            //Ejecuta el insert
            st.execute();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    
}
