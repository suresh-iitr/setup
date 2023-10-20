********
Integrations
********

This document provide the guidance on integrations tested b/w the devices (or) modules for the purpose of demostration.

======
IEC-61850-MMS
======

Thia setup requires two devises running the modules as specified beolow:

- **61850-MMS-Server** is running on ``raspberrypi1.local``

- **61850-MMS-Client** is running on ``raspberrypi2.local``

- **InfluxDB** instance running on ``raspberrypi2.local``

- **Grafana** instance running on ``raspberrypi2.local``

-------
61850-MMS-Server Setup
-------

For the purpose of demostration, we have considered some basic examples available from ``libiec61850`` library by *mzautomation* https://github.com/mz-automation/libiec61850/tree/v1.5/examples 


