********
Integrations
********

This document provide the guidance on integrations tested b/w the devices (or) modules for the purpose of demostration.

======
IEC-61850-MMS-Integration Test
======

Thia setup requires two devises running the modules as specified beolow:

- **61850-MMS-Server** is running on ``raspberrypi1.local``

- **61850-MMS-Client** is running on ``raspberrypi2.local``

- **InfluxDB** instance running on ``raspberrypi2.local``

- **Grafana** instance running on ``raspberrypi2.local``

-------
61850-MMS-Server Setup
-------

For the purpose of demostration, we have considered some basic examples available from ``libiec61850`` library by **mzautomation** https://github.com/mz-automation/libiec61850/tree/v1.5/examples 

------
Build Examples
------

workdir: ``libiec61850``
   
The avaible examples needs to be compiled to build the execuitables. assuming you have already downloaded ``libiec61850`` and done the installation as explained in :doc: `raspberrypi1`.

.. code-block:: console

   cd libiec61850
   make examples 
   
   # Executables will be created for all examples in their respective folder.

------
Run
------

To run any example, change to the corresponding directory available at ``~/libiec61850/examples/``

For example to run a simple MMS Server, you can run the example ``simple_server_basic_io`` available at *server_example_basic_io* directory
 
.. code-block:: console

   cd libiec61850/examples/server_example_basic_io
   sudo ./server_example_basic_io

.. note::

  The default configration files for the servers are already available in their respective examples directory. As an example, the 61850-MMS basic server instnce is available in the dir ``~/libiec61850/examples/server_example_basic_io/ with the following configuration files:

``simpleIO_direct_control.icd``  .icd: IED Capability Description

``simpleIO_direct_control.cid``  .cid: Configured IED Description, usually built from .icd file. 

If you change any of the default configurations, you need to rebuild inorder to get the changes effect.

To rebuild the examples, change to the main directory ``libiec61850``

.. code-block:: console

   cd libiec61850
   make examples 
   

------
Exit
------

``ctrl+c``

-------
61850-MMS-Client Setup
-------

For the purpose of demostration, we have considered some basic examples available from ``libiec61850`` library by *mzautomation* https://github.com/mz-automation/libiec61850/tree/v1.5/examples 

------
Build Examples
------

workdir: ``libiec61850``
   
The avaible examples needs to be compiled to build the execuitables. assuming you have already downloaded ``libiec61850`` and done the installation as explained in :doc: `raspberrypi1`.

.. code-block:: console

   cd libiec61850
   make examples 
   
   # Executables will be created for all examples in their respective folder.

------
Run
------

.. note::

  Before running any client example make sure that the server is already started/ running on the remote device.

To run any example, change to the corresponding directory available at ``~/libiec61850/examples/``

For example to run a simple MMS Client, you can run the example ``iec61850_client_example1`` available at *iec61850_client_example1* directory
 
.. code-block:: console

   cd libiec61850/examples/iec61850_client_example1
   sudo ./iec61850_client_example1

.. note::

  There are no any configuration files available for the Client examples. If you wants to change any parameters of the client we have to modify directly in the source file (.c file).

For example, in this case (iec61850_client_example1), the server address is by defaulu ``localhost`` and with this we won't be able to communicate with the MMS-Server instance running on ``raspberrypi1.local`` (means external device).

The soultion is 

1. either you can chage the ``hostname`` variable  in the source code and then recompile and build the example inorder to get the changes effect.

To rebuild the examples, change to the main directory ``libiec61850``

.. code-block:: console

   cd libiec61850
   make examples 
 
2. Pass the remote server address as an input argument to the execuitable while running 

.. code-block:: console

   sudo ./iec61850_client_example1 raspberrypi1.local


------
Exit
------

``ctrl+c``


======
IEC-61850-GOOSE-Integration Test
======

Thia setup requires two devises running the modules as specified beolow:

- **61850-GOOSE-Publisher** is running on ``raspberrypi1.local``

- **61850-GOOSE-Subscriber** is running on ``raspberrypi2.local``

- **InfluxDB** instance running on ``raspberrypi2.local``

- **Grafana** instance running on ``raspberrypi2.local``

-------
61850-GOOSE-Publisher Setup
-------

For the purpose of demostration, we have considered some basic examples available from ``libiec61850`` library by *mzautomation* https://github.com/mz-automation/libiec61850/tree/v1.5/examples 

------
Build Examples
------

workdir: ``libiec61850``
   
The avaible examples needs to be compiled to build the execuitables. assuming you have already downloaded ``libiec61850`` and done the installation as explained in :doc: `raspberrypi1`.

