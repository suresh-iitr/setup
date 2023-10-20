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
