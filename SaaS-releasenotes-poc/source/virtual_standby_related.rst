Virtual Standby Related
=======================

- Failed to connect to AWS Proxy.

  When performing the Virtual Standby (VSB) to AWS job and using the
  same Amazon EC2 instance for both the RPS and the VSB proxy, the
  connection to the AWS proxy fails and the following error message
  appears:

  *Proxy with name <parameter> already exists.*


- As a workaround, use a separate cloud proxy for ad-hoc VSB operations
  instead of reusing the existing RPS instance.

- The Virtual Standby Target VM Configuration API fails when a source is
  added with a VSB task.

- Symptom

- When a source is added with a VSB task for the versions prior to UDP
  10.0, the target VM configuration API may fail with a "Bad request"
  error. This error indicates that the network configuration request
  could not be processed due to an issue with the parameters or the
  state of the network components involved.

- Solution

- As a workaround, do the following:

  #. Navigate to **Protect** > **Sources**.
  #. From the Action drop-down list of a UDP source that you want to
     remove, select **Delete**, and then remove.
  #. Re-add the UDP Source. For information, see `Add a
     Source <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/acc_dc_add_source.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CProtecting%2520Sources%257CAdd%2520a%2520Source%2520%257C_____0>`__.
  #. Add a Virtual Standby (VSB) task from the Policy. For more
     information, see `Create a Virtual Standby
     Policy <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/crt_vsb_policy.htm?TocPath=Understanding%2520Arcserve%2520UDP%257CProtect%257CProtecting%2520Policies%257CAdding%2520a%2520Policy%2520for%2520Agent-Based%2520Windows%2520Backup%257CCreate%2520a%2520Virtual%2520Standby%2520Policy%257C_____0>`__.
  #. Perform a backup. For more information, see `How to Start a
     Backup <https://documentation.arcserve.com/Arcserve-Cloud/Available/Cloud_Console/ENU/olh/default.htm#Cloud%20Console/How%20to%20Start%20a%20Backup.htm?TocPath=Working%2520With%2520Arcserve%25C2%25AE%2520Cloud%2520Console%257CUDP%2520Related%257C_____1>`__.
  #. After successfully completing the backup and VSB task, check the
     network configuration settings.

- Virtual Standby machine does not appear under **Protect** > **Disaster
  Recovery** > **Virtual Standby** even though the VSB to Hyper-V job is
  completed successfully.

- Symptom

- Even though the VSB to Hyper-V job completes successfully, the virtual
  standby machine does not appear in the Virtual Standby grid because
  the Hyper-V, which acts as a monitor, fails to communicate with the
  gateway to sync the data with the managed console. The following error
  displays in the activity log:

- *[ERROR] VCMStatusSyncer.doSync - Fail to sync VCM status of node
  <parameter>.Connection timed out: connect*

- Solution

- Make sure that RPS and gateway are reachable from Hyper-V (monitor).
