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

/**
 *
 * @author lex
 */
public class BuscadorPaciente {

    /*
        METODO PARA MOSTRAR TODOS LOS PACIENTES
     */
    public ResultSet mostrarPacientes() {
        String query = "SELECT * FROM PACIENTE";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        METODO PARA BUSCAR PACIENTE POR CODIGO
     */
    public ResultSet buscadorCodigo(String codigo) throws SQLException {
        String query = "SELECT * FROM PACIENTE WHERE codigo LIKE '%" + codigo + "%'";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }

    /*
        OBTENER LOS INGRESOS GENERADOR POR PACIENTE
     */
    public ResultSet mostrarIngresos(String fecha1, String fecha2) {
        String query = "SELECT P.nombre AS paciente,P.codigo,SUM(C.costo+E.costo) AS ingresos FROM INFORME_CONSULTA I INNER JOIN CONSULTA C ON C.codigo=I.consulta_codigo INNER JOIN PACIENTE P ON I.paciente_codigo=P.codigo INNER JOIN INFORME_EXAMEN IL ON IL.paciente_codigo=P.codigo INNER JOIN EXAMEN_LABORATORIO E ON IL.examen_laboratorio_codigo=E.codigo WHERE I.fecha BETWEEN ? AND ? GROUP BY P.codigo ORDER BY ingresos DESC";
        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConexion().prepareStatement(query);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (SQLException e) {
            return null;
        }
    }
}
