DR Related
==========

- After a block-level DRaaS restore, Windows marks disks that were
  previously configured as Dynamic Disks (Logical Disk Manager, LDM) as
  Invalid.


- After a DRaaS block-level restore, Windows marks disks that were
  previously configured as Dynamic (LDM) as invalid. This happens due to
  disk metadata misalignment after restore.

- To prevent this, the system automatically converts supported Dynamic
  disks to Basic disks during the EC2 Prepare Phase. This ensures the
  restored VM can boot successfully and data remains accessible without
  user intervention.

- **Solution**

  No action is required from the user; the DRaaS proxy performs the
  conversion automatically. This step is required to realign disk
  structures and make volumes accessible to Windows.

  **Important!** After the conversion, volume labels may change. Verify
  the updated labels before performing any post-recovery operations, as
  they may no longer match the original configuration.

  The following table outlines the supported and unsupported
  configurations for automatic Dynamic-to-Basic disk conversion during
  recovery.

  +-----------+-----------------+-------------------+-------------------+
  | Disk type | Partition style | Volume type       | Conversion        |
  |           |                 |                   | Support           |
  +-----------+-----------------+-------------------+-------------------+
  | Dynamic   | GPT             | Simple (single    | Yes               |
  |           |                 | partition per     |                   |
  |           |                 | volume)           |                   |
  +-----------+-----------------+-------------------+-------------------+
  | Dynamic   | MBR             | Simple (single    | Yes               |
  |           |                 | partition per     |                   |
  |           |                 | volume)           |                   |
  +-----------+-----------------+-------------------+-------------------+
  | Dynamic   | GPT             | Spanned / Striped | No; conversion    |
  |           |                 | / Mirrored        | skipped           |
  +-----------+-----------------+-------------------+-------------------+
  | Dynamic   | MBR             | More than 4       | No; exceeds MBR   |
  |           |                 | volumes           | primary partition |
  |           |                 |                   | limit             |
  +-----------+-----------------+-------------------+-------------------+
  | Basic     | Any             | Any               | No action taken   |
  +-----------+-----------------+-------------------+-------------------+
