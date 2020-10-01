package Entidades;

import MYSQL.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author lex
 */
public class Especialidad {
    private String nombre;

    public Especialidad(String nombre) {
        this.nombre = nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void insertarEspecialidad() throws SQLException{
        String query = "INSERT INTO ESPECIALIDAD VALUES(?)";
        
        try { 
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,getNombre());
            //Ejecuta el insert
            st.execute();
            st.close();
            verificarConsulta();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }
        
    }
    
    public void verificarConsulta() {
        String query = "SELECT nombre_especialidad FROM CONSULTA WHERE nombre_especialidad=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, getNombre());
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                Consulta consulta = new Consulta(0,100.00,getNombre());
                consulta.insertarConsulta();
            }
            st.close();
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
    }
}

