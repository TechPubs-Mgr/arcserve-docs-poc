Read-Only Data Store Related
============================

- When a valid port number is not provided, the *Import Immutable
  Snapshot for Restore* job as a Read-only data store fails with the
  following incorrect error message:

- *Failed to get ownership of the data store. Please check if it is a
  valid data store.*

- Ad-hoc restore jobs fail with read-only data stores (RODS).


- When the target data store is configured as read-only, all ad-hoc
  restore jobs consistently fail due to a disconnection or communication
  issue with the Arcserve Cyber Resilient Storage device. Additionally,
  the start and stop data store jobs also do not work.

- **Solution**

  Check the connectivity with the Arcserve Cyber Resilient Storage
  device and then start the data store.


- Restore jobs fail or hang due to the accidental deletion or expiry of
  access keys.


- When access keys associated with a read-only data store (RODS) are
  accidentally deleted or expired, any subsequent restore jobs
  attempting to access that data store may fail or hang. This occurs
  because the system can no longer authenticate and authorize access to
  the underlying storage.

- **Solution**

  As a workaround, detach and reattach the read-only data store using
  the new access keys.
