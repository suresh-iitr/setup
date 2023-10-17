********
Document Guide for raspberrypi1.local
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
*VNC server address*: ``raspberrypi.local:5901

*password*: ``ubuntu``

.. note::

  With this VNC server, the access to the browser limited. and more over copy pase opration is also limited


======
Modules Installed In the device
======


======
Dynawo
======
Installation: Docker Image/Container (Due to the dependency on Utuntu-mate 20.04)

Version: ``1.3.0``

Imagename: ``dynawo:1.3.0``
Container name: ``dynawo``

Website link: https://dynawo.github.io/

Github link: https://github.com/dynawo

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







