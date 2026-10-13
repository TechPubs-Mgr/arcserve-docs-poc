Issues Fixed
============

- Fixed an issue wherein creating immutable snapshots failed when
  multiple Arcserve Cloud Cyber Resilient Storage (ACCRS) accounts were
  added using the same access key and secret key under **Cloud
  Accounts**.
- Fixed an issue wherein the source machine failed to remove and
  displayed an Unable to find resource with ID error, even after a
  successful or failed RPS jumpstart.
- Fixed an issue wherein the report alerts with more than 20 email
  recipients failed to delete due to an internal error.
- Fixed an issue wherein the customer accounts within an MSP
  organization failed to delete due to an internal error.
- Fixed an issue wherein the Cloud Direct agentless policy was getting
  failed to save after modification.
- Fixed an issue wherein the *Daily Backups*, *Weekly Backups*, and
  *Monthly Backups* retention fields were grayed out for the Copy To
  Another Data Store task in the Copy from remotely-managed RPS primary
  task.
- Fixed an issue wherein the job status was automatically getting
  updated to *Out of Sync* if the job runs for more than 12 hours even
  though the job was running in the background.
- Fixed an issue related to the Cloud Direct DRaaS policy and hypervisor
  policy, in which the backup schedule was supposed to display only
  *Every 1 Day* option instead of the *Every 15 Mins*, *Every 1 Hour*,
  and *Every 6 Hours* options.
- Fixed an issue wherein the monthly recovery points retention was not
  showing on the Wasabi Cloud datastore.
- Fixed an issue wherein the console displays the following messages
  while performing a Linux machine IVM:

  - The sessionType cannot be blank.
  - The destinationPath cannot be blank.

- Fixed an issue wherein the filters alignment was incorrect.
- Fixed an issue wherein the policy deployment got stuck, and the status
  shows as *Deploying*.
- Fixed an issue wherein the policy deployment got stuck, and the status
  shows as *Deploying* when the user has more than 12 Cloud Direct
  sources in a single Cloud Direct policy.
- Fixed an issue wherein the user was unable to delete the Arcserve
  cloud volume on the new Arcserve Console - SaaS. To delete a cloud
  volume from the Arcserve Console - SaaS, remove the Cloud Direct
  sources and its associated policies.
