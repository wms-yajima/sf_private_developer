@isTest private class ServiceCreaterTest{
    static testMethod void testcreateService(){
        Lead lead;
        TestUtil testUtil = new TestUtil();
        lead = testUtil.getTestLead();
        insert lead;
        
        AccountCreater acctCreater = new AccountCreater();
        Account acct = acctCreater.createAccount(lead);
        insert acct;
        
        ServiceCreater serviceCreater = new ServiceCreater();
        SERVICE__c service = serviceCreater.createService(lead,acct);
        
        System.assertEquals(acct.id,service.TORIHIKISAKI__c);
        System.assertEquals('おまかせパック',service.MOHSHIKOMI_PACK__c);
        System.assertEquals(true,service.CONSULTING_OPTION__c);
        System.assertEquals(System.Today(),service.RIYOUKAISHIBI__c);
    }
}