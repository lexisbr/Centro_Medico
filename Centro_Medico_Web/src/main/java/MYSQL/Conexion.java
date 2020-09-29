package MYSQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lex
 */
public class Conexion {
    private static Connection conexion = null;
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "root";
    private static final String password = "5200fcb1LEXIS.";
    private static final String url = "jdbc:mysql://localhost/CENTRO_MEDICO?allowPublicKeyRetrieval=true&useSSL=false";
    private static final int MYSQL_DUPLICATE_PK = 1062;
     
    
     /**
     * Funcion que crea la conexion con la DB
     * @return
     * @throws ClassNotFoundException
     * @throws InstantiationException
     * @throws IllegalAccessException 
     */
    public static void iniciarConexion() throws ClassNotFoundException, InstantiationException, IllegalAccessException{
        /*Metodo para hacer conexion con DB*/
        conexion = null;
        try {
            //Se llama al jdbc
            Class.forName(driver);
            conexion = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion exitosa");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(">>>Error al conectar " + e);
        }
    } 
    
     /**
     * Obtenemos la conexion
     * @return Connection
     */
    public static Connection getConexion() {
        return conexion;
    }

    /**
     * Establecemos la conexion
     * @param conexion 
     */
    public static void setConexion(Connection conexion) {
        Conexion.conexion = conexion;
    }
    
    /**
     * Cerramos la conexion si esta abierta
     */
    public static void cerrarConexion() {
        try {
            if(conexion.isClosed() == false){
                conexion.close();       
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
