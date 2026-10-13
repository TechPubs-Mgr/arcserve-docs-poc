Proxmox Related
===============

- Secondary tasks (Ad-hoc and Scheduled) are not supported.
- Backup jobs are supported only when the Linux Backup Server (Linux
  Proxy) resides on the same selected Proxmox server as the source
  nodes.
- Elevated users are not supported.
- Automatic protection of Proxmox virtual machines is not supported.
- The iSCSI transport mode is not supported for Proxmox Virtual
  Environment backups.
- Proxmox VE authentication is not supported.
- **Note:** Only Linux PAM standard authentication is supported.
- File restore to the original or an alternate location is not
  supported.
- Recovering a virtual machine (VM) to a different cluster or to a
  different Proxmox server within a cluster without shared storage is
  not supported.
- Bare Metal Recovery (BMR) is not supported.
- ReFS volume restore is not supported.
- Backup of Proxmox LXC containers is not supported.
- Backup of Proxmox VM templates is not supported. Only standard virtual
  machines can be backed up.
- Local Disk and NFS destinations are not supported.
- Specifying a network for backup or restore is not supported.
- When you recover a VM to an alternate location, the *Resource Pool*
  drop-down list displays available resource pools. However, the
  restored VM is not added to the selected resource pool because this
  functionality is not currently supported.
- Proxmox agentless nodes must be protected using a dedicated plan.
  Mixing Proxmox agentless VMs with non‑Proxmox agentless nodes such as
  VMware, Hyper‑V, or Nutanix within the same plan is not supported.
- When a Proxmox agentless node is imported, the node name displays only
  the hostname or IP address. If the virtual machine (VM) is powered off
  or the QEMU Guest Agent is not installed, the node name is displayed
  in the **VM (<VM_Name>)** format.
