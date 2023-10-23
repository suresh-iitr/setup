********
raspberrypi1.local
********

The main intention of this device is 

1. To run Power System Analaysis

2. As a sample data generator mainly for 61850 related (SV, GOOSE, MMS) for ``raspberrypi2.local``


======
OS Details
======
Ubuntu-mate 22.04 and 64-bit

======
Hostname
======
raspberrypi1.local

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
*VNC server address*: ``raspberrypi1.local:5901``

*password*: ``ubuntu``

.. note::

  With this VNC server, the access to the browser limited. and more over copy paste opration is also limited


======
Modules Installed In the device
======


======
Dynawo
======

Installation: ``Docker Image/Container (Due to the dependency on Utuntu-mate 20.04)``

Version: ``1.3.0``

Imagename: ``dynawo:1.3.0``

Container name: ``dynawo``

Website link: https://dynawo.github.io/

Github link: https://github.com/dynawo

.. note::

  On this device the dynawo container is already created with default configs and if you wnat to start it, you can skip the below two sections and directly go to ``Start Dynawo``

------
Create Image
------

``Docker Image is already created for dynawo:1.3.0``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull 19914039/dynawo:1.3.0

------
Create Container
------

``Docker Container is already created for dynawo`` with the name **dynawo**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker run -d --name dynawo -e DISPLAT=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --net=host dynawo:1.3.0
   docker exec -it dynawo /bin/bash

------
Start Dynawo
------

.. code-block:: console

   docker start dynawo  # to start the container
   docker exec -it dynawo /bin/bash  # to get attach with the running container


------
Run Example
------

.. code-block:: console

   ./myEnvDynawo.sh jobs-with-curves examples/DynaWaltz/IEEE14/IEEE14_GeneratorDisconnections/IEEE14.jobs

   ./myEnvDynawo.sh jobs-with-curves examples/DynaSwing/IEEE14/IEEE14_Fault/IEEE14.jobs

   exit # to exit form the container.


------
Stop Dynawo
------

.. code-block:: console

   docker stop dynawo


------
Issues to Access Mozilla from Docker container
------

usually, docker container doesn't allow access to the GUI directly. we have to add ``-e DISPLAY=$DISPLAY`` while creating the container.

Dynawo stores the result in files as well as allows to display graphical results on firefox.

To enable this, do this modification to the container

.. code-block:: console

   apt-get install firefox
   apt-get install xauth
   # after starting the container we have to add the xauth
   # open the bash in host, and use 
   xauth list
   # copy the credentials displayed here and then add to the container xauth
   xauth add 

Refer to this link: https://github.com/19914039/ResearchWork/issues/57


=====
ANDES
=====

This is a python package installed directly using ``pip`` command

Installation: ``python package``

*Version*: ``v1.8.10``

Website link: https://docs.andes.app/en/latest/

Github link: https://github.com/cuihantao/andes


------
Install ANDES
------

.. code-block:: console

   pip install andes


------
Run ANDES
------
Two options

1. in the bash chage to the directory where the file to be execuited is located

.. code-block:: console

   cd /home/pi/andes/andes/cases/kundur   
   andes run kundur_full.xlsx

2. provide the absolute path

.. code-block:: console

   andes run kundur_full.xlsx -p /home/pi/andes/andes/cases/kundur


=====
Pandapower
=====

This is a python package installed directly using ``pip`` command

Installation: ``python package``

*Version*: ``v2.13.1``

Website link: https://www.pandapower.org/start/#interactive-tutorials-

Github link: https://github.com/e2nIEE/pandapower/blob/master/tutorials/minimal_example.ipynb


------
Install Pandapower
------

.. code-block:: console

   pip install pandapower


------
Run Pandapower
------

``pandapower is not a command line access toll as like ANDES. We can only use it in python scripting``

We need to create a python file and import the pandapower to use it. For the purpose of testing the available examples, clone to the repo using

