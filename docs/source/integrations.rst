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

