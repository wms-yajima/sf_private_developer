/**
 * 取引先責任者作成クラス
 * @author yajima
 */
public class ContactCreater{
    /**
     * 取引先責任者作成
     * @author yajima
     */
    public Contact createContact(Lead pLd, Account acct){
        Contact contact = new Contact(accountid = acct.id);

        contact.LastName = pLd.LastName;
        contact.FirstName = pLd.FirstName;
        contact.NAME_KANA__c = pLd.NAME_KANA__c;
        contact.Email = pLd.Email;
        contact.Phone = pLd.Phone;
        contact.MailingPostalCode = pLd.PostalCode;
        contact.MailingState = pLd.State;
        contact.MailingCity = pLd.City;
        contact.MailingStreet = pLd.Street;

        return contact;
    }
}