DR Runbook Related
==================

- While adding a DR Runbook, the **Source** drop-down list in the *Add
  Source* dialog does not display sources replicated from a remote site
  using the *Copy from remotely managed RPS* protection type. Only
  locally managed sources are available for selection.
- When recovering a Windows source as a EC2 instance, the disk order and
  disk numbers assigned to Amazon EBS volumes may differ from the source
  instance and can change across reboots or recovery methods. This
  behavior is expected on AWS Nitro-based instances, where EBS volumes
  are detected in a dynamic order during system boot. As a result, disk
  numbers are not guaranteed to remain consistent. Do not use disk
  numbers as persistent identifiers. Use EBS Volume IDs or drive letters
  instead.
