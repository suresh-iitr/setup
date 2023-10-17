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
   #open the bash in host, and use 
   xauth list
   #copy the credentials displayed here and then add to the container xauth
   xauth add 

Refer to this link: https://github.com/19914039/ResearchWork/issues/57








