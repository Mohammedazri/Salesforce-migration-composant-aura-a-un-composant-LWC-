/**
 * Author: Iqra Masood
 * Description: Centralized email sending utility
 */
public with sharing class EmailUtility {

    public static void sendEmail(String toAddress, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {toAddress});
        mail.setSubject(subject);
        mail.setPlainTextBody(body);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}
