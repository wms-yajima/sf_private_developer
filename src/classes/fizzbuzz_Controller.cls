public with sharing class fizzbuzz_Controller {

    public Integer inputNumber{get; set;}
    public String result{get; set;}
    
    //Constructor
    public fizzbuzz_Controller(){
        result =  '';       
    }
    
    public void onClick(){
        result =  checkNumber();       
    }
    
    public String checkNumber(){
        if(Math.mod(inputNumber,15)==0){
            return 'fizz buzz';
        }else if(Math.mod(inputNumber,5)==0){
            return 'buzz';
        }else if(Math.mod(inputNumber,3)==0){
            return 'fizz';
        }else{
            return String.valueOf(inputNumber);
        }
    }
}