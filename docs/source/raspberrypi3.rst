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

The purpose of this module is as a data collection tool and IoT gateway

Installation: `apt respository``

Version: ``v1.9.1``

Website link: https://fledge-iot.readthedocs.io/en/latest/

Github link: https://github.com/fledge-iot/fledge


By default the installation directory for fledge would be ``/usr/local/fledge``

A video tutorial showing how to do the installation is available at https://drive.google.com/file/d/1pDiBOiFoVRn0fmfdag26J97FRQVk9O-o/view?usp=drive_link


On this device, the fledge is installed allong with the following modules:

1. **fledge**
2. **fledge-gui** 
3. **filter modules**: fledge-filter-change fledge-filter-delta fledge-filter-expression fledge-filter-fft fledge-filter-flirvalidity fledge-filter-log fledge-filter-metadata fledge-filter-omfhint fledge-filter-python27 fledge-filter-python35 fledge-filter-rate fledge-filter-rms fledge-filter-scale-set fledge-filter-scale fledge-filter-threshold 
4. **Notification**: fledge-gcp fledge-mqtt fledge-notify-alexa fledge-notify-asset fledge-notify-blynk fledge-notify-email fledge-notify-hangouts fledge-notify-ifttt fledge-notify-mqtt fledge-notify-operation fledge-notify-python35 fledge-notify-setpoint fledge-notify-slack fledge-notify-telegram
5. **North Services**: fledge-north-azure fledge-north-gcp fledge-north-harperdb fledge-north-http-north fledge-north-httpc fledge-north-kafka-python fledge-north-kafka fledge-north-thingspeak
6. **Rules-plugins**: fledge-rule-average fledge-rule-outofbound fledge-rule-simple-expression fledge-service-notification
7. **south-services**: fledge-south-am2315 fledge-south-b100 fledge-south-cc2650 fledge-south-coap fledge-south-csv fledge-south-dht11 fledge-south-dnp3 fledge-south-expression fledge-south-flirax8 fledge-south-game fledge-south-http-south fledge-south-j1708 fledge-south-lathe fledge-south-modbus fledge-south-modbustcp fledge-south-mqtt-readings fledge-south-mqtt-sparkplug fledge-south-openweathermap fledge-south-playback fledge-south-pt100 fledge-south-random fledge-south-randomwalk fledge-south-roxtec fledge-south-sensehat fledge-south-sensorphone fledge-south-sinusoid fledge-south-systeminfo fledge-south-wind-turbine

ofcourse this document doesn't cover all the modules, the official documentation for the same is available at: https://fledge-iot.readthedocs.io/en/latest/

------
Start Fledge
------


.. code-block:: console

   sudo /usr/local/fledge/bin/fledge start

------
Status
------

.. code-block:: console

   sudo /usr/local/fledge/bin/fledge status


------
GUI
------

The fledge GUI is already installed on this device. As soon as your fledge starts, the fledge-gui will start interacting with Fledge.


*address*: ``localhost``

(or)

*address*: ``raspberrypi3.local``

------
Stop Fledge
------

.. code-block:: console

   sudo /usr/local/fledge/bin/fledge stop


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


