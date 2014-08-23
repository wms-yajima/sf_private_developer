/**
 * 受理画面に表示するデータを取得するクラス.
 * @author yajima
 */
public class JuriData{
    /**
     * リードデータの取得
     * @author yajima
     */
    public Lead getLead(ID pId){
        return [
                SELECT
                    id,
                    company,
                    CONPANY_KANA__c,
                    LastName,
                    FirstName,
                    NAME_KANA__c,
                    Email,
                    phone,
                    PostalCode,
                    State,
                    City,
                    Street,
                    MOHSHIKOMI_PACK__c,
                    CONSULTING_OPTION__c,
                    MOHSHIKOMI_DATE__c,
                    MEMO__c,
                    SYUBETSU__c                               
                FROM
                    Lead
                WHERE
                    id = :pId
        ];  
    } 
}