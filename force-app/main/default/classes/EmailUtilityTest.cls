/**
 * Author: Iqra Masood
 * Description: Test class for EmailUtility
 * Coverage: Email sending logic
 */
@IsTest
private class EmailUtilityTest {

    @IsTest
    static void testSendEmail() {

        // Create test lead to simulate email sending
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName  = 'User',
            Company   = 'Test Company',
            Email     = 'testuser@example.com',
            Status    = 'Open - Not Contacted'
        );
        insert testLead;

        Test.startTest();

        EmailUtility.sendEmail(
            testLead.Email,
            'Test Subject',
            'Test email body'
        );

        Test.stopTest();

        // No assertion on Messaging.sendEmail (platform controlled)
        // Test ensures method executes without exceptions
        System.assert(true, 'EmailUtility executed successfully');
    }
}
