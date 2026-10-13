New Features and Enhancements (October, 2024)
=============================================

The following new features and enhancements are available for Arcserve
Console - SaaS:

- **Assured Security:** Enables you to scan backup data in recovery
  points for any malware or malicious files. It also warns you about the
  malicious files in recovery points before restoring. For more
  information, see `How to Perform an Assured Security
  Scan <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/hw_to_prfm_asscan.htm?TocPath=Working%2520With%2520Arcserve%2520Console%2520-%2520SaaS%257CUDP%2520Related%257CHow%2520to%2520Run%2520an%2520Assured%2520Security%2520-%2520Malware%2520Scan%257C_____0>`__.
- **Notes:**

  - The Assured Security scan is supported only for Windows nodes.
  - Applicable for Full, Incremental, Verify, and incomplete backup
    types of all the job types from custom, daily, weekly, and monthly
    schedule types.

- **Virtual Standby to Google Cloud Platform:** Converts recovery points
  to virtual machine format on Google Cloud and prepares a snapshot to
  easily recover data when needed. This feature also provides the high
  availability capability and ensures that the virtual machine can take
  over immediately when the source machine fails. For more information,
  see `How to Create a Virtual Standby to Google Cloud
  Policy <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/crt_vsb_gcp_policy.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CPolicies%257CHow%2520to%2520Add%2520an%2520Agent-Based%2520Windows%2520Backup%2520Policy%257CCreate%2520a%2520Virtual%2520Standby%2520Policy%257CHow%2520to%2520Create%2520a%2520Virtual%2520Standby%2520to%2520Google%2520Cloud%2520Policy%257C_____0>`__.
- **Ad-hoc Standby VM:** Converts recovery points to virtual machine
  format and prepares a snapshot to easily recover data when needed.
  This feature also provides the high availability capability and
  ensures that the virtual machine can take over immediately when the
  source machine fails. For more information, see `How to Create an
  Ad-hoc Standby Virtual
  Machine <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/hw_crt_adhoc_VSB.htm?TocPath=Working%2520With%2520Arcserve%2520Console%2520-%2520SaaS%257CUDP%2520Related%257CHow%2520to%2520Create%2520an%2520Ad-hoc%2520Standby%2520Virtual%2520Machine%257C_____0>`__.
- **Oracle RMAN Support:** Arcserve Console - SaaS now provides a way of
  protecting Oracle system using Recovery Manager (RMAN). RMAN is an
  Oracle utility that performs backup, restore and recovery tasks on
  databases and automates the administration of backup strategies. For
  more information, see `Add a Policy for Oracle Database Backup using
  Recovery Manager
  (RMAN) <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/Protecting%20Oracle%20System%20using%20Recovery%20Manager%20(RMAN).htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CPolicies%257CHow%2520to%2520Add%2520a%2520Oracle%2520Database%2520Backup%2520Policy%2520using%2520Recovery%2520Manager%2520(RMAN)%257C_____0>`__.
- **Nutanix AHV VMs Protection:** Enables adoption of Arcserve Console -
  SaaS for users requiring protection of Nutanix AHV VMs.
- **Audit Log:** Provides an audit log of administrative events,
  including log-in events and changes (when/who/what), and restores that
  can serve the audit purposes. Ensures compliance to Client's (existing
  and potential) security requirement of Audit trails. Arcserve Console
  - SaaS allows you to export all audit records or selected audit
  records to a text file. For more information, see `Analyze Audit
  Logs <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/analyze_audit_logs.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CReports%2520%257C_____3>`__.
- **Mount SQL Database:** Allows mounting of SQL databases to a
  particular Point in Time (PIT) between the *n* and *n+1* recovery
  points. For more information, see `How to Mount SQL
  Databases <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/how_to_mount_sql_databases.htm?TocPath=Working%2520With%2520Arcserve%25C2%25AE%2520Cloud%2520Console%257CUDP%2520Related%257CRecover%2520a%2520Recovery%2520Point%2520for%2520UDP%2520Agent%257C_____7>`__.
- **Import or Mount an Existing Data Store as a Read-Only Data Store:**
  Allows you import or mount an existing data store as a read-only data
  store for recovery. It does not support the backup, merge, and purge
  jobs. For more information, see `Import a Local Data
  Store <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/dc_import_local_data_store.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CDestinations%257CView%2520and%2520Manage%2520Destinations%257CView%2520and%2520Manage%2520Recovery%2520Point%2520Servers%257C_____4>`__
  and `Import a Cloud Data
  Store <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/Import%20a%20Cloud%20Data%20Store.htm?TocPath=Protect%257CProtecting%2520Destinations%257CView%2520and%2520Manage%2520Destinations%257CView%2520and%2520Manage%2520Recovery%2520Point%2520Servers%257C_____6>`__.
- **One-to-Many Copy Support:** Arcserve Console - SaaS now supports
  copying data from a single source to multiple data store destinations
  by allowing you to select a source data store from a Backup
  destination or from a Copy destination to be specified as source in
  the *Copy To Another Data Store* task. Additionally, it allows you to
  select if the next copy job starts only after the previous one is
  completed, or if they must start in parallel.
- **Note:** This feature is applicable to Primary task and the *Copy To
  Another Data Store* task.
- **Azure Blob Storage Support for Deduplication:** Allows you to create
  a dedupe data store on Azure Blob Storage. Azure Blob Storage is a
  massively scalable storage service for unstructured data. In Azure
  Storage, subscription-based storage accounts allow creation and
  management of Blob storage. It stores any type of text or binary data,
  such as a document file, media, or an application installer. For more
  information, see `Add a Cloud
  Account <https://documentation.arcserve.com/Arcserve-Console/SaaS/Available/ENU/olh/default.htm#Arcserve%20Console%20-%20SaaS/dc_add_a_cld_acc.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CDestinations%257CAdd%2520a%2520Destination%257CAdd%2520a%2520Cloud%2520Account%257C_____0>`__.
- **Automatic New Linux Kernel Support:** Enables support for the
  automatic update of kernels released on a regular basis for the
  RHEL/Alma/Rocky/OREL, Debian, and SUSE Linux versions resulting into
  the drivers with the outdated release. Additionally, it eliminates the
  need to manual compilation and shipment of a new driver package by CFT
  for each new kernel.
- **BMR Support for the RHEL, Alma, Rocky, and OREL 9.X Versions using
  Alma 9 LiveCD:** Enables BMR support for the latest RHEL, Alma, Rocky,
  and OREL 9.X versions using Alma 9 LiveCD as older Centos LiveCD is
  not compatible. The new LiveCD is compatible with all the Linux older
  versions.
- **Increase of UNC Path Password Length:** Allows you to use passwords
  having maximum of 120 characters for the RPS datastore destination UNC
  path.
- **TLS 1.3 Support:** Enables support for TLS 1.3 to ensure data cannot
  be intercepted while transmitting over the internet.

Enhancements:
-------------

- As part of a security enhancement, we have removed the need for a
  shared folder to access metadata files (such as index and reference
  files) stored in the datastore. Instead, metadata operations are now
  performed over a socket during backup, restore, copy, and other
  processes.
