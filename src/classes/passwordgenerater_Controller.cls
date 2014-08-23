public with sharing class passwordgenerater_Controller {

    public Integer inputNumber{get; set;}
    public String password{get; set;}
    public String words{get; set;}
    
    //Constructor
    public passwordgenerater_Controller(){
        password =  '';       
        words = '1234567890qwertyuiopasdfghjklzxcvbnm';
    }
    
    public void onClick(){
        password =  createPassword();       
    }
    
    public String createPassword(){
        String pwd = '';
        for(Integer i = 0 ;inputNumber>i ; i++){
            pwd = pwd + words.mid((Math.floor(Math.random() * words.length())).intValue()-1,1);
        }
        return pwd;
    }
}