.. code-block:: console

   git clone https://github.com/e2nIEE/pandapower.git
   cd pandapower 
   # we will import the existing example network and run power flow to test it
   nano pf-test.py
   # enter the follwing lines of code, ref: https://github.com/e2nIEE/pandapower/blob/master/tutorials/powerflow.ipynb
   import pandapower as pp
   import pandapower.networks
   net = pandapower.networks.example_simple()
   pp.runpp(net)
   print(net)
   print("\n")
   print(net.res_bus)
   # then save it (ctrl+o) and exit (ctrl+x)

   # to run the code use
   python3 pf-test.py

=====
Matpower
=====

This package requires either matlab or GNU octave installed on your device.

In our case we have choosen GNU Octave



Installation: ``from source``

*Version*: ``v7.1``

Website link: https://matpower.org/

Github link: https://github.com/MATPOWER/matpower


------
Install GNU Octave
------

.. code-block:: console

   sudo apt-get install octave


------
Install Matpower
------

.. code-block:: console

   git clone https://github.com/MATPOWER/matpower.git
   octave-cli
   cd /home/pi/matpower
   install_matpower  # to install matpower
   test_matpower  # to test the installation and test runs
   


------
Run Matpower
------

``Matpower can only be accessed from the octave-cli only and not from the bash directly``

.. code-block:: console

   octave-cli
   runpf('case9')  # to run example 9 bus network power flow
   help runpf

------
Exit
------

.. code-block:: console

   exit

=====
GridLab-D
=====

Power distribution system simulation and analysis tool.


Installation: ``from source``

*Version*: ``v5.1.0``

Website link: http://gridlab-d.shoutwiki.com/wiki/GridLAB-D_Wiki:GridLAB-D_Tutorial_Chapter_0_-_Introduction

Github link: https://github.com/gridlab-d/gridlab-d


------
Install GridLab-D
------

.. code-block:: console

   git clone https://github.com/gridlab-d/gridlab-d.git
   cd gridlab-d
   git submodule update --init
   mkdir cmake-build
   cd cmake-build
   cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -G "CodeBlocks - Unix Makefiles" ..
   sudo cmake --build . -j4 --target install
   sudo ldconfig
   gridlabd --version


------
Run Gridlab-D
------

Top be written


=====
Elasticsearch
=====

One of the popular serach engine and part of many log analysis/ SIEM platforms.

Installation: Docker Image/Container

Version: ``v8.10.2``

Imagename: ``elasticsearch:8.10.2``

Container name: ``elasticsearch``

Website link: https://www.elastic.co/guide/index.html

Github link: https://github.com/elastic/elasticsearch

.. note::

  By default, the container is instaniated with the required configurations. Therfore you can skip the below two steps and directly go to Start elasticsearch  

------
Create Image
------

``Docker Image is already created for elasticsearch:8.10.2``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull 19914039/elasticsearch:8.10.2

Before proceeding to creating the container, we need to adjust the max vm_memory for the device.

.. code-block:: console

   sudo sysctl -w vm.max_map_count=262144
   systemctl restart docker
   #(or) we can also try the bellow one
   sudo nano /etc/sysctl.conf
   # add the below line
   vm.max_map_count=262144
   # save using ``ctrl+o`` and then exit ``ctrl+x``
   # Reload the kernel parameters using sysctl
   sudo sysctl -p

   # Verify that the change was applied by checking the value
   cat /proc/sys/vm/max_map_count


.. note::

  If this is not set, then elsticsearch exit with errors.

------
Create Container
------

``Docker Container is already created for elasticsearch`` with the name **elasticsearch**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker network create elk
   docker run -it --name elasticsearch --net elk -p 9200:9200 -p 9300:9300 --user esuser -m 1GB -e "discovery.type=single-node" elasticsearch:8.10.2
   # for the first time we have to run with security enabled.
   # To start the elasticsearch
   cd elasticsearch
   ./bin/elasticsearch
   # now once the elasticsearch is started, then press ctrl+c to stop the server
   # now we will copy the modified config file for the elasticsearch
   docker cp ~/elasticsearch/elasticsearch.yml elasticsearch:/home/esuser/elasticsearch/config/elasticsearch.yml
   # in this config file we have disabled the security features
   # now restart elasticsearch again
   cd elasticsearch
   ./bin/elasticsearch
   
------
Start elsticsearch
------

