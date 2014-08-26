public class CaseMngmnt{
    public static void SetValueRecieveForm(Case[] cases){
        for(Case c:cases){
            if(c.Type=='コンサルティングオプション申込み'){
            	Account acct = [SELECT id FROM Account WHERE KIGYO_ID__c =: c.id LIMIT 1];
            	Contact cont = [SELECT id FROM Contact WHERE KIGYO_ID__c =: c.id LIMIT 1];
            	if(acct.id != null && cont.id != null){
            		c.accountId = acct.id;
            		c.contactId = cont.id;
            	}
            }
        }
    }
}