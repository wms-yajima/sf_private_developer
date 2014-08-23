public class LeadMngmnt{
    public static void SetValueRecieveForm(Lead[] leads){
        
        Date dToday = System.today();
    
        for(Lead l:leads){
            if(l.SYUBETSU__c=='申込み'){
                l.MOHSHIKOMI_DATE__c = dToday;
            }
        }
    }
}