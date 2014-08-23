@isTest private class MailUtilTest{
    static testMethod void testGetEmailTemplate(){
        TestUtil testUtil = new TestUtil();
        EmailTemplate eTemp_expect = testUtil.getTestEmailTemplate();
        insert eTemp_expect;
        
        MailUtil mailUtil = new MailUtil();
        EmailTemplate eTemp_result = mailUtil.getEmailTemplate('テストテンプレート名');
        
        System.assertEquals(eTemp_expect.subject,eTemp_result.subject);
        System.assertEquals(eTemp_expect.body,eTemp_result.body);
    }
    
    static testMethod void testGetOrgWideEmailAddress(){
        MailUtil mailUtil = new MailUtil();
        String orgAddress = mailUtil.getOrgWideEmailAddress('管理者');
        
        System.assertEquals('motoki.yajima@gmail.com',orgAddress);
    }
    
    static testMethod void testCreateEmailMessage(){
        String replyTo = 'test-replyto@test.com';
        String senderDisplayName = 'テストコード太郎';
        String[] toAddresses = new String[]{'test-toaddress@test.com'};
        String[] ccAddresses = new String[]{'test-ccaddress@test.com'};
        String subject = 'testsubjest';
        String body = 'testbody';
        
        Messaging.SingleEmailMessage expectedMessage = new Messaging.SingleEmailMessage();
        expectedMessage.setReplyTo(replyTo);
        expectedMessage.setSenderDisplayName(senderDisplayName);
        expectedMessage.setToAddresses(toAddresses);
        expectedMessage.setCcAddresses(ccAddresses);        
        expectedMessage.setSubject(subject);
        expectedMessage.setPlainTextBody(body);
        expectedMessage.setUseSignature(false);
                        
        MailUtil mailUtil = new MailUtil();
        Messaging.SingleEmailMessage resultMessage = mailUtil.createEmailMessage(replyTo, senderDisplayName, toAddresses, ccAddresses, subject, body);
        
        //中身は一緒なのになぜかエラーになってしまう…。
        //System.assertEquals(expectedMessage,resultMessage);
        
        System.assertEquals(replyTo,resultMessage.replyTo);
        System.assertEquals(senderDisplayName,resultMessage.senderDisplayName);
        System.assertEquals(toAddresses,resultMessage.toAddresses);
        System.assertEquals(ccAddresses,resultMessage.ccAddresses);
        System.assertEquals(subject,resultMessage.subject);
        System.assertEquals(body,resultMessage.plainTextBody);
    }
    
    /**
    * Sendのテストは（できない？）ので略    
    static testMethod void testSendEmailMessage(){
    }
    */

}