.. code-block:: console

   # use this below command to start the existing kibana with default config
   docker start elasticsearch  # to start the container
   # In case if you want to get attach to the container to do some modifications
   docker exec -it elasticsearch /bin/bash  # to get attach with the running container

------
Stop elasticsearch
------

.. code-block:: console

   docker stop elasticsearch  # to stop the container

=====
Kibana
=====

Visulaization layer for Elasticsearch.

Installation: Docker Image/Container

Version: ``v8.10.2``

Imagename: ``kibana:8.10.2``

Container name: ``kibana``

Website link: https://www.elastic.co/guide/en/kibana/current/index.html

Github link: https://github.com/elastic/kibana

------
Create Image
------

``Docker Image is already created for kibana:8.10.2``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull 19914039/kibana:8.10.2


------
Create Container
------

``Docker Container is already created for kibana`` with the name **kibana**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker network create elk
   docker run -it --name kibana --net elk -p 5601:5601 --user esuser kibana:8.10.2
   # now we will copy the modified config file for the kibana
   docker cp ~/kibana/kibana.yml kibana:/home/esuser/kibana/config/kibana.yml
   # in this config file we have disabled the security features
   # now start the kibana
   cd kibana
   ./bin/kibana
   
------
Start kibana
------

.. code-block:: console

   # use this below command to start the existing kibana with default config
   docker start kibana  # to start the container
   # In case if you want to get attach to the container to do some modifications
   docker exec -it kibana /bin/bash  # to get attach with the running container

------
GUI
------

*address*: ``localhost:5601``

------
Stop kibana
------

.. code-block:: console

   docker stop kibana  # to stop the container


=====
Logstash
=====

data/log aggregation and processing layer for Elasticsearch.

Installation: Docker Image/Container

Version: ``v8.10.2``

Imagename: ``logstash:8.10.2``

Container name: ``logstash``

Website link: https://www.elastic.co/guide/en/logstash/current/index.html

Github link: https://github.com/elastic/logstash

------
Create Image
------

``Docker Image is already created for logstash:8.10.2``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull 19914039/logstash:8.10.2


------
Create Container
------

``Docker Container is already created for logstash`` with the name **logstash**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker run -it --name logstash --net elk -p 5044:5044 --user esuser logstash:8.10.2
   # now we will copy the modified config file for the logstash
   cd logstash
   ./bin/logstash -f logstash.conf

.. note::

  The config file for logstash should be in the home directory of logstash.

------
Start logstash
------

.. code-block:: console

   # use this below command to start the existing logstash with default config
   docker start logstash  # to start the container
   # In case if you want to get attach to the container to do some modifications
   docker exec -it logstash /bin/bash  # to get attach with the running container

------
Stop logstash
------

.. code-block:: console

   docker stop logstash  # to stop the container


=====
Filebeats
=====

data/log collection layer for Elasticsearch/Logstash.

Installation: ``direct source binaries``

Version: ``v8.10.2``


Website link: https://www.elastic.co/guide/en/beats/filebeat/current/index.html

Github link: https://github.com/elastic/beats


------
Installation
------

No need to install this actually, we can run it from the downloaded binaries it self.

use this link to down load the binaries

.. code-block:: console

   mkdir filebeats   
   cd filebeats
   wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.10.2-linux-arm64.tar.gz
   tar -xvzf filebeat-8.10.2-linux-arm64.tar.gz

------
Configuration
------

For the purpose of this demonstration, we have used ``filestream`` input module to read ``syslog`` and then forward to ``logstash``

.. code-block:: console

   cd filebeats
   # to have access permissions to the syslog, the filebeats has to be owned by the root user
   sudo chown root -R filebeat-8.10.2-linux-arm64
   cd filebeat-8.10.2-linux-arm64
   sudo nano filebeat.yml
   # do the config changes as required and then save it.
   # use this command to test the configuration
   sudo ./filebeat test config -e


------
Start filebeat
------

.. code-block:: console

   # to start filebeat
   sudo ./filebeat -e -c filebeat.yml

------
Stop
------

``ctrl+c``

======
InfluxDB
======
Installation: ``Docker Image/Container (From the official docker image by Influx)``

