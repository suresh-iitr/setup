********
raspberrypi3.local
********

This device is mainly for the purpose of IoT applications and any tools that are only comatible with 32-bit debian systems

======
OS Details
======
Debian Buster OS, 32-bit, Armhf

======
Hostname
======
raspberrypi3.local

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
*VNC server address*: ``raspberrypi3.local``

*username*: ``pi``

*password*: ``raspberry``


======
Modules Installed In the device
======


======
Fledge-IoT
======



======
Fledge-IoT Azure Integration Test
======


This is about the ``fledge-IoT`` north-azure plugin Integration with Azure Cloud Services.

For the purpose of demonstration, we are using ``dht11`` sensor connected to Raspi GPIO pins.


This setup requires the following modules running:

- **DHT11** sensor connected to GPIO pins of ``raspberrypi3.local``

- **Fledge-IoT** running on ``raspberrypi3.local`` with corresponding ``south-dht11`` and ``north-azure`` configured.

.. note::

   The same azure plugin in not working with ``fledge v2.0.1``. Therefore it is sugeested to use this fledge instance for Azure cloud integration test.


A video tutorial demonstrating this use case is available at: https://drive.google.com/file/d/1G9esDsLip7EuYx6xWcOUmhOClSkzYaZE/view?usp=drive_link


======
Volttron
======

``**Not Compatible with Arm7 Architecture**``


