Vagrant-CentOS-PHP
===================

This project provides a [Vagrant](http://www.vagrantup.com/ "Vagrant") box for use as a 
LAMP stack, a Linux based server to host Apache, MySQL, and PHP.  

The goal is to make it quick and simple to create and manage one or more development environments for 
[Habari](http://habariproject.org "Habari").  In this example Vagrant is operating on top of 
[VirtualBox](https://www.virtualbox.org/ "VirtualBox").  VirtualBox makes it possible to create 
a virtual server that can be built, copied, backed-up, transported to other hosts, stopped and resumed. 
Such a virtual server can take snapshots before important changes to permit roll-back, or to 
repeat specific tests.

Vagrant is used to create a virtual machine to serve as a base to be hosted by VirtualBox.  Think of it 
as a nice way to throw up a new virtual machine with the latest version of Habari.  After the VM exists 
it can be cloned inside VirtualBox to a VM that is no longer tied to Vagrant, or can be used directly 
through Vagrant.

All this means is that if you have one or more Habari based sites, you can quickly test your sites in 
a repeatable and portable fashion.  Want to know how your site will work with a new version of Habari, 
well make a new VM with that version and find out.  :-)

If you find this useful please consider contributing enhancements back to this project.

Quick Start
-----------

0. Install Vagrant, as per instructions [here](http://docs.vagrantup.com/v2/getting-started)

0. Read about VirtualBox [here](https://www.virtualbox.org/wiki/Documentation)

0. Fork this repository then create a local clone of that fork.

0. Use Vagrant to install the ``centos6.4_64.2`` base box.
   
            $ vagrant box add centos6.4_64.2 \
            http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box

0. Move into the directory of your locally forked version of ``Vagrant-CentOS-PHP`` and fire up the 
   box.
 
            $ cd vagrant-centos-php 
            $ vagrant up

0. Enjoy

Habari
------

In this example [Habari](http://habariproject.org "Habari") will be installed.
Habari is a PHP based publishing platform.  Puppet is used to manage the install.
It is using a custom Habari Puppet module that can be found 
[here](https://github.com/mmynsted/mmynsted-habari "github.com/mmynsted/mmynsted-habari").

Base
----

The Vagrant base box is currently set to a CentOS flavor that would need to be locally named ``centos6.4_64``. 
It can be found [here](http://developer.nrel.gov/downloads/vagrant-boxes/centos-6.4-x86_64-v20130309.box), though
other CentOS base boxes should work fine.  Check [vagrantbox.es](http://www.vagrantbox.es "vagrantbox.es") 
for other bases box candidates or make your own.

Some changes may need to be made such as the network address, etc.  Be sure to be consistent with the 
``docroot`` folder, currently set to ``/var/www/html``, in both the ``Vagrantfile`` and the manifest.

Known Issues
------------

* The VM will complain that ``No guest additions were detected on the base box for this VM! . . .``.  If this 
  proves to be a problem, then install guest additions or try a different base box.  This could be because 
  the box does not contain X and guest additions would normally alter X.  The cause is unclear at this time.

* The time shown in the VM is likely incorrect.  

Cloning in VirtualBox
---------------------

It can be useful to clone the Vagrant box to a new VM to separate it from Vagrant control.
  
An example would be building a Habari box, then cloning that box so the clone can be used 
to test a particular site.  Vagrant would no longer needed and the VM could be managed and customized
in any way desired from VirtualBox.  The Vagrant project would then be free to make new VMs, 
perhaps with different versions of Habari, without damaging the newly created clone.

When cloning the CentOS box in VirtualBox, you should do the following to avoid potential networking 
problems.

0. Take a *snapshot* of the original VM from VirtualBox
0. Start the original VM from VirtualBox and login using the credentials identified in the ``Vagrantfile``
0. Remove existing persistent network rules
            
            sudo rm /etc/udev/rules.d/70-persistent-net.rules
0. Halt box and exit

            sudo halt
0. Use VirtualBox to make a clone of the original to a new VM with a distinct name 
	- Select *reinitialize the mac addresses...*
	- Select *full clone*
	- Select *current machine state*
0. Manually update the ``HWADDR`` in ``/etc/sysconfig/network-scripts/ifcfg-eth0`` to match the newly created mac address.  
The mac address is shown in the network tab for the network device.
Be sure to enter the mac address using the format with ``:`` between each two characters as is shown with the existing mac address. 



Copyright and License
---------------------

Copyright (c) 2013 Growing Liberty LLC

Growing Liberty can be contacted via the [contact](https://growingliberty.com/contact "contact us") page.

         Licensed under the Apache License, Version 2.0 (the "License");
         you may not use this except in compliance with the License.
         You may obtain a copy of the License at
         
           http://www.apache.org/licenses/LICENSE-2.0
         
         Unless required by applicable law or agreed to in writing, software
         distributed under the License is distributed on an "AS IS" BASIS,
         WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
         See the License for the specific language governing permissions and
         limitations under the License.


[GrowingLiberty.com](http://growingliberty.com "growingliberty.com")

