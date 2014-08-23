public class JuriController{
    JuriData juridata = new JuriData();
    public Lead lead {get; set;}

    /**
    * コンストラクタ
    * @author yajima
    */
    public JuriController(){
        initLead();    
    }
    
    /**
    * 見込み客データの取得
    * @author yajima
    */    
    private void initLead(){
        if(lead == null){
            lead = juridata.getLead(System.currentPageReference().getParameters().get('id'));
        }
    }

    /**
    * 「受理」ボタン押下後処理
    * @author yajima
    */
    public PageReference executeJuri(){
        insertData();
        if(lead.Email != null){
            sendEmail();
        }
        return Page.JuriKanryoPage;
    }

    /**
    * 取引先、取引先責任者、サービスの新規登録
    * @author yajima
    */    
    private void insertData(){
        AccountCreater acctCreater = new AccountCreater();
        Account acct = acctCreater.createAccount(lead);
        insert acct;
        
        ContactCreater contactCreater = new ContactCreater();
        Contact contact = contactCreater.createContact(lead, acct);
        insert contact;
        
        ServiceCreater serviceCreater = new ServiceCreater();
        SERVICE__c service = serviceCreater.createService(lead, acct);
        insert service;
    } 
    
    /**
    * 受理完了メール送信
    * @author yajima
    */    
    private void sendEmail(){
        MailUtil mail = new MailUtil();
        EmailTemplate emailTemp = mail.getEmailTemplate('受理メール');
        String orgAddress = mail.getOrgWideEmailAddress('管理者');
        
        Messaging.SingleEmailMessage message = mail.createEmailMessage(
                                                    orgAddress,
                                                    'motoki yajima',
                                                    new String[]{lead.Email},
                                                    null,
                                                    emailTemp.subject,
                                                    emailTemp.body
        );
        mail.addMessage(message);
        mail.sendEmailMassage();
    }    
}