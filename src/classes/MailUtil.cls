public class MailUtil{
    /** メッセージリスト */
    @TestVisible
    private List<Messaging.SingleEmailMessage> messages;
    
    /**
     * コンストラクタ
     */
    public MailUtil() {
        messages = new List<Messaging.SingleEmailMessage>();
    }
    
    public String getOrgWideEmailAddress(String aDisplayName){
        OrgWideEmailAddress orgAddress = 
            [ SELECT
                  Address
              FROM
                  OrgWideEmailAddress
              WHERE
                  DisplayName = :aDisplayName
              LIMIT 1
            ];
        return String.valueOf(orgAddress.Address);
    }
    
    
    /**
     * メールテンプレート取得 
     * @author yajima
     */    
    public EmailTemplate getEmailTemplate(String aTemplateName){
        List<EmailTemplate> eList =
            [ SELECT
                  id,
                  subject,
                  body
              FROM
                  EmailTemplate
              WHERE
                  Name = :aTemplateName
              LIMIT 1 
            ];
          
        if(eList.isEmpty() == false){
            return eList.get(0);
        }
        return null;
    }
    /**
     * メッセージ作成
     * @author yajima
     * @param replyTo 返信先アドレス
     * @param senderDisplayName 差出人名
     * @param toAddresses To アドレス
     * @param ccAddresses Cc アドレス
     * @param subject 件名
     * @param body 本文
     */    
    public Messaging.SingleEmailMessage createEmailMessage(
            String replyTo
            , String senderDisplayName
            , String[] toAddresses
            , String[] ccAddresses
            , String subject
            , String body) {
        @TestVisible
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        if(replyTo != null) {
            message.setReplyTo(replyTo);
        }
        if(senderDisplayName != null) {
            message.setSenderDisplayName(senderDisplayName);
        }
        message.setToAddresses(toAddresses);
        if(ccAddresses != null) {
            message.setCcAddresses(ccAddresses);
        }
        message.setSubject(subject);
        message.setPlainTextBody(body);
        message.setUseSignature(false);
        
        return message;
    }
    
    /**
     * メッセージ追加
     * @param message メッセージ
     */    
    public void addMessage(Messaging.SingleEmailMessage message) {
        if(messages == null) {
             messages = new List<Messaging.SingleEmailMessage>();
        }
        messages.add(message);        
    }
    
    public void sendEmailMassage(){
        if(messages != null && messages.size() > 0) {
            Messaging.sendEmail(messages);
        }
    }
}