Version: ``2.4.0``

Imagename: ``influxdb:2.4.0``

Container name: ``influxdb``

Website link: https://docs.influxdata.com/influxdb/v2/

Github link: https://github.com/influxdata/influxdb

------
Create Image
------

``Docker Image is already created for influxdb:2.4.0``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull influxdb:2.4.0

------
Create Container
------

``Docker Container is already created for influxdb`` with the name **influxdb**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker run --name influxdb -d -p 8086:8086  influxdb:2.4.0

.. note::

  In this case, if you want to establish the communication b/w the ``grafana`` and ``influxdb``, we need to provide the ``IP Address`` of the device, and sometimes it may not be static. To deal with this, we have created a network at the docker level and attached the two containers to the same network, so that ``container name`` would be sufficient enough to communicate from ``grafana`` to ``influxdb``.

.. code-block:: console

   docker network create grafana
   docker run -d --name influxdb --net grafana -p 8086:8086  influxdb:2.4.0

------
Access GUI
------

From any web browser, use the below address to get started with ``influxdb``

*address*: ``localhost:8086``

Upon first login it will ask to create the user login and initial bucket name. For this instance we have already created the credentials as below

*username*: ``pi``

*password*: ``raspberry``

*orgname*: ``ge``

*bucket*: ``test``

------
Configure
------

.. note::

  When we create the intial bucket, it's retention policy would be autogen, which would create and ``issue`` while working with grafana. therefore we need to change the retention policy.

use the ``curl`` tool to change the access policy for a specific bucket

.. code-block:: console

   curl --request GET http://raspberrypi1.local:8086/api/v2/dbrps?org=ge   --header "Authorization: Token <``token``>"
   # this will return the bucket list along with all the details
   # Then use the curl post request to change the retention policy

   curl --request POST http://10.12.2.33:8086/api/v2/dbrps?org=ge --header "Authorization: Token <``token``>" \
   --header    'Content-type: application/json'  --data '{
      "bucketID": "<bucketID>",
      "database": "test",
      "default": true,
      "orgID": "<organizationID",
      "retention_policy": "example-rp"
    }'


------
Stop InfluxDB
------

.. code-block:: console

   docker stop influxdb

======
Telegraf
======

Data collection agent for influxdb

Installation: ``from repo``

Version: ``v1.28.1``

Website link: https://docs.influxdata.com/telegraf/v1/

Github link: https://github.com/influxdata/telegraf

------
Installation
------

``Telegraf is already installed on this device``

If you wnt to install it use the below commands

.. code-block:: console

   wget -q https://repos.influxdata.com/influxdb.key
   echo '23a1c8836f0afc5ed24e0486339d7cc8f6790b83886c4c96995b88a061c5bb5d influxdb.key' | sha256sum -c && cat    influxdb.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdb.gpg > /dev/null
   echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdb.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list
   sudo apt-get update
   sudo apt-get install telegraf
   telegraf --version

------
Configuration
------

Telegraf requires a configuration file to be passed while running. This config file specifies the parameters related to the ``input`` and ``output`` plugins to be used in the current run instance.

The default config file for telegraf will be available at ``~/etc/telegraf/telegraf.conf``. If we won't pass the config file, this default one will be considered. The user is free to define his own configurations as per the input and output plugins being used. Create a seperate config file and ``do not edit the one available at ~/etc/telegraf/telegraf.conf``


.. note::

  here for the purpose of demonstration, we are using the input module ``http`` and the oputput destination is ``influxdb``. The same example will be extended in the future for ``fledge`` to ``influxdb`` integration usecase.

The main parameters to be configured are:

``[[inputs.http_listener_v2]]``
  
## Address and port to host HTTP listener on
  
``service_address = ":8085"``

``[[outputs.influxdb_v2]]``
  
## The URLs of the InfluxDB cluster nodes.
  
`` urls = ["http://10.12.2.156:8086"]`` 


## API token for authentication.

``token = “<token>"``

## data format

``data_format = "json"``

