@isTest private class JuriDataTest{
    static TestMethod void testGetLead(){
        TestUtil testUtil = new TestUtil();
        Lead lead = testUtil.getTestLead();
        insert lead;
        
        JuriData juriData = new JuriData();
        System.assertEquals(lead.id,juriData.getLead(lead.id).id);
    }
}