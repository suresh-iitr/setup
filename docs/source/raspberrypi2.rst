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

The purpose of this module is as a data collection tool and IoT gateway

Installation: ``Docker Image/Container``

Version: ``v2.0.1``

Imagename: ``19914039/fledge:aarch64``

Container name: ``fledge``

Website link: https://fledge-iot.readthedocs.io/en/latest/

Github link: https://github.com/fledge-iot/fledge


The source dir for the ``Dockerfile`` is ``~/fledge-iot``

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

------
GUI
------

The fledge GUI is already installed on this device. As soon as your fledge starts, the fledge-gui will start interacting with Fledge.

.. note::

  The fledge-gui is same for both ``fledge`` running in the container and ``fledgePOWER`` running locally on the device. So it is adviced to use only one either of them while the other is stopped.


*address*: ``localhost``

(or)

*address*: ``raspberrypi2.local``

------
Stop Fledge
------

.. code-block:: console

   docker stop fledge  # to stop the container

.. note::

  Although the current installation has ``north-azure`` plugin, It fails to send data to Azure cloud instance. Incase you want to use azure-north service, use the fledge instance available on ``raspberrypi3.local``

======
FledgePOWER
======

The purpose of this module is as a data collection tool and a industrial gateway

Installation: ``from source code``

Version: ``v2.0.1``


Website link: https://wiki.lfenergy.org/display/FLED/FledgePower

Github link: https://github.com/fledge-power


The source dir conatining all the modules of fledgePOWER is ``~/fledge-src``

.. note::

  The fledge-core and fledge-gui are same even for ``FledgePOWER`` 


------
Installation
------

The installation of fledgePOWER and all it's associated modules is done as per the source documentation available on github for each module. 

.. note::

  Soon the document will be updated here.


------
Start FledgePOWER
------

.. code-block:: console

  sudo /usr/local/fledge/bin/fledge start
  # to check the status
  sudo /usr/local/fledge/bin/fledge status

------
GUI
------

The fledge GUI is already installed on this device. As soon as your fledge starts, the fledge-gui will start interacting with Fledge.

.. note::

  The fledge-gui is same for both ``fledge`` running in the container and ``fledgePOWER`` running locally on the device. So it is adviced to use only one either of them while the other is stopped.


*address*: ``localhost``

(or)

*address*: ``raspberrypi2.local``

------
Stop Fledge
------

.. code-block:: console

   sudo /usr/local/fledge/bin/fledge stop

======
InfluxDB
======

the installation is same as documented in :doc:`raspberrypi1.local`

The only difference is while creating the container instnace, ``--log-driver=fluentd`` is attached to demonstrate the use case of ``fluent-bit`` collecting the container logs and forward to ``openserach``

.. code-block:: console

  docker run --name influxdb -d -p 8086:8086 --log-driver=fluentd --log-opt fluentd-address=0.0.0.0:24224 --log-opt tag={{.Name}} --log-opt fluentd-async=true influxdb:2.4.0

======
Grafana
======

the installation is same as documented in :doc:`raspberrypi1.local`

The only difference is while creating the container instnace, ``--log-driver=fluentd`` is attached to demonstrate the use case of ``fluent-bit`` collecting the container logs and forward to ``openserach``

.. code-block:: console

  docker run -d --name=grafana --restart=always -p 3000:3000 -v DataVolume:/DataVolume --log-driver=fluentd --log-opt fluentd-address=0.0.0.0:24224 --log-opt tag={{.Name}} --log-opt fluentd-async=true  grafana/grafana-oss


======
Openserach
======

An opensource search engine that can be used for log analysis and SIEM design.

Installation: ``Docker Image/Container (official image)``

Version: ``1.3.6``

.. note::

  Although there is a newer version of ``opensearch`` is available (v2.1.1), due to the compatibility issues with both ``fluentbit`` and ``grafana``, we choose to go with v1.3.6. both fluent-bit and Grafana will not support opensearch 2.x. Therefore we will go with openserach 1.x

Imagename: ``opensearchproject/opensearch:1.3.6``

Container name: ``openserach``

Website link: https://opensearch.org/