.. code-block:: console

  mkdir telegraf
  nano telegraf.conf
  # enter the following configuration

   [[inputs.http_listener_v2]]
  ## Address and port to host HTTP listener on
  service_address = ":8085"

  ## Path to listen to.
  path = "/telegraf"

  ## HTTP methods to accept.
  methods = ["POST", "PUT"]

  ## maximum duration before timing out read of the request
  # read_timeout = "10s"
  ## maximum duration before timing out write of the response
  # write_timeout = "10s"

  ## Maximum allowed http request body size in bytes.
  ## 0 means to use the default of 524,288,000 bytes (500 mebibytes)
  # max_body_size = "500MB"

  ## Part of the request to consume.  Available options are "body" and
  ## "query".
  # data_source = "body"

  ## Set one or more allowed client CA certificate file names to
  ## enable mutually authenticated TLS connections
  # tls_allowed_cacerts = ["/etc/telegraf/clientca.pem"]

  ## Add service certificate and key
  # tls_cert = "/etc/telegraf/cert.pem"
  # tls_key = "/etc/telegraf/key.pem"

  ## Optional username and password to accept for HTTP basic authentication.
  ## You probably want to make sure you have TLS configured above for this.
  # basic_username = "foobar"
  # basic_password = "barfoo"

  ## Optional setting to map http headers into tags
  ## If the http header is not present on the request, no corresponding tag will be added
  ## If multiple instances of the http header are present, only the first value will be used
  # http_header_tags = {"HTTP_HEADER" = "TAG_NAME"}

  ## Data format to consume.
  ## Each data format has its own unique set of configuration options, read
  ## more about them here:
  ## https://github.com/influxdata/telegraf/blob/master/docs/DATA_FORMATS_INPUT.md
  data_format = "json"
 
 
 [[outputs.influxdb_v2]]
  ## The URLs of the InfluxDB cluster nodes.
  ##
  ## Multiple URLs can be specified for a single cluster, only ONE of the
  ## urls will be written to each interval.
  ##   ex: urls = ["https://us-west-2-1.aws.cloud2.influxdata.com"]
  urls = ["http://localhost:8086"]

  ## API token for authentication.
  token = "EsLLWa0AiMiKnmLBycRF2IBN4mzxdv2Hfi81lqqYi9cpvgQC8xeTbN0fPCi9dtuBq9UIq1v4NsCqAw6QQ2gZoQ=="

  ## Organization is the name of the organization you wish to write to; must exist.
  organization = "ge"

  ## Destination bucket to write into.
  bucket = "test"

  ## The value of this tag will be used to determine the bucket.  If this
  ## tag is not set the 'bucket' option is used as the default.
  # bucket_tag = ""

  ## If true, the bucket tag will not be added to the metric.
  # exclude_bucket_tag = false

  ## Timeout for HTTP messages.
  # timeout = "5s"

  ## Additional HTTP headers
  # http_headers = {"X-Special-Header" = "Special-Value"}

  ## HTTP Proxy override, if unset values the standard proxy environment
  ## variables are consulted to determine which proxy, if any, should be used.
  # http_proxy = "http://corporate.proxy:3128"

  ## HTTP User-Agent
  # user_agent = "telegraf"

  ## Content-Encoding for write request body, can be set to "gzip" to
  ## compress body or "identity" to apply no encoding.
  # content_encoding = "gzip"

  ## Enable or disable uint support for writing uints influxdb 2.0.
  # influx_uint_support = false

  ## Optional TLS Config for use on HTTP connections.
  # tls_ca = "/etc/telegraf/ca.pem"
  # tls_cert = "/etc/telegraf/cert.pem"
  # tls_key = "/etc/telegraf/key.pem"
  ## Use TLS but skip chain & host verification
  # insecure_skip_verify = false

.. note::

  This example configuration can be created simply from the Influxdb GUI.

------
Start
------

we need to provide the config file to run telegraf ``telegraf –config /path/to/config/file``

.. code-block:: console

   telegraf -config ~/telegraf/telegraf.conf

-------
Exit
-------

``ctrl+c``

======
Grafana
======
Installation: ``Docker Image/Container (From the official docker image by Grafana)``

Version: `` v10.1.2 ``

Imagename: `` grafana/grafana-oss:latest``

Container name: ``Grafana``

