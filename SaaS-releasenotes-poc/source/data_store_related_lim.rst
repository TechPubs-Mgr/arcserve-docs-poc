Data Store Related
==================

- We recommend avoiding the use of volumes larger than 64 TB for the
  index and destination folders in a Cloud data store. Microsoft's
  Volume Shadow Copy Service (VSS), which is used for creating
  snapshots, does not support volumes larger than 64 TB.
