
package Entidades.Proyectos;

import java.io.Serializable;

public class Informe implements Serializable{
    private int id_inf;
    private int id_pry;
    private float tm,ph,aw;
    private String date;
    private String text;
    private double pob;
    private String ruta;
    private String nombre;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    
    public float getTm() {
        return tm;
    }

    public void setTm(float tm) {
        this.tm = tm;
    }

    public float getPh() {
        return ph;
    }

    public void setPh(float ph) {
        this.ph = ph;
    }

    public float getAw() {
        return aw;
    }

    public void setAw(float aw) {
        this.aw = aw;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getPob() {
        return pob;
    }

    public void setPob(double pob) {
        this.pob = pob;
    }

    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getId_inf() {
        return id_inf;
    }

    public void setId_inf(int id_inf) {
        this.id_inf = id_inf;
    }

    public int getId_pry() {
        return id_pry;
    }

    public void setId_pry(int id_pry) {
        this.id_pry = id_pry;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }
    
    
}
