Console Related
===============

- Deleting a mounted SQL database using SQL Server Management Studio
  does not unmount the database.


- If you mount a SQL database and then delete it using SQL Server
  Management Studio (SSMS), the database is not unmounted and continues
  to appear as a mounted recovery point under **Protect** > **Disaster
  Recovery** > **Mounted Recovery Points**, with the Unmount option
  still available.

- **Solution**

  As a workaround, manually unmount the deleted database.

To unmount, follow these steps:
-------------------------------

  #. Navigate to **Protect** > **Disaster Recovery** > **Mounted
     Recovery Points**.
  #. From the **Action** drop-down list, click **Unmount**.
  #. The confirmation dialog appears asking whether you want to unmount
     the recovery point.
  #. Click **OK** to confirm.
