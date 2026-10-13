Proxmox Related
===============

- Failed to power on VM after restore.


- When you restore a VM from a higher-version Proxmox server to a
  lower-version Proxmox server, the restore operation may fail. In some
  cases, the restore operation completes successfully, but the VM fails
  to power on after the restore.

- **Solution**

  As a workaround, restore the VM to a Proxmox server that is running
  the same or a later version than the source Proxmox server.
