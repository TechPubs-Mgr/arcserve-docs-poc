Metadata Synchronization Related
================================

- Synchronization of data store metadata failed.
- **:**
- Arcserve UDP data store appears in Restore Only (Degraded
  State)/Abnormal Restore Only status whenever metadata synchronization
  may fail for multiple reasons, such as intermittent connections to the
  cloud, failed file uploads to the cloud, or issues with taking the VSS
  snapshot.
- For more information about the error, refer to the GDD server index
  role log in: *C:\\Program Files\\Arcserve\\Unified Data
  Protection\\Engine\\Logs*
- The next metadata sync, which runs every 15 minutes, should resolve
  the issue. Alternatively, a manual metadata sync can be triggered
  using the as_gddmgr.exe tool located in the following path:
- C:\\Program Files\\Arcserve\\Unified Data Protection\\Engine\\BIN