.. code-block:: console

   cd libiec61850
   make examples 
   
   # Executables will be created for all examples in their respective folder.

------
Run
------

To run any example, change to the corresponding directory available at ``~/libiec61850/examples/``

For example to run a simple GOOSE-Publisher, you can run the example ``./goose_publisher_example`` available at *goose_publisher* directory
 
.. code-block:: console

   cd libiec61850/examples/goose_publisher
   sudo ./goose_publisher_example


If you change any of the default configurations, you need to rebuild inorder to get the changes effect.

To rebuild the examples, change to the main directory ``libiec61850``

.. code-block:: console

   cd libiec61850
   make examples 
   

------
Exit
------

By default, the Publisher will automaticlly exits, after publishing ``three events``.


-------
61850-GOOSE-Subscriber Setup
-------

For the purpose of demostration, we have considered some basic examples available from ``libiec61850`` library by *mzautomation* https://github.com/mz-automation/libiec61850/tree/v1.5/examples 

------
Build Examples
------

workdir: ``libiec61850``
   
The avaible examples needs to be compiled to build the execuitables. assuming you have already downloaded ``libiec61850`` and done the installation as explained in :doc: `raspberrypi1`.

.. code-block:: console

   cd libiec61850
   make examples 
   
   # Executables will be created for all examples in their respective folder.

------
Run
------

For example to run a simple GOOSE-Subscriber, you can run the example ``./goose_subscriber_example`` available at *goose_subscriber* directory
 
.. code-block:: console

   cd libiec61850/examples/goose_subscriber
   sudo ./goose_subscriber_example


If you change any of the default configurations, you need to rebuild inorder to get the changes effect.

To rebuild the examples, change to the main directory ``libiec61850``

.. code-block:: console

   cd libiec61850
   make examples 


------
Exit
------

By default subscriber will be running continuously. To stop use 

``ctrl+c``


======
IEC-61850-SV-Integration Test
======

This is about the ``MU_Simulator`` Integration with ``InfluxDB`` and ``Grafana``

This setup requires two devises running the modules as specified beolow:

- **MU_Simulator** is running on ``raspberrypi1.local``

- **SV_Subscriber** and **InfluxDB** post logic is running on ``raspberrypi2.local``

- **InfluxDB** instance running on ``raspberrypi2.local``

- **Grafana** instance running on ``raspberrypi2.local``

-------
MU_Simulator Setup
-------

The installation of the MU_Simulator is explained in https://github.com/19914039/setup/blob/main/docs/source/raspberrypi1.rst#mu-simulator


------
RUN
------

After finishing the installation/ build process of MU_Simulator, we have to run it as a ``sudo`` user

workdir: ``~/MU_Simulator/Debug``
   
Change to the working directory and then execute the ``t`` with ``sudo``


.. code-block:: console

   cd MU_Simulator/Debug
   sudo ./t 
   

The GUI will open, where you have the options to configure the MU_Simulator.

.. note::

  The first ``important`` thing to configure in the MU_Simulator is the name of the node. by default it will be ``MiCOM Logical Node 1`` which will create syntax errors while posting it to the ``InfluxDB``. Since in InfluxDB line protocol every ``space`` will represent a different layer. Therefore, first change it to ``MiCOM_Logical_Node_1`` (No Spaces).

The rest of the things can be default and you can click on ``Update`` button and then ``Run`` button.
 

------
Exit
------

To get exit, you can click on ``Stop`` button and then close the GUI.


-------
61850-SV-Subscriber Setup
-------

For the purpose of demostration, we have considered a simple example C++ code based on 

1. ``libpcap`` for capturing and parsing the SV data generated by the MU_Simulator running on ``raspberrypi1.local``

2. ``sockets`` for posting the parsed SV data to ``InfluxDB`` running on the local host (``raspberrypi2.local), although it is possible to send to a remote influxDB instance.


------
Params
------

PORT  ``8086``  InfluxDB instance port, default is 8086

IP_ADDRESS ``127.0.0.1``  InfluxDB IP address, by default ``localhost``

BUCKET ``test``  Bucket name to which we want to post the data 

ORG ``ge``  organization name

TOKEN ``EsLLWa0AiMiKnmLBycRF2IBN4mzxdv2Hfi81lqqYi9cpvgQC8xeTbN0fPCi9dtuBq9UIq1v4NsCqAw6QQ2gZoQ==`` authentication token for influxDB 

MEASURE ``61850_SV`` measurement name that we wants to give

