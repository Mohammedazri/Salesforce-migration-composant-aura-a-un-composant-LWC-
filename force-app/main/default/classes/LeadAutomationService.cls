/**
 * Author: Iqra Masood
 * Description: Handles bulk lead updates and email triggers
 */
public with sharing class LeadAutomationService {

    public static void updateLeadStage(List<Id> leadIds, String newStage) {

        List<Lead> leadsToUpdate = [SELECT Id, Status FROM Lead WHERE Id IN :leadIds];

        for (Lead l : leadsToUpdate) {
            l.Status = newStage;
        }

        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }
    }

    public static void sendEmailPopupForNurturing(List<Id> leadIds) {

        List<Lead> leads = [SELECT Id, Email, Name FROM Lead WHERE Id IN :leadIds];

        for (Lead l : leads) {
            EmailUtility.sendEmail(
                l.Email,
                'Nurturing Email',
                'Hello ' + l.Name + ', please check our latest offers!'
            );
        }
    }
}
