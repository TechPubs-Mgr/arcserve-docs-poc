New Features and Enhancements (July, 2026)
==========================================

This release primarily provides the following:

New Features
------------

- **UDP Quick Start Guide:** Arcserve Console - SaaS now includes a UDP
  Quick Start Guide that allows you to get started faster and more
  confidently. It provides step‑by‑step instructions for configuring
  backup policies, adding protected sources, and monitoring job status.
  This guide also allows you to simplify onboarding and quickly navigate
  essential workflows without confusion. For more information, see
  `UDP Quick Start
  Guide <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/udp_qsg.htm?TocPath=Understanding%2520Arcserve%2520Console%2520-%2520SaaS%257C_____8>`__.
- **ArcGenie (AI Assistant):** Arcserve Console - SaaS now includes an
  integrated AI Assistant (ArcGenie) to help you access information more
  efficiently while using the product. ArcGenie enables direct
  interaction with your knowledge base, provides quick replies, and
  includes clickable citations in every answer for added transparency.
  For more information, see `Ask ArcGenie: AI-Powered Assistance in
  Arcserve Console -
  SaaS <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/AI_Chatbot.htm?TocPath=Understanding%2520Arcserve%2520Console%2520-%2520SaaS%257CAsk%2520ArcGenie%253A%2520AI-Powered%2520Assistance%2520in%2520Arcserve%2520Console%2520-%2520SaaS%257C_____0>`__.
- **Proxmox:** This release introduces support for Proxmox Virtual
  Environment (PVE) in the Arcserve Console -Saas. Proxmox is an
  open-source enterprise virtualization platform that combines the KVM
  hypervisor, Linux Containers (LXC), software-defined storage, and
  advanced networking in a single solution. With this integration, you
  can protect Proxmox virtual machines directly from the Arcserve
  Console -Saas. The web-based interface provides centralized visibility
  and control to simplify backup management and strengthen disaster
  recovery operations.
- This release includes the following capabilities:

  - Backup of Proxmox-hosted virtual machines that run Arcserve Console
    -SaaS supported Windows operating systems and Linux distributions.
  - Restore virtual machines to the original location or an alternate
    location for migration, and disaster recovery scenarios.
  - Restore files and folders by mounting a recovery point, enabling
    granular recovery without restoring the entire virtual machine.

- **Disaster Recovery (DR) Runbooks:** DR Runbooks are structured,
  predefined group of sources with recovery configurations that
  automatically recover to a designated AWS account as Amazon EC2
  instances during a disaster event. Additionally, these books define
  recovery targets and execution parameters, enabling you to trigger
  failover quickly and consistently during outages. For more
  information, see `DR
  Runbooks <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/dr_runbook.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CDisaster%2520Recovery%257CDR%2520Runbooks%257C_____0>`__.
- **UDP and CRS License Management:** This release introduces a new
  licensing management feature for Arcserve UDP and CRS. The feature
  enables centralized management of license entitlements, real-time
  visibility into license consumption, and automated alerts for capacity
  utilization and entitlement expiration. It helps administrators
  efficiently monitor license usage, plan renewals, and ensure
  continuous service availability. For more information, see
  `Configuring
  Entitlements <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/acc_dc_config_entitlements.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CSettings%257CConfiguring%2520Entitlements%257C_____0>`__.

Enhancements
------------

- **Assured Security Enhancements**

  - **Incremental Scan Support:** UDP 11.0 now performs Assured Security
    Incremental Scans. Instead of rescanning the entire recovery point,
    it scans only new or changed files since the last scan. Activity log
    clearly shows whether each scan job ran a Full or an Incremental
    Scan.
  - **ReFS Support:** Assured Security now scans ReFS file systems in
    addition to NTFS. It supports ReFS versions 3.1, 3.4, and 3.7 for
    both Full and Incremental Scans.

- **Notes:**

  - Current scans cannot detect renamed or moved files because their
    creation or modification timestamps do not change. This enhancement
    is planned for the future.
  - Each scan job generates an antivirus scan result in the activity
    log.
