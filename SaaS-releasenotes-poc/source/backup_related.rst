Backup Related
==============

- Backup job may fail to start when a policy is not assigned to a
  source.


- If no policy is assigned to a source and you run a backup job, the
  backup job may fail to start and display the following error message:

- *Source WIN-SRC-20 does not contain a policy*

- **Solution**

  As a workaround, re-assign the policy to the source, and then run the
  backup job again.


- Source Protection Status does not update when a Linux agent-based
  source is powered off.


- When a Linux agent-based source is powered off, the source protection
  status does not change to *Unprotected* or *Offline*. The system
  continues to display the previous status because it determines the
  connection state based on the Linux Backup Server (LBS), not the
  source machine. Since the Linux agent does not maintain a persistent
  connection or heartbeat with the server, the system detects power-off
  events only when a backup operation runs.

- **Solution**

  As a workaround, do the following:

  - Verify the source power status directly on the host or hypervisor.
  - Review the most recent backup job logs for connectivity details.
  - Run a manual backup job to confirm whether the source is reachable.


- Backup job fails on Linux source machine when the
  *postgresql_settings* file is configured on RHEL 9.3.


- When you run a PostgreSQL backup job on a Linux source machine with
  the *postgresql_settings* file configured on RHEL 9.3, the job fails
  with the following error:
  sudo: error in /etc/sudo.conf, line 14 while loading plugin
  "sudoers_policy" sudo: unable to load /usr/libexec/sudo/sudoers.so:
  /lib64/libldap.so.2: undefined symbol: EVP_md2, version OPENSSL_3.0.0
  sudo: fatal error, unable to load plugins" in this
  arcserve_postgresql_backup\_${DATE}.log file

- This issue occurs due to a known problem in RHEL 9.3, where OpenLDAP
  is compiled with OpenSSL.

- **Solution**

  As a workaround, do one of the following:

  - Upgrade RHEL
  - **Follow these steps:**

    #. Upgrade RHEL 9.3 to RHEL 9.4 or later.
    #. Run the following command to check if the required function
       exists in the OpenSSL library:
       nm -D /usr/lib64/libcrypto.so.3 \| grep EVP_md2

  - Update packages on RHEL 9.3
  - **Follow these steps:**

    #. Update the packages and reboot the node using the following
       commands:
       dnf update dnf reinstall sudo openldap openssl-libs
    #. Run the following commands:
       mkdir -p /mnt/server/archivedir/; chmod 0777
       /mnt/server/archivedir/ useradd postgres
    #. Update the *postgresql.conf* file using the following commands:
       wal_level = archive archive_mode = on archive_command = 'test !
       -f /mnt/server/archivedir/%f && cp %p /mnt/server/archivedir/%f'
    #. Restart the PostgreSQL service using the following command:
       systemctl restart postgresql-<version>.service


- An agentless VMware backup job crashes during the finalization phase.


- When performing an agentless VMware backup job, the job runs
  successfully without any issues but crashes during the finalization
  phase. Although recovery points are available, attempting to browse
  files or folders displays the following error message:

- *Failed to browse this volume: The system cannot find the path
  specified.*

- The Event Viewer logs indicate a fault in *AFBackend.exe*, caused by
  *V2PNativeFacade.dll*.

- **Solution**

  As a workaround, upgrade to Arcserve UDP 10.3 and re-run the backup
  job.


- Failed to protect the newly added VMs when a custom or ad-hoc backup
  job is triggered.


- As a part of auto protection policy, Arcserve Console - SaaS does not
  backup the newly added VMS using the custom or ad-hoc backups.

- **Solution**

  As a workaround, add a backup schedule to auto protect the newly added
  VMs.
