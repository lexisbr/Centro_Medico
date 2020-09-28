package Entidades;

import java.sql.Blob;

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
    
    
    
}
