package Entidades;

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
    
    
    
    
}