Github link: https://github.com/opensearch-project

.. note::

  On this device the ``openserach`` container is already created with default configs and if you wnat to start it, you can skip the below two sections and directly go to ``Start Openserach``

------
Create Image
------

``Docker Image is already created for opensearch:1.3.6``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull opensearchproject/opensearch:1.3.6

------
Create Container
------

``Docker Container is already created for opensearch`` with the name **opensearch**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

  docker network create opensearch   
  docker run -d --name opensearch --net=opensearch --restart=always -p 9200:9200 -p 9600:9600 -e "discovery.type=single-node" opensearchproject/opensearch:1.3.6

------
Start Opensearch
------

.. code-block:: console

   docker start opensearch  # to start the container

------
Credentials
------

*username*: ``admin``

*password*: ``admin``


------
Testing
-------

It can be tested in two ways:

1. using the browser

open any browser and enter ``https://localhost:9200/``

It will ask for username and password 

pass ``admin`` and ``admin``

2. Using CURL

.. code-block:: console

  curl -X GET -k https://localhost:9200 -u 'admin:admin'

------
Configure
------

by default opensearch will start with TLS and authentication enabled. default authentication credentials ``admin:admin``
if you want to disable TLS add the below line to opensearch.yml

``plugins.security.ssl.http.enabled: false`` (default is true)

.. note::

  here we just disabled the TLS and the Authetication is still enabled.

The config file for openserach is avaibale at ``~/openserach/config/opensearch.yml``

After doing the modifications, if we want to pass this new configuration to openserach, we have to copy this modified config file to openserach container and then restart the container to get chages effect.

.. code-block:: console

  docker cp ~/opensearch-dashboards/config/opensearch_dashboards.yml opensearch-dash:/usr/share/opensearch-dashboards/config/opensearch_dashboards.yml
  docker restart opensearch

------
Stop Opensearch
------

.. code-block:: console

   docker stop opensearch  # to stop the container

======
Openserach-dashboards
======

Visualization layer for ``openserach``

Installation: ``Docker Image/Container (official image)``

Version: ``1.3.6``


Imagename: ``opensearchproject/opensearch-dashboards:1.3.6``

Container name: ``opensearch-dash``

Website link: https://opensearch.org/

Github link: https://github.com/opensearch-project

.. note::

  On this device the ``openserach-dash`` container is already created with default configs and if you wnat to start it, you can skip the below two sections and directly go to ``Start Openserach-dash``

------
Create Image
------

``Docker Image is already created for opensearch-dashboards:1.3.6``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull opensearchproject/opensearch-dashboards:1.3.6

------
Create Container
------

``Docker Container is already created for opensearch-dashboards`` with the name **opensearch-dash**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console
   
  docker run -d --name opensearch-dash --net=opensearch -p 5601:5601 opensearchproject/opensearch-dashboards:1.3.6

------
Start Opensearch-dash
------

.. code-block:: console

   docker start opensearch-dash  # to start the container

------
Credentials
------

*username*: ``admin``

*password*: ``admin``


------
GUI
-------

open any browser and enter ``https://localhost:5601/``

It will ask for username and password 

pass ``admin`` and ``admin``

------
Configure
------

In order to let the openserach-dashboards detect the opensearch running instance, we need to do some configuration changes.

- Modifications

``Line 175: opensearch.hosts: [https://opensearch:9200]``

``Line 176: opensearch.ssl.verificationMode: none``

``Line 177: opensearch.username: admin``

``Line 178: opensearch.password: admin``

``Line 186: server.host: '0.0.0.0'``


.. note::

  to work this both the container must be attached to the same network.

The config file for openserach is avaibale at ``~/openserach/config/opensearch.yml``

After doing the modifications, if we want to pass this new configuration to openserach, we have to copy this modified config file to openserach container and then restart the container to get chages effect.

.. code-block:: console

  docker cp ~/opensearch-dashboards/config/opensearch_dashboards.yml opensearch-dash:/usr/share/opensearch-dashboards/config/opensearch_dashboards.yml
  docker restart opensearch

------
Stop Opensearch
------

.. code-block:: console

   docker stop opensearch  # to stop the container


