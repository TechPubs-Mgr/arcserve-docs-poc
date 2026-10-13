RMAN Related
============

- Manual recovery of the restored Oracle database fails due to the
  unavailability of the archive logs.
- When you select the **No recovery** and **Switch Database** options
  while performing the manual recovery of the Oracle database restored
  to an alternate node or alternate location on the original server, the
  mount point is inaccessible after the restore job gets completed. This
  activity causes the unavailability of the archive logs. Hence, the
  manual recovery of the Oracle database fails, and the following error
  messages occur in the activity log:
- RMAN-03002: failure of recover command at <timestamp>
- RMAN-06053: unable to perform media recovery because of missing log
- RMAN-06025: no backup of archived log for thread X with sequence Y and
  starting SCN of Z found to restore
- When you select the **Delete archive logs from the source database
  after a successful backup** option while creating a backup plan for
  Oracle database, the archive logs get deleted from the Oracle server
  after a successful backup to the recovery point. This activity causes
  unavailability of archive logs during the manual recovery of Oracle
  database restored to an alternate location on the original server.
- If you restore the Oracle database to an alternate node, the alternate
  server will not have the archive logs required for manual database
  recovery.
- As part of a restore job, UDP does not restore archive logs to the
  Oracle server. Instead, the archive logs from RPS mount point are
  cataloged with RMAN to use them during the recovery process.
- As a workaround, do the following:

  #. Perform export to disk. For more information about how to perform
     export backup to disk, see `Export backup to
     disk <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/restore_select_oracle_db_items_RMAN.htm%23exportbackup>`__.
  #. Connect to the database that you want to recover and run the
     following crosscheck commands:
     RMAN> CONFIGURE CHANNEL DEVICE TYPE DISK CLEAR; RMAN> ALLOCATE
     CHANNEL FOR MAINTENANCE DEVICE TYPE DISK; RMAN> RUN { CROSSCHECK
     BACKUP DEVICE TYPE DISK; CROSSCHECK COPY DEVICE TYPE DISK;
     CROSSCHECK BACKUP OF DATABASE DEVICE TYPE DISK; DELETE NOPROMPT
     EXPIRED BACKUP; DELETE NOPROMPT EXPIRED COPY; DELETE NOPROMPT
     EXPIRED BACKUP OF DATABASE; } RMAN> RELEASE CHANNEL;
  #. Catalog the exported backup files.
  #. Example:
  #. RMAN> CATALOG START WITH '\\\\serverX\\ExportBackup\\' NOPROMPT;
  #. RMAN> CATALOG START WITH '/mnt/ExportedBackup/' NOPROMPT;
  #. Run the following recovery and reset log commands:
  #. RMAN> RECOVER DATABASE;
  #. RMAN> ALTER DATABASE OPEN RESETLOGS;
  #. If the command to recover database still fails due to the
     unavailability of the archive logs, perform the PIT recovery using
     sequence number.
  #. **Note:** You can get the sequence number required for the PIT
     recovery in one of the following ways:

     - From the backup job activity logs for the respective session.
     - Example: Backup information - SCN: 7148365, log sequence number:
       79
     - From the backed-up archive log list that displays with the browse
       recovery point.
     - Example:
       LOG_ARCH_D-ORCL1_ID-1539984856_S-79_T-1_A-1542815267_FA2JIS03.

  #. On the RMAN restore browse UI, identify the backed-up archive log
     file that contains the maximum sequence number for the session from
     where the restore job is performed, and use that sequence number
     while performing the PIT recovery.
  #. Example:
     RMAN> RUN { SET UNTIL SEQUENCE 79 THREAD 1; RESTORE DATABASE;
     RECOVER DATABASE UNTIL SEQUENCE 79 THREAD 1; } RMAN> ALTER DATABASE
     OPEN RESETLOGS;
