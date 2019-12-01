
package Entidades.Users;

import Backend.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Usuario extends Cuentas {
    private String acividad;
    private String pais;

    public Usuario validarUsuario(String user,String clave){
        Usuario u = null;
        Connection c = null;
        try{
            c = Conexion.getConecction();
            String q = "Select * from musuario where email_usr=? and pas_usr = ?;";
            PreparedStatement s = c.prepareStatement(q);
            s.setString(1, user);
            s.setString(2,clave);
            ResultSet rs = s.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id_usr"));
                u.setNombre(rs.getString("nom_usr"));
                u.setEmail(rs.getString("email_usr"));
                u.setPassword(rs.getString("pas_usr"));
                String q2 = "select * FROM musuarios WHERE id_usr="+rs.getInt("id_usr");
                PreparedStatement set = c.prepareStatement(q2);
                ResultSet rs2 =set.executeQuery();
                if (rs2.next()) {
                    u.setRol(rs2.getInt("id_rol"));
                    u.setAcividad(""+rs2.getInt("id_act"));
                    u.setPais(""+rs2.getInt("id_pas"));
                } 
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            u = null;
        }
        return u;
    }
    
    public Usuario() {
    }

    public Usuario(String acividad, String pais) {
        this.acividad = acividad;
        this.pais = pais;
    }

    public Usuario(int id,String acividad, String pais, String email, String nombre, String password, int rol) {
        super(id,email, nombre, password, rol);
        this.acividad = acividad;
        this.pais = pais;
    }

    public String getAcividad() {
        return acividad;
    }

    public void setAcividad(String acividad) {
        this.acividad = acividad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
    
}
