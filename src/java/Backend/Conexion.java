
package Backend;

import Entidades.Proyectos.Grafica;
import Entidades.Proyectos.Informe;
import Entidades.Proyectos.Pais;
import Entidades.Proyectos.Poblacion;
import Entidades.Proyectos.Proyecto;
import Entidades.Users.*;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Conexion {
   
    public static Connection getConecction(){
        String url,username,password;
        url ="jdbc:mysql://localhost/microuniverse";
        username = "root";
        password = "n0m3l0";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(url,username,password);
            
        }catch(Exception e){
            System.out.println("no conectado");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return con;
    }
    
//Usuarios
    
    public static boolean agregarUsuario(Usuario u){    
        try{
            Connection c = Conexion.getConecction();
            
            String x = "insert into musuario (nom_usr,pas_usr,email_usr)"
                    + " values(?,?,?)";
            PreparedStatement set1 = c.prepareStatement(x);
            
            set1.setString(1,u.getNombre());
            set1.setString(2,u.getPassword());
            set1.setString(3,u.getEmail());
            
            int estado1 = set1.executeUpdate();
            
            String q = "insert into musuarios (id_rol,id_act,id_pas)"
                    + " values(?,?,?)";
            PreparedStatement set = c.prepareStatement(q);
            
            set.setInt(1, u.getRol());
            set.setInt(2,Integer.parseInt(u.getAcividad()));
            set.setInt(3,Integer.parseInt(u.getPais()));
            
            int estado = set.executeUpdate();
            c.close();
            return true;
        }catch(Exception e){
            
            return false;
        }
    }
    
    public static boolean eliminarUsuario(int id){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "delete from musuario where id_usr="+id+" limit 1";
            PreparedStatement set1 = c.prepareStatement(x);
            int estado1 = set1.executeUpdate();
            
            String q = "DELETE FROM musuarios WHERE id_usr="+id+" limit 1";
            PreparedStatement set = c.prepareStatement(q);
            int estado = set.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static Usuario getUsuarioById(int id){
        Usuario u = new Usuario();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from musuario where id_usr="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id_usr"));
                u.setNombre(rs.getString("nom_usr"));
                u.setEmail(rs.getString("email_usr"));
                u.setPassword(rs.getString("pas_usr"));
            }
            String q = "select * FROM musuarios WHERE id_pry="+id;
            PreparedStatement set = c.prepareStatement(q);
            rs=set.executeQuery();
            if (rs.next()) {
                u.setAcividad(""+rs.getInt("id_act"));
                u.setPais(""+rs.getInt("id_pas"));
            }
            c.close();
            return u;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return u;
        }
    } 
    
    public static ArrayList<Usuario> getUsuarios(){
        ArrayList<Usuario> usuarios = new ArrayList();
        
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from musuario";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usr"));
                u.setNombre(rs.getString("nom_usr"));
                u.setEmail(rs.getString("email_usr"));
                u.setPassword(rs.getString("pas_usr"));
            
                String q = "SELECT * FROM musuarios where id_usr="+rs.getInt("id_usr");
                PreparedStatement set = c.prepareStatement(q);
                ResultSet rs1=set.executeQuery();
                if (rs1.next()) {
                    u.setAcividad(""+rs1.getInt("id_act"));
                    u.setPais(""+rs1.getInt("id_pas"));
                }
                usuarios.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return usuarios;
    } 
    
    public static boolean editarUsuario(Usuario u){
        try{
            Connection c = Conexion.getConecction();
            String x = "update musuario set nom_usr = ?, pas_usr = ?, email_usr =? where id_usr = ?";
            PreparedStatement set1 = c.prepareStatement(x);
            set1.setString(1, u.getNombre());
            set1.setString(2, u.getPassword());
            set1.setString(3, u.getEmail());
            set1.setInt(4, u.getId());
            int estado1 = set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
//Proyectos
    public static boolean agregarProyecto(Proyecto p){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "insert into mproyectos (id_bac,id_usr,id_typ,nom_pry,fdi_pry,id_obj)"
                    + " values(?,?,?,?,?,?)";
            PreparedStatement set1 = c.prepareStatement(x);
            set1.setInt(1,p.getBacteria());
            set1.setInt(2,p.getId_usr());
            set1.setInt(3,p.getTipo());
            set1.setString(4,p.getNombre());
            set1.setString(5,p.getFechaDeInicio());
            set1.setInt(6,p.getObjetivo());
            
            int estado1 = set1.executeUpdate();
            c.close();
            return true;
        }catch(Exception e){
            System.out.println("AE");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static boolean eliminarProyecto(int id){
        try{
            Connection c = Conexion.getConecction();
            Conexion.eliminarPoblacionA(id);
            String x = "delete from mresultados where id_pry="+id+" limit 1";
            PreparedStatement set1 = c.prepareStatement(x);
            for (Poblacion ps:Conexion.getPoblacion(id)) {
                Conexion.eliminarPoblacion(ps.getId_pob());
            }
            int estado1 = set1.executeUpdate();
            
             x = "delete from mproyectos where id_pry="+id+" limit 1";
            set1 = c.prepareStatement(x);
            set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static Proyecto getProyectoById(int id){
        Proyecto u = new Proyecto();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mproyectos where id_pry="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id_pry"));
                u.setNombre(rs.getString("nom_pry"));
                u.setBacteria(rs.getInt("id_bac"));
                u.setId_usr(rs.getInt("id_usr"));
                u.setFechaDeInicio(rs.getString("fdi_pry"));
                u.setTipo(rs.getInt("id_typ"));
                u.setObjetivo(rs.getInt("id_obj"));
            }
            c.close();
            return u;
        }catch(Exception e){
            System.out.println("-------Error getProyectoById----------");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            System.out.println("-------Error getProyectoById----------");
            return u;
        }
    } 
    
    public static ArrayList<Proyecto> getProyectos (){
        ArrayList<Proyecto> Proyectos = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mproyectos";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Proyecto u = new Proyecto();
                u.setId(rs.getInt("id_pry"));
                u.setNombre(rs.getString("nom_pry"));
                u.setBacteria(rs.getInt("id_bac"));
                u.setId_usr(rs.getInt("id_usr"));
                u.setFechaDeInicio(rs.getString("fdi_pry"));
                u.setTipo(rs.getInt("id_typ"));
                u.setObjetivo(rs.getInt("id_obj"));
                Proyectos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Proyectos;
    }
    
    public static ArrayList<Proyecto> getProyectosCom (int id){
        ArrayList<Proyecto> Proyectos = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mcolaboradores where id_usr="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Proyecto u = Conexion.getProyectoById(rs.getInt("id_pry"));
                Proyectos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Proyectos;
    }
    
    public static boolean editarProyecto(Proyecto u){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "update mproyectos set nom_pry=?, id_typ=? where id_pry = ?";
            PreparedStatement set1 = c.prepareStatement(x);
            set1.setString(1, u.getNombre());
            set1.setInt(2, u.getTipo());
            set1.setInt(3, u.getId());
            int estado1 = set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
//Poblaciones    
    public static boolean agregarPoblacion(Poblacion p){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "insert into mpoblaciones (id_pry,id_typ,top_pob,pho_pob,oxo_pob,ini_pob,fi_pob)"
                    + " values(?,?,?,?,?,?,?)";
            PreparedStatement set1 = c.prepareStatement(x);
            
            set1.setInt(1,p.getId_pry());
            set1.setInt(2,p.getTipo());
            set1.setFloat(3,p.getTemperatura());
            set1.setFloat(4,p.getPh());
            set1.setFloat(5,p.getOxigeno());
            set1.setFloat(6,p.getPob_in());
            set1.setString(7, p.getFi());
            
            int estado1 = set1.executeUpdate();
            c.close();
            return true;
        }catch(Exception e){
            System.out.println("AE");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static boolean eliminarPoblacion(int id){
        try{
            Connection c = Conexion.getConecction();
            
            String xi = "delete from minformes where id_pob="+id;
            PreparedStatement set1 = c.prepareStatement(xi);
            int estado1 = set1.executeUpdate();
            String x = "delete from mpoblaciones where id_pob="+id+" limit 1";
            set1 = c.prepareStatement(x);
             estado1 = set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static boolean eliminarPoblacionA(int id){
        try{
            Connection c = Conexion.getConecction();
            String xi = "delete from minformes where id_pob="+id;
            PreparedStatement set12 = c.prepareStatement(xi);
            int estado12 = set12.executeUpdate();
            String x = "delete from mpoblaciones where id_pry="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            int estado1 = set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static Poblacion getPoblacionById(int id){
        Poblacion u = new Poblacion();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mpoblaciones where id_pob="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            if (rs.next()) {
                u.setId_pob(rs.getInt("id_pob"));
                u.setId_pry(rs.getInt("id_pry"));
                u.setTipo(rs.getInt("id_typ"));
                u.setTemperatura(rs.getFloat("top_pob"));
                u.setPh(rs.getFloat("pho_pob"));
                u.setOxigeno(rs.getFloat("oxo_pob"));
                u.setPob_in((int) rs.getFloat("ini_pob"));
                u.setFi(rs.getString("fi_pob"));
                u.setFf(rs.getString("ff_pob"));
            }
            c.close();
    
            return u;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return u;
        }
    } 
    
    public static ArrayList<Poblacion> getPoblacion(int id){
        ArrayList<Poblacion> Poblaciones = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mpoblaciones where id_pry="+id+";";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Poblacion u = new Poblacion();
                u.setId_pob(rs.getInt("id_pob"));
                u.setId_pry(rs.getInt("id_pry"));
                u.setTipo(rs.getInt("id_typ"));
                u.setTemperatura(rs.getFloat("top_pob"));
                u.setPh(rs.getFloat("pho_pob"));
                u.setOxigeno(rs.getFloat("oxo_pob"));
                u.setPob_in((int) rs.getFloat("ini_pob"));
                u.setFi(rs.getString("fi_pob"));
                u.setFf(rs.getString("ff_pob"));
                Poblaciones.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Poblaciones;
    } 
    
    public static ArrayList<Poblacion> getPoblacionA(int id){
        ArrayList<Poblacion> Poblaciones = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mpoblaciones";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Poblacion u = new Poblacion();
                u.setId_pob(rs.getInt("id_pob"));
                u.setId_pry(rs.getInt("id_pry"));
                u.setTipo(rs.getInt("id_typ"));
                u.setTemperatura(rs.getFloat("top_pob"));
                u.setPh(rs.getFloat("pho_pob"));
                u.setOxigeno(rs.getFloat("oxo_pob"));
                u.setPob_in((int) rs.getFloat("ini_pob"));
                u.setFi(rs.getString("fi_pob"));
                u.setFf(rs.getString("ff_pob"));
                Poblaciones.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Poblaciones;
    } 
    
    public static boolean editarPoblacion(Poblacion u){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "update mpoblaciones set id_typ=?, ff_pob=? where id_pob = ?";
            PreparedStatement set1 = c.prepareStatement(x);
            set1.setInt(1, u.getTipo());
            set1.setInt(3, u.getId_pob());
            set1.setString(2, u.getFf());
            int estado1 = set1.executeUpdate();
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
//Informes
    public static boolean agregaraInformes(Informe p){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "insert into minformes (id_pob,nam_inf,rut_inf)"
                    + " values(?,?,?)";
            PreparedStatement set1 = c.prepareStatement(x);
            set1.setInt(1,p.getId_pry());
            set1.setString(2,p.getNombre());
            set1.setString(3,p.getRuta());
            
            int estado1 = set1.executeUpdate();
            c.close();
            return true;
        }catch(Exception e){
            System.out.println("AE");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static boolean eliminarInforme(int id){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "delete from minformes where id_inf="+id+" limit 1";
            PreparedStatement set1 = c.prepareStatement(x);
            int estado1 = set1.executeUpdate();
            
            c.close();
            System.out.println("EL1");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }
    
    public static Informe getInformeById(int id){
        Informe u = new Informe();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from minformes where id_inf="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            if (rs.next()) {
                u.setId_inf(rs.getInt("id_inf"));
                u.setId_pry(rs.getInt("id_pob"));
                u.setNombre(rs.getString("nam_inf"));
                u.setRuta(rs.getString("rut_inf"));
            }
            c.close();

            return u;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return u;
        }
    } 
    
    public static ArrayList<Informe> getInforme(int id){
        ArrayList<Informe> Informes = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from minformes where id_pob="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Informe u = new Informe();
                u.setId_inf(rs.getInt("id_inf"));
                u.setId_pry(rs.getInt("id_pob"));
                u.setNombre(rs.getString("nam_inf"));
                u.setRuta(rs.getString("rut_inf"));
                Informes.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Informes;
    } 
    
    public static ArrayList<Informe> getInformeA(int id){
        ArrayList<Informe> Informes = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from minformes";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Informe u = new Informe();
                u.setId_inf(rs.getInt("id_inf"));
                u.setId_pry(rs.getInt("id_pob"));
                u.setNombre(rs.getString("nam_inf"));
                u.setRuta(rs.getString("rut_inf"));
                Informes.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Informes;
    } 
    
    public static boolean editarInforme(Informe u){
        
        return true;
    }
    
    public static ArrayList<Pais> getPaises(){
        ArrayList<Pais> p =  new ArrayList();
        
        try{
            Connection con = Conexion.getConecction();
            String q = "Select * from cpaises order by des_pas;";
            PreparedStatement set = con.prepareStatement(q);
            ResultSet rs = set.executeQuery();
            
            while(rs.next()){
                Pais e = new Pais();
                e.setId(rs.getInt(1));
                e.setAbre(rs.getString(2));
                e.setName(rs.getString(3));
                p.add(e);
            }
            
            con.close();
        }catch(Exception er){
            System.out.println("no se conecto a la tabla");
            System.out.println(er.getMessage());
            System.out.println(er.getStackTrace());
        }
        return p;
    }
    
    public static ArrayList<String> getObjetivoById(int id){
        ArrayList<String> u= new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from cobjetivos where id_obj="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            if (rs.next()) {
                u.add(rs.getString("id_obj"));
                u.add(rs.getString("des_obj"));
            }
            c.close();
            return u;
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return u;
        }
    } 
    
    public static int comprobarColaborador(int user, int project){
        try{
            Connection c = Conexion.getConecction();
            String x = "select * from mcolaboradores";
            PreparedStatement set = c.prepareStatement(x);
            ResultSet rs = set.executeQuery();
            
            while(rs.next()){
                if(user == rs.getInt(3) && project == rs.getInt(2)){
                    System.out.println(rs.getInt(4));
                    return rs.getInt(4);
                }
            }
            
        }catch(Exception e){
            System.out.println("----------------Error verificando colaborador----------");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            System.out.println("-------------------------------------------------------");
            return 0;
        }
        return 0;
    }

    public static ArrayList<int[]> getColaboradores(int id){
        ArrayList<int[]> Informes = new ArrayList();
        try{
            Connection c = Conexion.getConecction();
            
            String x = "select * from mcolaboradores where id_pry="+id;
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                int[] u = new int[2];
                u[0] = rs.getInt(3);
                u[1] = rs.getInt(4);
                Informes.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return Informes;
    } 
}