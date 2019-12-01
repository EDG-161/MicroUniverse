    
package Backend.ServletControl;

import Backend.Conexion;
import Entidades.Proyectos.Informe;
import Entidades.Users.Usuario;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
 

public class ProyectosControl {
    
    private static ObjectInputStream entrda;
    private static ObjectOutputStream Salida;
    
    public static void generarPDF(){
//        try {
//            // IO
//            File htmlSource = new File("index.html");
//            File pdfDest = new File("output.pdf");
//            if (!pdfDest.exists()) {
//                pdfDest.createNewFile();
//            }
//            // pdfHTML specific code
//            ConverterProperties converterProperties = new ConverterProperties();
//            HtmlConverter.convertToPdf(new FileInputStream(htmlSource),
//                    new FileOutputStream(pdfDest), converterProperties);
//        } catch (FileNotFoundException ex) {
//            System.out.println("Archivo no encontrado");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
    }
    
    public static String EscribirInforme(Informe inf,String id) throws IOException{
         File infor = new File(id);
         
        if (!infor.exists()) {
            infor.createNewFile();
        }
        
        FileOutputStream userex = new FileOutputStream(infor);
        Salida = new ObjectOutputStream(userex);
        Salida.writeObject(inf);
        
        System.out.println("agregado en " + infor.getAbsoluteFile());
        
        Salida.close();
        return infor.getAbsolutePath();
    }
    
    public static Informe leerInforme(String id){
       File infor = new File(id);
        if (!infor.exists()) {
            
        }else{
            FileInputStream usuariosIn;
            try {
                usuariosIn = new FileInputStream(infor);
                entrda = new ObjectInputStream(usuariosIn);
                Informe Infor = (Informe) entrda.readObject();
                usuariosIn.close();
                return Infor;
            } catch (FileNotFoundException ex) {
                System.out.println("no hay archivo");
            } catch (IOException ex) {
                System.out.println("error al leer");
            } catch (ClassNotFoundException ex) {
               
            }
        }
        return null;
    }
    
    public static int RestarFechas(String f1){
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            
            Date fechaInicial=dateFormat.parse(f1);
            Date fechaFinal=new Date();
            
            int dias=(int) ((fechaFinal.getTime()-fechaInicial.getTime())/86400000);
            return dias;
            
        } catch (ParseException ex) {
            Logger.getLogger(ProyectosControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -3;
    }
    
    public static void agregarInforme(){
        
    }
    
    public static String getFecha(){
        Date f = new Date();
        DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String c = fechaHora.format(f);
        
        return c;
    }
    
    public static int RestarFechasE(String f1){
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            Date fechaInicial=dateFormat.parse(f1);
            Date fechaFinal=dateFormat.parse(getFecha());
            
            int dias=(int) ((fechaFinal.getTime()-fechaInicial.getTime())/3600000);
            return dias;
            
        } catch (ParseException ex) {
            Logger.getLogger(ProyectosControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -3;
    }
    
    public static int RestarFechasF(String f1,String f2){
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            Date fechaInicial=dateFormat.parse(f1);
            Date fechaFinal=dateFormat.parse(f2);
            
            int dias=(int) ((fechaFinal.getTime()-fechaInicial.getTime())/3600000);
            return dias;
            
        } catch (ParseException ex) {
            Logger.getLogger(ProyectosControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -3;
    }
    
    public static boolean agregarColaborador(Usuario u,int pry){
        try{
            Connection c = Conexion.getConecction();
            
            String x = "insert into mcolaboradores (id_pry,id_usr,id_tip)"
                    + " values(?,?,?)";
            PreparedStatement set1 = c.prepareStatement(x);
            
            set1.setInt(1,u.getId());
            set1.setInt(2,pry);
            set1.setInt(3,Integer.parseInt(Conexion.getObjetivoById(Conexion.getProyectoById(pry).getObjetivo()).get(0)));
            
            int estado1 = set1.executeUpdate();
            
            c.close();
            return true;
        }catch(Exception e){
            
            return false;
        }
    }
    
}
