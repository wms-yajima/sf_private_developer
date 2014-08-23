public with sharing class Numeron {

    //自動実装プロパティ
    private String Num1 { get; set; }
    private String Num2 { get; set; }
    private String Num3 { get; set; }

    public String Inp1 { get; set; }
    public String Inp2 { get; set; }
    public String Inp3 { get; set; }

    private Integer cnt { get; set; }
    
    public String message { get; set; }
    private Boolean flg { get; set; }

    public String resultlog { get; set; }
    
    //Constructor
    public Numeron() {              
        ResetGame();
    }
    
    public void checkAnswer() {
        Integer eat;
        Integer bite;
        String result;

        validateInp();
        
        if(flg == true){
            eat = 0;
            bite = 0;
            cnt = ++cnt;
            
            if(Inp1 == Num1){
                eat = ++eat;
            }else if(Inp1 == Num2 || Inp1 == Num3){
                bite = ++bite;
            }
    
            if(Inp2 == Num2){
                eat = ++eat;
            }else if(Inp2 == Num1 || Inp2 == Num3){
                bite = ++bite;
            }
    
            if(Inp3 == Num3){
                eat = ++eat;
            }else if(Inp3 == Num2 || Inp3 == Num1){
                bite = ++bite;
            }
            
            result = cnt + '回目[' + Inp1 + Inp2 + Inp3 + ']：' + eat + 'EAT-' + bite + 'BITE';
            resultlog = resultlog + result + '<br>' ;
            
            if(eat == 3){
                message = '正解だよ～～～～';
            }
        }
    }
    
    public void ResetGame() {              
        resultlog = '';
        cnt = 0;      

        Num1 = makeNumber(); 
      
        do{
        Num2 = makeNumber();
        }while(Num1 == Num2); 
        
        do{
        Num3 = makeNumber();
        }while(Num1 == Num3 || Num2 == Num3);
        
    }
    
    private String makeNumber() {              
        return String.valueOf((Integer)Math.floor(Math.random() * 10));
    }
    
    private void validateInp() {
        message = '';
        flg = true;
        
        Boolean flg1 = Inp1.isNumeric();
        Boolean flg2 = Inp2.isNumeric();
        Boolean flg3 = Inp3.isNumeric();

        if(Inp1 == '' || Inp2 == '' ||Inp3 == ''){
            message = '入力されていない欄があります';
            flg = false;
            return;
        }else if(flg1 == false || flg2 == false || flg3 == false){
            message = '半角数字以外が入力されています';
            flg = false;
            return;
        }else if(Inp1 == Inp3 || Inp2 == Inp3 || Inp1 == Inp2){
            message = '重複した数字が使われています';
            flg = false;
            return;
        }        
    } 
    
}