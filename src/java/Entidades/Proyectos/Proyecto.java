
package Entidades.Proyectos;

public class Proyecto {
    private int id,id_usr,bacteria,tipo;
    private String nombre,FechaDeInicio;
    private int objetivo;

    public Proyecto(int id, int id_usr, int bacteria, int tipo, String nombre, String FechaDeInicio) {
        this.id = id;
        this.id_usr = id_usr;
        this.bacteria = bacteria;
        this.tipo = tipo;
        this.nombre = nombre;
        this.FechaDeInicio = FechaDeInicio;
    }

    public int getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(int objetivo) {
        this.objetivo = objetivo;
    }

    
    
    public Proyecto() {
    }
    
    
    
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
    
    public String getFechaDeInicio() {
        return FechaDeInicio;
    }

    public void setFechaDeInicio(String FechaDeInicio) {
        this.FechaDeInicio = FechaDeInicio;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public int getId_usr() {
        return id_usr;
    }

    public void setId_usr(int id_usr) {
        this.id_usr = id_usr;
    }

    public int getBacteria() {
        return bacteria;
    }

    public void setBacteria(int bacteria) {
        this.bacteria = bacteria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
