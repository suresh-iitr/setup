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
*VNC server address*: ``kali-raspberry-pi.local:5901``

*username*: ``kali``

*password*: ``kali2023``

.. note::

  With this VNC server, the access to the browser limited. and more over copy paste opration is also limited.

.. note::

  With the current VNC Server installation, the kali linux is experiencing ``login loop back`` error. We tried the option of enabling ``auto login`` still doesn't work. Therefore, you won't be able to login to the direct kali desktop.


The solution for this is:

- do the ssh to the kali likux device

.. code-block:: console

   ssh kali@kali-raspberry-pi.local

- then disable the vnc service temporarly

.. code-block:: console

   sudo service vncserver stop

- Now you will be able to access the direct desktop.

.. note::

  You need to repeat this process upon evey reboot if you want to access the direct desktop login to Kali.


``one more issue is, you can not shutdown the device through VNC``. To do so, you have to use SSH only. After doing SSH to the device use

.. code-block:: console

   sudo shutdown now


======
Modules Installed
======

This installation consists of all the modules that are compatible with an ``arm`` architecture as listed in https://www.kali.org/tools/all-tools/. These modules are installed using 

.. code-block:: console

   sudo apt-get install kali-linux-everything



