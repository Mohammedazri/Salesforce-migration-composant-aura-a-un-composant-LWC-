/**
 * Author: Iqra Masood
 * Description: Controller for Aura Support Center component
 */
public with sharing class SupportCenterController {

    @AuraEnabled
    public static List<Case> getTickets(Integer pageNumber, Integer pageSize) {
        return SupportCenterService.getTickets(pageNumber, pageSize);
    }

    @AuraEnabled
    public static Integer getTotalTickets() {
        return SupportCenterService.getTotalTickets();
    }

    @AuraEnabled
    public static void bulkUpdateLeads(List<Id> leadIds, String newStage) {
        LeadAutomationService.updateLeadStage(leadIds, newStage);
        LeadAutomationService.sendEmailPopupForNurturing(leadIds);
    }
}
