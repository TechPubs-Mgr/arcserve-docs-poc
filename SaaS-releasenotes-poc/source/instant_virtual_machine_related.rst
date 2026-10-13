Instant Virtual Machine Related
===============================

- The VM Location page may fail to load available resources after
  changing the selected hypervisor while creating an Instant Virtual
  Machine (IVM).

  While creating an Instant Virtual Machine (IVM), the VM Location page
  may fail to load available resources after changing the selected
  hypervisor and display the following error message:

  *Select an available ESX Server, Cluster, Resource Pool, or vApp as
  the VM Location.*

  As a workaround, perform one of the following actions:

  - Switch between the hypervisors in the Hypervisor drop-down list and
    then reselect the target ESX hypervisor.
  - Restart the IVM wizard and retry the operation from Step 1 (Select a
    Recovery Point page).


- The InstantVMagent.exe file crashed or the InstantVM job failed, and
  the following error occurs:

- *[NFC ERROR]NfcAioRcvErrorMsg: Error from server:
  NfcAioProcessSrvOpIoCallback: An IO operation failed*

  On the ESX, when the NFS volume count is reached to maximum, the
  InstantVM job may fail or the InstantVMagent.exe file may crash.

  As a workaround, do the following:

  #. To edit the advanced configuration option, select the ESXi/ESX host
     in the Inventory Panel.
  #. To launch the Settings window, go to **Configuration** >
     **Software** > **Advanced Settings**.
  #. The screen displays options to set the volume counts from Default
     to Maximum.
  #. For NFS, select **NFS.MaxVolumes:** Limits the number of NFS
     datastores that can be mounted by the vSphere ESXi/ESX host
     concurrently.
  #. **Note:** For ESXi 6.7, the default value is 8. For ESXi 7.0, the
     default value is 32; however, you can increase to a maximum value
     especially for the ESXi/ESX versions.
