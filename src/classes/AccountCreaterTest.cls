@isTest private class AccountCreaterTest{
    static testMethod void testCreateAccount(){
        Lead lead;
        TestUtil testUtil = new TestUtil();
        lead = testUtil.getTestLead();
        insert lead;
        
        AccountCreater acctCreater = new AccountCreater();
        Account acct = acctCreater.createAccount(lead);
        
        System.assertEquals('テストコード株式会社',acct.Name);
        System.assertEquals('テストコードカブシキガイシャ',acct.CONPANY_KANA__c);
        System.assertEquals(System.Today(),acct.JURI_DATE__c);
        System.assertEquals('テストコード',acct.SYUBETSU__c);
    }
}