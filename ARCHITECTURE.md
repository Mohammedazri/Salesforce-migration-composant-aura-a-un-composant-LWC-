```mermaid
flowchart TD
    A[Support Center UI] --> B[SupportCenterController]
    B --> C[SupportCenterService]
    C --> D[Case Data]
    B --> E[LeadAutomationService]
    E --> F[Lead Updates & Emails]
    F --> G[EmailUtility]