.. note::

  The first ``important`` thing to configure in this code is, we should start the device capturing in ``promiscuous`` mode of sniff. otherwise, it can't see the SV traffic.

line 83: int promisc = 1;  (1 means, promiscuous is enabled)


------
Build
------

.. code-block:: console

   cd MU_subscriber
   g++ -Wall influxPost.cpp -o influxPost -lpcap


------
RUN
------

.. note::

  One thing that we need to keep in mind is, pcap normally scans the aviailable devices and will start sniffing on the ``first device``. when we have docker networks, some times they may get scanned first and by default, ``pcap`` will start sniffing on that interface. But actually, the SV traffic is only avaiable on ``ethernet`` interface, we can pass this as an aurgument ``eth0`` while execuiting the program.


.. code-block:: console

   cd MU_subscriber
   sudo ./influxPost eth0

------
Data Verification
------

From any web browser, use the below address to get started with influxdb

address: localhost:8086

Pass the login credentials

*username*: ``pi``

*password*: ``raspberry``

then go to buckets, and look for the data.


------
Data Visualization
------

We can use the InfluxDB to Grafana integration to visualize the SV data.

.. note::

  The minimum time resolution achived by the Grafana is ``10 msec`` while it in ``ns`` for InfluxDB. The MU_Simulator is publishing the data at a rate of every ``250 us``, it is not possible to visualize such a high resolution data in Grafana. Therfore the waveform may not look like a pure sinusoidal waveform.

Assuming that the influxdb bucket is already configured with ``example-rp`` retention policy as explained in https://github.com/19914039/setup/blob/main/docs/source/raspberrypi1.rst#configure  and bothe the containers are attached on to the same docker network, we can now proceed to configure the influcDB data source plugin available in Grafana.

started the docker container for ``grafana`` and InfluxDB using

.. code-block:: console

   docker start grafana
   docker start influxdb


open the web browser, enter ``localhost:3000``, It will open the grafana GUI. 

1. Go to configuration, 

2. then Datasource, 

3. add Datasource, 

4. select Influxdb

- **Configuration**

The most important part in integration is configuring this plugin correctly. This plugin supports query in two different languages as mentioned above ``Flux``, ``InfluxQL``.

.. note::

  As I am already familiar with SQL query language, I will be using InfluxQL

1. select **Query Language** as ``InfluxQL``
2. under **HTTP** provide the URL as ``http://<IP>:8086/`` or ``http://localhost:8086/`` or ``http://influxdb:8086/`` (incase if the two containers are attached on the same docker network)

In our case the two containers are attached to the same network, so we can use ``http://influxdb:8086/``

3. under **Custom HTTP Headers** section, click on *Add header* and in the **Header** key enter ``Authorization`` and for **Value** enter ``Token <API Token of InfluxDB>``. For example 

.. code-block:: console

   Token 4Izj_De_3QYI3JKSBud_eNjanIiBGFODWOuDD1RPtmUdAG2DOagrnQrfKf96YXcacvJ9o5K4y3Z2uEXibIIA8w==

.. note:: 

  While entering Token details, It will be HIDE mode.
  
4. under **InfluxDB Details** details enter *Database* enter the bucket name for example here ``iot-bucket`` and for *HTTP Method* select ``GET``
5. Click on Save & Test; It should show ``Success``


------
Exit
------

To stop the influxPost execuitable, use 

``ctrl+c``


======
Fledge-Grafana Integration Test
======

This is about the ``fledge-IoT`` (or) ``fledgePOWER`` Integration with ``Grafana``

This setup requires the following modules running:

- **Modbus** simulator running on ``Windows PC`` connected in the same LAN

- **Fledge** running on ``raspberrypi2.local`` with corresponding ``south-modbus`` configured

- **Grafana** instance running on ``raspberrypi2.local``

-------
Modbus Simulator Setup
-------

For the purpose of demonstration, you can run any modbus slave simulator listening at port:``502`` (or) any other also.

Use this tool https://www.hmisys.com/ located in the drive at https://drive.google.com/file/d/1eJ0Yd5PmS8wAnbicFcWsNKlOdLs5CzA4/view?usp=sharing

simply install it as like a normal windows application.

------
RUN
------

Execuite it from the Desktop/ Windows menu

Select the slave address as 1

and go to the holding registers tab.

and enter some sample values for the registers.
   

.. note::

  It is not compulsary that we have to select Modbus only, any protocol that your fledge has south-plugin available, you can choose that device as a data source.

------
Start Fledge
------

. code-block:: console

   docker start fledge

------
Configure Fledge
------

