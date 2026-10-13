Enhancements (January, 2026)
============================

This release provides the following enhancements:

- **Updated Email Alert Behavior for Arcserve Cloud Storage (ACS) and
  Arcserve Cloud Cyber Resilient Storage (ACCRS):** This enhancement
  updates how and when the system sends email alerts for ACS and ACCRS.
  Instead of sending daily notifications, the system now consolidates
  alerts into a weekly schedule every Tuesday. It also adjusts alert
  frequency for storage consumption and license expiry milestones,
  ensuring you receive timely but less repetitive notifications.
- **Note:** These updates do not affect in-app console alerts.

  - **General Alert Frequency**
  - The system now sends email alerts weekly instead of daily. It
    delivers alerts every Tuesday.
  - **Storage Consumption (license usage)**

    - At 80% consumption, the system sends a one-time email alert.
    - At 100%, 105% or higher storage consumption, the system sends
      weekly email alerts every Tuesday.

  - **License Expiry Alerts**
  - The system sends one-time email alerts at the following milestones:

    - Expiry -60 days
    - Expiry -30 days
    - Expiry -7 days
    - Expiry day
    - Expiry +30 days

  - Starting at Expiry +1 day and continuing from Expiry +31 days
    onward, the system sends weekly email alerts every Tuesday.

- **Protection Status Display:** The system displays the protection
  status of a source based on the last backup result, connection status,
  and policy deployment status:

  - When the most recent backup fails or is missed, the connection
    status is offline, or the policy deployment fails, the system
    displays the protection status as *Unprotected*.
  - When the most recent backup succeeds, the connection status is
    online, or the policy deployment succeeds, the system displays the
    protection status as *Protected*.

- **Arcserve Console - SaaS UI/UX Enhancements:** To improve user
  experience, the following enhancements have been introduced in the
  Arcserve Console - SaaS UI:

  - **First-run Setup through Quick Start Guide:** Guides first-time
    users through login, displaying the Quick Start Guide as a docked
    panel that stays accessible across all navigation.
  - **Notification or Message Auto-dismissal:** Notifications
    automatically dismiss after a defined period.

    - Success and informational notifications auto-dismiss after 30
      seconds.
    - Warning, failure, and error notifications auto-dismiss after 10
      minutes.

  - **Previous or Next Navigation in Policy Wizard:** Adds Previous and
    Next controls to all wizard steps, allowing sequential navigation.
  - **Dashboard Policies Widget:** The Dashboard ‘Policies’ widget
    displays accurate counts and links to Policies with correct filters.
  - **RPS Deployment Status Icon:** Replaces the green arrow with a
    spinner or circular progress icon during deployment.
  - **Replace ‘+’ with ‘Add Task’ in Tasks Panel:** Replaces the ‘+’
    icon with an *Add Task* button that opens the task creation
    workflow.
  - **Show or Hide Password Feature:** Adds a Show or Hide toggle to
    password inputs. Passwords remain hidden by default and are revealed
    only when toggled.

- **User Interface Performance Improvements:** To improve the user
  experience, we have reduced the page load times and resolved UI lag
  issues. These improvements deliver a faster, smoother, and more
  responsive interface.
