Arcserve Cyber Resilient Data Store Related
===========================================

- When upgrading Arcserve Cyber Resilient Storage from version 1.0.54 to
  1.5.180, the progress bar may not display correctly. However, the
  update proceeds as expected, and the system automatically restarts
  when the process is complete.
- The datastore status changes to "Restore only" when the file system is
  unmounted.
- If the Arcserve Cyber Resilient Storage (CRS) Server is shut down or
  the network connection between the RPS Server and the CRS Server is
  disrupted for an extended period, the datastore status may sometimes
  show *Restore Only*, depending on the RPS state and network
  conditions. This is an incorrect state and typically occurs due to
  transient network issues.
- Using an incorrect port number during the configuration of Cyber
  Resilient data store results in error messages.
- While using UDP Console to manage the RPS Server, if you attempt to
  configure a new Cyber Resilient data store and provide an incorrect
  port number on the Arcserve Cyber Resilient Storage server, the
  following error message is displayed:
- *Invalid Cyber Resilient Storage data store configuration.*
- However, in some cases, due to transient network conditions, you may
  see the following generic error message:
- *Something went wrong. Please try again later.*
- The *snapshot list* command, along with the UDP Console and Arcserve
  Console - SaaS, displays the estimated amount of data occupied by
  changed blocks since each snapshot was created.
- Installing any update results in a reboot of the Arcserve Cyber
  Resilient Storage Server. You must pause all plans before proceeding
  with the update.
