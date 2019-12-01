
package Entidades.Proyectos;

public class Poblacion {
    private int id_pob, id_pry;
    private float oxigeno, temperatura, ph;
    private int tipo, pob_in;
    private String fi,ff;

    public String getFi() {
        return fi;
    }

    public void setFi(String fi) {
        this.fi = fi;
    }

    public String getFf() {
        return ff;
    }

    public void setFf(String ff) {
        this.ff = ff;
    }
    
    

    
    public int getId_pob() {
        return id_pob;
    }

    public void setId_pob(int id_pob) {
        this.id_pob = id_pob;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
    
    public int getId_pry() {
        return id_pry;
    }

    public void setId_pry(int id_pry) {
        this.id_pry = id_pry;
    }

    public float getOxigeno() {
        return oxigeno;
    }

    public void setOxigeno(float oxigeno) {
        this.oxigeno = oxigeno;
    }

    public float getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(float temperatura) {
        this.temperatura = temperatura;
    }

    public float getPh() {
        return ph;
    }

    public void setPh(float ph) {
        this.ph = ph;
    }

    public int getPob_in() {
        return pob_in;
    }

    public void setPob_in(int pob_in) {
        this.pob_in = pob_in;
    }

    

}
