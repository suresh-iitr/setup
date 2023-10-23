********
kali-raspberry-pi.local
********

The main intention of this device is 

1. To use as an Pentesting Tool to test the security level

2. As an Attacker to create various attack scenarios on the test setup


======
OS Details
======
Kali Linux OS, 2023.3, 32-bit, Armhf

======
Hostname
======
kali-raspberry-pi.local

======
Credentials
======
*username*: ``kali``

*password*: ``kali``

======
SSH Credentials
======
*username*: ``kali``

*password*: ``kali``

To do ssh to the device over local LAN:

.. code-block:: console

   ssh kali@kali-raspberry-pi.local
   # it will ask to add the device signature to the list.
   # type yes
   # enter the password: kali

To do ``shutdown`` (or) ``reboot`` over ssh

.. code-block:: console

   sudo shutdown now
   sudo reboot

======
VNC Credentials
======

*VNC server address*: ``kali-raspberry-pi.local``

*username*: ``kali``

*password*: ``kali``

*Screen Resolution*: ``1024x768``

.. note::

  Actually Kali-Linux doesn't have any readily available solution for remote desktop as like Debian OS. We have tried many options like tightvncserver, x11vnc, etc. but every option had some limitations. Finally the procedure explined in https://github.com/azalinux/realvnc-server-aarch64-ubuntu has worked. The detailed procedure is noted at https://github.com/19914039/ResearchWork/issues/37#issuecomment-1775040883



======
Modules Installed
======

This installation consists of all the modules that are compatible with an ``arm`` architecture as listed in https://www.kali.org/tools/all-tools/. These modules are installed using 

.. code-block:: console

   sudo apt-get install kali-linux-everything



