/**
 * Author: Iqra Masood
 * Description: Provides backend services for Support Center ticket listing
 */
public with sharing class SupportCenterService {

    public static List<Case> getTickets(Integer pageNumber, Integer pageSize) {

        Integer offsetSize = (pageNumber - 1) * pageSize;

        List<Case> tickets = [
            SELECT Id, CaseNumber, Subject, Status, Priority, CreatedDate
            FROM Case
            ORDER BY CreatedDate DESC
            LIMIT :pageSize OFFSET :offsetSize
        ];

        return tickets;
    }

    public static Integer getTotalTickets() {
        return [SELECT count() FROM Case];
    }
}
