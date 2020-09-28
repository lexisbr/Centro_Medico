package Entidades;

import java.sql.Blob;

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
    
    
  
    
    
}
