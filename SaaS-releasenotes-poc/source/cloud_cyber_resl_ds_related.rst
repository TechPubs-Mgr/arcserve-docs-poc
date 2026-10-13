Arcserve Cloud Cyber Resilient Data Store Related
=================================================

- After you import the immutable snapshots as a read-only data store and
  detach Arcserve Cyber Resilient Data Store from RPS, the metadata
  folders (destination or index) created on local path for the cloud
  data store are not automatically deleted.

- When you update an already existing cloud account with the new access
  keys, the policies associated with that cloud account fail to get
  deployed automatically. As a workaround, manually redeploy the failed
  policies to ensure they are applied correctly.

- If you import an Arcserve Cloud Cyber Resilient Data Store to a
  different organization other than the original organization where the
  data store was created, then restore from that imported data store
  fails, and the following 403 error is displayed:

- *The current user does not have permissions to manage the resource.*

- Failed to create immutable snapshot.


- When you perform the Create Immutable Snapshot job, the creation of
  immutable snapshot fails and the following error message is displayed:

- **In the activity log:**

- *Failed to create immutable snapshot [<parameter>] for the data store
  [<parameter>].*

- **In the Cloudobjlock log file:**

- *operation error S3: PutObjectRetention, failed to get rate limit
  token, retry quota exceeded, 0 available, 10 requested*

- **Solution**

  Please retry after sometime. Alternatively, add the
  "CloudSnapshotThreads" downword registry keyword and set its value to
  a lower number. Each CPU core supports up to 20 threads, so the total
  recommended value is calculated as: Number of CPU cores × 20. Add this
  keyword in the following registry path:

  *HKEY_LOCAL_MACHINE\\SOFTWARE\\Arcserve\\Unified Data
  Protection\\Engine\\DataStore\\<datastore display name>\\GDD*
