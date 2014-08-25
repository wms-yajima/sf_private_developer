/**
 * 取引先作成クラス
 * @author yajima
 */
public class AccountCreater{
    /**
     * 取引先作成
     * @author yajima　2014
     */
    public Account createAccount(Lead pLd){
        Account account = new Account();
        Date tDate = System.Today();

        account.Name = pLd.company;
        account.CONPANY_KANA__c = pLd.CONPANY_KANA__c;
        account.JURI_DATE__c = tDate;
        account.SYUBETSU__c= pLd.SYUBETSU__c;

        return account;
    }
}