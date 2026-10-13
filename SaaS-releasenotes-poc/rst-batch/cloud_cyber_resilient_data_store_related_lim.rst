Arcserve Cloud Cyber Resilient Data Store Related
=================================================

- We recommend avoiding the use of volumes larger than 64 TB for the
  index and destination folders in a Cloud data store. Microsoft's
  Volume Shadow Copy Service (VSS), which is used for creating
  snapshots, does not support volumes larger than 64 TB.
- When an RPS is moved from one console to another, the associated
  Arcserve Cloud Cyber Resilient Data Store gets detached automatically
  or does not appear in the available list.
- Arcserve Console - SaaS for UDP 10.1 supports only Recover VM, File
  and Folder Restore, Mount Recovery Point, Browse Recovery Point, and
  BMR from Arcserve Cloud Storage and Arcserve Cloud Cyber Resilient
  Data Store.
- When you switch from **Governance** to **Compliance** mode for object
  retention in the Cloud Storage portal, and then attempt to create a
  snapshot, the snapshot creation fails.
- **Note:** Arcserve does not recommend directly modifying cloud bucket
  properties within a cloud storage portal.
- Object Locking may be enabled even if it appears as disabled in the
  Cloud Storage portal. When you attempt to create a snapshot after
  manually enabling Object Locking in the cloud storage portal, the
  snapshot creation fails.
- **Note:** Arcserve does not recommend directly modifying cloud bucket
  properties within a cloud storage portal.
