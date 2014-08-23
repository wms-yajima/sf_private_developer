@isTest private class ContactCreaterTest{
    static testMethod void testCreateContact(){
        Lead lead;
        TestUtil testUtil = new TestUtil();
        lead = testUtil.getTestLead();
        insert lead;
        
        AccountCreater acctCreater = new AccountCreater();
        Account acct = acctCreater.createAccount(lead);
        insert acct;
        
        ContactCreater contactCreater = new ContactCreater();
        Contact contact = contactCreater.createContact(lead,acct);
        
        System.assertEquals(acct.id,contact.accountId);
        System.assertEquals('テストコード',contact.LastName);
        System.assertEquals('太郎',contact.FirstName);
        System.assertEquals('テストコードタロウ',contact.NAME_KANA__c);
        System.assertEquals('motoki.yajima@gmail.com',contact.Email);
        System.assertEquals('03-0000-0000',contact.Phone);
        System.assertEquals('000-0000',contact.MailingPostalCode);
        System.assertEquals('東京都',contact.MailingState);
        System.assertEquals('新宿区',contact.MailingCity);
        System.assertEquals('西新宿3-2-4-10F',contact.MailingStreet);
    }
}