Website link: https://grafana.com/docs/grafana/latest/

Github link: https://github.com/grafana/grafana

------
Create Image
------

``Docker Image is already created for grafana/grafana-oss:latest ``

.. note::

  In case if the image got deleted then you can pull the image from docker hub using the below command

.. code-block:: console

   docker pull grafana/grafana-oss:latest

------
Create Container
------

``Docker Container is already created for grafana`` with the name **grafana**

.. note::

  In case if the container got deleted then you can create the container instance from the docker image using the below command

.. code-block:: console

   docker run -d --name=grafana -p 3000:3000 grafana/grafana-oss

In case if you want to share the SQLite DB in an another container instance then we have to create a docker volume and attach the two containers with the docker shared volume.
.. code-block:: console

   docker volume create dataVolume
   docker run -d --name=grafana -p 3000:3000 -v dataVolume:/dataVolume grafana/grafana-oss

.. note::

  In this case, if you want to establish the communication b/w the ``grafana`` and ``influxdb``, we need to provide the ``IP Address`` of the device, and sometimes it may not be static. To deal with this, we have created a network at the docker level and attached the two containers to the same network, so that ``container name`` would be sufficient enough to communicate from ``grafana`` to ``influxdb``.

.. code-block:: console

   docker network create grafana
   docker run -d --name=grafana --net grafana -p 3000:3000 -v dataVolume:/dataVolume grafana/grafana-oss

------
Access GUI
------

From any web browser, use the below address to get started with ``grafana``

*address*: ``localhost:3000``

It will ask to enter the user credentials. The default credentials are as below:

*username*: ``admin``

*password*: ``admin``


------
Stop Grafana
------

.. code-block:: console

   docker stop grafana

======
MU Simulator
======

The purpose of this module is to act as a data source for ``61850-9-2 Sample Value``

Installation: ``from source code``

Version: ``v5.32``

------
Build Executable
------

.. note::

  The available executable is built for ``amdx86_64`` architecture and will not work for this device. If we want to use this simulator on Raspberry Pi, we have to recompile the source binaries.

workdir: ``MU_Simulator``
   
It has two folders: ``Debug`` and ``src``
The make for to create the binaries is available in ``Debug`` dir.

.. code-block:: console

    cd Debug
    run make clean
    run make all
    # Compilation will be successful, but Error will be thrown while linking
    # collect2: error: ld returned 1 exit status
    # make: *** [makefile:32: t] Error 1
    # this is due to multiple definitions; first defined here
    # now use -Wl,--allow-multiple-definition flag with gcc
    gcc -Wall -Wl,--allow-multiple-definition -o"t" ./src/callbacks.o ./src/eth.o ./src/frame.o ./src/interface.o ./src/main.o ./src/support.o -lpcap -lpthread -lrt pkg-config --cflags --libs gtk+-2.0 -lm
    # Executable t will be created.

------
Run
------

Change to the working directory and then execute the ``t`` with ``sudo``
 
.. code-block:: console

    cd MU_Simulator/Debug
    sudo ./t 

------
Exit
------

``ctrl+c``

======
MQTT
======

The purpose of this module is to act as a data source for MQTT. ``Mosquitto`` is one of the popular simple mqtt broker.

Installation: ``from apt-repo``

Version: ``v2.0.11``

------
Install
------

.. note::

  The available executable is built for ``amdx86_64`` architecture and will not work for this device. If we want to use this simulator on Raspberry Pi, we have to recompile the source binaries.

.. code-block:: console

   sudo apt-get install mosquitto mosquitto-clients
   # After installing, you can check the status of Broker by using 
   sudo service mosquitto status # to see the status
   # If the service is not showing Active, then use 
    sudo service mosquitto start # to start the broker

.. note::

  The default host address for the mosquitto broker is ``localhost`` and the port is ``1883`` for all http communications. It is also possible to enable https in mosquitto to enable secure communication.

To check the default enabled port use

.. code-block:: console

   sudo lsof -i -P -n | grep LISTEN

Ref: http://www.steves-internet-guide.com/mosquitto-tls/
 
------
Run
------

Open bash and use below command to publish messages to broker

