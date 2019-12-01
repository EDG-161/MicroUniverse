package Backend.ServletControl;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Aaron
 */
public class Validaciones {
    
    public static int validarUsername(String username){
        
        Pattern p= Pattern.compile("[A-Za-zñÑüÜÁÉÍÓÚáéíóú,' ']{1,40}");
        Matcher m=p.matcher(username);
        
        if(m.matches()){
            return 0;
        }else if(username.replaceAll(" ", "")==""){
            return 1;
        }else{
            return 2;
        }
    }
    
    public static int validarCorreo(String correo){
        
         Pattern p= Pattern.compile("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@" +
          "[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$");
         
        Matcher m=p.matcher(correo);
        
        if(m.matches()){
            return 0;
        }else if(correo.replaceAll(" ","")==""){
            return 1;
        }else{
            return 2;
        }
        
    }
    
    public static int validarPassword(String pass){
        
         Pattern p= Pattern.compile("[A-Za-zñÑüÜ0-9'.'':']{6,20}");
         
        Matcher m=p.matcher(pass);
        
        if(m.matches()){
            return 0;
        }else if(pass.replaceAll(" ","")==""){
            return 1;
        }else{
            return 2;
        }
        
    }
    
    public static int validarCadenas(String username){
        
        Pattern p= Pattern.compile("[A-Za-z,' ']{1,40}");
        Matcher m=p.matcher(username);
        
        if(m.matches()){
            return 0;
        }else if(username.replaceAll(" ", "")==""){
            return 1;
        }else{
            return 2;
        }
    }
    
    public static int validarCadenasCN(String username){
        
        Pattern p= Pattern.compile("[A-Za-z,' ',0-9]{1,40}");
        Matcher m=p.matcher(username);
        
        if(m.matches()){
            return 0;
        }else if(username.replaceAll(" ", "")==""){
            return 1;
        }else{
            return 2;
        }
    }
}
