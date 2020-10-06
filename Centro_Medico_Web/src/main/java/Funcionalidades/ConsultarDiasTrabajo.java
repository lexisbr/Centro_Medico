/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funcionalidades;

import MYSQL.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lex
 */
public class ConsultarDiasTrabajo {
    
    
    public ArrayList diasTrabajo(String codigo_lab){
        String query = "SELECT * FROM DIAS_TRABAJO WHERE laboratorista_codigo=?";
        ArrayList list = new ArrayList();
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1,codigo_lab);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(rs.getString("dias"));
            }
            return list;
            
        } catch (SQLException e) {
            return null;
        }   
        
    }
}
