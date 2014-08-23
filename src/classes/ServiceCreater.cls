/**
 * サービス作成クラス
 * @author yajima
 */
public class ServiceCreater{
    /**
     * サービス作成
     * @author yajima
     */
    public SERVICE__c createService(Lead pLd, Account acct){
        Date tDate = System.Today();

        SERVICE__c service = new SERVICE__c(TORIHIKISAKI__c = acct.id);

        service.MOHSHIKOMI_PACK__c = pLd.MOHSHIKOMI_PACK__c;
        service.CONSULTING_OPTION__c = pLd.CONSULTING_OPTION__c;
        service.RIYOUKAISHIBI__c = tDate;
        
        return service;
    }
}