.. code-block:: console

   mosquitto_pub -t "Room1/conditions" -m '{"humidity": 93.29, "temperature": 16.82}'

Open another bash and use below command to subscribe to messages 

.. code-block:: console

   mosquitto_sub -t "Room1/conditions"


------
Configure
------

.. note::

  By default, the mosquitto service will only be listening at the ``localhost`` and you may not be ab;e to either publish (or) subscribe the messages from a remote host (or) from a container instanace. For ``mosquitto`` to listen on all address and even from external clients, the following modifications have to be done

.. code-block:: console

   cd /etc/mosquitto/config.d
   # the user configurations must be created in this directory
   sudo nano mosquitto.conf
   # enter the below two lines

   listener 1883 0.0.0.0
   allow_anonymous true

   # then ctrl+o to save and ctrl+x to exit.

To get the changes effect restart the mosquitto service

.. code-block:: console

   sudo service mosquitto restart

------
Stop
------

.. code-block:: console

   sudo service mosquitto stop


======
EVerest
======

The purpose of this module is to act as ``EV Simulator`` for EV related research work
Installation: ``from source code``

Version: ``v2023.8.0 ``

Website link: https://everest.github.io/nightly/general/03_quick_start_guide.html

Github link: https://github.com/EVerest/everest-core

------
Install
------

.. note::

  The installation is done and the ``EVerest`` module is ready to use.

The installation is done as per the documentation guide available at: https://github.com/EVerest/everest-core

------
Start Simulation
------

After doing the installation, we can now simulate the EVrest. The simulation process is explained at https://everest.github.io/nightly/general/03_quick_start_guide.html section 3.3

The following commands were used to create the simulation

.. code-block:: console

   docker network create --driver bridge --ipv6  --subnet fd00::/80 infranet_network --attachable

   cd ~/checkout/everest-workspace/everest-utils/docker
   sudo docker-compose up -d mqtt-server

.. note::

  In case if you get any error while creating this container, It might be due to the fact that the local ``mosquitto`` installation is already using the port ``1883`` and this container may also require the same. 

The solution is temporarily stopping the local mosquitto service using

 .. code-block:: console

   sudo service mosquitto stop

Now you can re-run the previous commands for Everest

.. code-block:: console

   # to start EVerest with a software-in-the-loop configuration via script:
   ~/checkout/everest-workspace/everest-core/build/run-scripts/run-sil.sh
   # you need to open another bash
   # to run the Node-RED script
   ~/checkout/Everest-workspace/everest-core/build/run-scripts/nodered-sil.sh


------
GUI
------

Open any browser and use the below address

*Node-red flow*: ``http://localhost:1880``

*EVerest-GUI*: ``http://localhost:1880/ui``

*Admin panel*: ``http://localhost:8889``


------
Subscribe to EVerest Data
------

Since the data exachange among the ``EVerest`` modules is over mqtt, It is also possible for external mqtt clients to get subscribe to the simulation Parameters like Voltage, Power, Temperature etc.. of the simulated EV

To do so use the below command

.. code-block:: console

   mosquitto_sub 

=======
IEC-61850
=======

The purpose of this module is to act as a simple data source/ data generator for iec-61850 communications including

1. MMS Server

2. GOOSE Publisher

Version: ``v1.5 ``

Website link: https://libiec61850.com/

Github link: https://github.com/mz-automation/libiec61850

------
Build Executable
------

workdir: ``libiec61850``
   
The avaible library needs to be compiled to build the execuitables

.. code-block:: console

   git clone https://github.com/mz-automation/libiec61850.git
   cd libiec61850
   mkdir build
   cd build
   cmake ..
   make -j 4
   sudo make install
   sudo ldconfig
   # Executables will be created for all including examples.

------
Run
------

To run any example, change to the corresponding directory available at ``~/libiec61850/build/examples/``

For example to run a simple MMS Server, you can run the example ``server_example_basic_io`` available at *server_example_basic_io* directory
 
.. code-block:: console

   cd libiec61850/build/examples/server_example_basic_io
   sudo ./server_example_basic_io

------
Exit
------

``ctrl+c``

More details are given in the :doc:`integration`















