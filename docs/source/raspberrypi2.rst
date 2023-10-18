********
raspberrypi2.local
********

The main intention of this device is 

1. FledgePOWER for data collection over differnt protocols

2. Database for data storage: InfluxDB

3. Visulatization: Grafana

======
Data Source
======

.. note::

  The data source for this device could be with 3 options

  1. Simulation Tools running on ``raspberrypi1.local``

  2. Simulation Tools running on ``Winodws PC``

  3. Real Hardware device

-------
raspberrypi1.local
-------

This device acts as a data server for:

1. 61850-9-2 SV protocol using ``MU_Simulator``

2. 61850 GOOSE using ``libiec61850`` examples available at https://github.com/mz-automation/libiec61850/tree/v1.5/examples

3. 61850 MMS using ``libiec61850`` examples

4. MQTT data publisher using ``mosquitto_pub``


-------
Windows PC
-------

This device acts as a data server for:

1. IEC-104 Server using ``FreyrIEC104Server`` simulator available at  https://sourceforge.net/projects/iec-104-client-simulator/files/ https://sourceforge.net/projects/iec-101-server-simulator/

2. DNP3 using ``FreyrDNP3Outstation`` simulator available at: https://sourceforge.net/projects/dnp3-client-master-simulator/ https://sourceforge.net/projects/dnp3-outstation-simulator/

3. Modbus Simulator using https://www.hmisys.com/


-------
Hardware Devices
-------

It can be any hardware device that supports the required communication protocol and acts as a data server.

======
OS Details
======
Debian Bullseye OS, 64-bit, Armhf

======
Hostname
======
raspberrypi2.local

======
Credentials
======
*username*: ``pi``

*password*: ``raspberry``

======
SSH Credentials
======
*username*: ``pi``

*password*: ``raspberry``

To do ssh to the device over local LAN:

.. code-block:: console

   ssh pi@raspberrypi1.local
   # it will ask to add the device signature to the list.
   # type yes
   # enter the password: raspberry

======
VNC Credentials
======
*VNC server address*: ``raspberrypi.local``

*username*: ``pi``

*password*: ``raspberry``

======
Modules Installed In the device
======