The fledge south modbus plugin need to be configured to collect the data from simulator. visit https://fledge-iot.readthedocs.io/en/latest/plugins/fledge-south-ModbusC/index.html for more information on how to configure ``fledge-south-modbus`` service.

.. note::

  In this case the interface with grafana will be done using the ``REST API`` interface. so need need to have ant north-servie.


------
Start Grafana
------

. code-block:: console

   docker start grafana

------
Configure Grafana
------

Since the fledge REST API returns the JSON data, to parse it we need to install the support plugin ``Infinity`` for grafana. Visit https://grafana.com/grafana/plugins/yesoreyeram-infinity-datasource/ for more information on installing and configuring Infinity plugin.

visit https://fledge-iot.readthedocs.io/en/latest/rest_api_guide/06_GrafanaExamples.html?highlight=grafana to look at the example to configure the ``infinity`` plugin for grafana to get interface with ``fledge``.

we need to simple provide the fledge ``rest-api`` address to get connect with fledge. 

``http://fledge:8081/fledge/ping``  to just ping the fledge to get fledge statistics

``http://fledge:8081/fledge/asset/<assetName>`` to get asset values and visualize in grafana

``http://fledge:8081/fledge/asset/modbus/temperature?limit=100`` to fetch latest 100 data points

.. note::

  It both fledge and grafana are not attached to the same network, then you need to provide the IP address in the URL instead of ``fledge``

example: ``http://10.12.1.93:8081/fledge/ping``

After fetching the data, into grafana, we need to do some reformatting to reflect the data as a valid time-series data. Use the ``Add Columns`` option in the infinity plugin to apply the required transformations.

1. Interpret **data point** as ``Number``
2. Interpret **timestamp** as ``Time``


======
Fledge-InfluxDB Integration Test
======

This is about the ``fledge-IoT`` (or) ``fledgePOWER`` Integration with ``InfluxDB``.

Since the InfluxDB rest api ``POST`` request only accepts the data in ``Flux`` format, and the base format of the fledge is ``JSON`` list, therefore we need to do some data transformation.

This can be done in two ways:

1. via ``Telegraf``
2. ``extended configuration of fledge-north-http-c`` plugin, using ``script`` option. visit https://fledge-iot.readthedocs.io/en/latest/plugins/fledge-north-httpc/index.html for more information.

For the purpose of demonstration, we are using ``Telegraf``

This setup requires the following modules running:

- **Modbus** simulator running on ``Windows PC`` connected in the same LAN

- **Fledge** running on ``raspberrypi2.local`` with corresponding ``south-modbus`` configured

- **Telegraf** instance running on ``raspberrypi2.local``

- **InfluxDB** instance running on ``raspberrypi2.local``

-------
Modbus Simulator Setup
-------

For the purpose of demonstration, you can run any modbus slave simulator listening at port:``502`` (or) any other also.

Use this tool https://www.hmisys.com/ located in the drive at https://drive.google.com/file/d/1eJ0Yd5PmS8wAnbicFcWsNKlOdLs5CzA4/view?usp=sharing

simply install it as like a normal windows application.

------
RUN
------

Execuite it from the Desktop/ Windows menu

Select the slave address as 1

and go to the holding registers tab.

and enter some sample values for the registers.
   

.. note::

  It is not compulsary that we have to select Modbus only, any protocol that your fledge has south-plugin available, you can choose that device as a data source.

------
Start Fledge
------

.. code-block:: console

   docker start fledge

------
Configure Fledge
------

.. note::

  In this case the interface is through the ``fledge-north-http`` service. therefore we need to configure the north-service too. 

The fledge south modbus plugin need to be configured to collect the data from simulator. visit https://fledge-iot.readthedocs.io/en/latest/plugins/fledge-south-ModbusC/index.html for more information on how to configure ``fledge-south-modbus`` service.

visit https://fledge-iot.readthedocs.io/en/latest/plugins/fledge-north-httpc/index.html for more information on how to configure the North plugin.

- in the **URL** filed simple enter ``http://10.12.1.93:8085/telegraf``

- **Source** as ``readings``

.. note::

  Please update the IP address as per your network setup. The IP address correspnds to the telegraf host. It is not necessary that all modules fledge, telegraf, and InfluxDB to be present on the same device. They can be on differnt device of the same LAN. 

------
Configure Telegraf
------


configure the telegraf as detailed in https://github.com/19914039/setup/blob/main/docs/source/raspberrypi1.rst#configuration-1


------
Start Telegraf
------

.. code-block:: console

   telegraf –config ~/telegraf.conf

------
Configure InfluxDB
------

No need to do any configurations.

Your data will be visible in the respective bucket.















