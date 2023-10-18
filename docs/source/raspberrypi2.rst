********
raspberrypi2.local
********

The main intention of this device is 

1. FledgePOWER for data collection over differnt protocols

2. Database for data storage: InfluxDB

3. Visulatization: Grafana


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


------
Hardware Devices
------

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


======
Fledge
======

The purpose of this module is as a data collection tool

Installation: ``Docker Image/Container``

Version: ``v2.0.1``

Imagename: ``19914039/fledge:aarch64``

Container name: ``fledge``

Website link: https://fledge-iot.readthedocs.io/en/latest/

Github link: https://github.com/fledge-iot/fledge


The sourec dir for the ``Dockerfile`` is ``~/fledge-iot``

.. note::

  On this device the fledge container is already created with default configs and if you wnat to start it, you can skip the below two sections and directly go to ``Start Fledge`` 

------
Create Image
------

``Docker Image is already created for 19914039/fledge:aarch64``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull 19914039/fledge:aarch64

------
Create Container
------

``Docker Container is already created for fledge`` with the name **fledge**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

  docker run -d --name fledge -p 8080:8080 -p 1995:1995 -p 8081:8081 19914039/fledge:aarch64
  # if you want to interface grafana and fledge, It's better to attach both the containers on the same network

  # Create a network named grafana
  docker network create grafana
  docker run -d --name fledge --net grafana -p 8080:8080 -p 1995:1995 -p 8081:8081 19914039/fledge:aarch64

.. note::

  The current installation exposes only the REST API ports. When your are running any ``north-service`` that is acting like a server and has to expose listening port to the outside, we have re-create the container with specifying the ports to be exposed. Coming to the south-side, ``No issues``

------
Start Fledge
------

.. code-block:: console

   docker start fledge  # to start the container



