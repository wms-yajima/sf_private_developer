public class TestUtil{
    public Lead getTestLead(){
        Lead lead = new Lead();
        lead.company = 'テストコード株式会社';
        lead.CONPANY_KANA__c = 'テストコードカブシキガイシャ';
        lead.LastName = 'テストコード';
        lead.FirstName = '太郎';
        lead.NAME_KANA__c = 'テストコードタロウ';
        lead.Email = 'motoki.yajima@gmail.com';
        lead.phone = '03-0000-0000';
        lead.PostalCode = '000-0000';
        lead.State = '東京都';
        lead.City = '新宿区';
        lead.Street = '西新宿3-2-4-10F';
        lead.MOHSHIKOMI_PACK__c = 'おまかせパック';
        lead.CONSULTING_OPTION__c = true;
        lead.MOHSHIKOMI_DATE__c = System.Today();
        lead.MEMO__c = 'TestUtilクラスから作られた見込み客ですよ';
        lead.SYUBETSU__c = 'テストコード';
        
        return lead;
    }
    
    public EmailTemplate getTestEmailTemplate(){
        EmailTemplate eTemp = new EmailTemplate();
        eTemp.subject = 'テストタイトル';
        eTemp.body = 'テスト本文';
        eTemp.Name = 'テストテンプレート名';
        eTemp.DeveloperName = 'testEmailTemplate';
        eTemp.FolderId = '00D10000000ajRR';
        eTemp.TemplateType = 'text';

        return eTemp;        
    }
}