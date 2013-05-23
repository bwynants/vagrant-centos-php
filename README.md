Vangrant-CentOS-PHP
===================

This project is a simple base vagrant box for use as a LAMP stack, a Linux based server to 
host Apache, MySQL, and PHP.  

Habari
------

In this example [Habari](http://habariproject.org "Habari") will be installed.
Habari is a PHP based publishing platform.  Puppet is used to manage the install.
It is using a custom Habari Puppet module that can be found 
[here](https://github.com/mmynsted/mmynsted-habari "github.com/mmynsted/mmynsted-habari").

Base
----

The Vagrant base box is currently set to a CentOS box that would need to be locally named ``centos6.4_64``. 
It can be found [here](http://developer.nrel.gov/downloads/vagrant-boxes/centos-6.4-x86_64-v20130309.box), though
other CentOS base boxes should work fine.  Check [vagrantbox.es](http://www.vagrantbox.es "vagrantbox.es") 
for other bases box candidates or make your own.

Some changes may need to be made such as the network address, etc.  Be sure to be consistent with the 
``docroot`` folder, currently set to ``/var/www/html``, in both the ``Vagrantfile`` and the manifest.

Known Issues
------------

* The VM will complain that ``No guest additions were detected on the base box for this VM! . . .``.  If this 
  proves to be a problem, then install guest additions or try a different base box.

* The time shown in the VM is likely incorrect.  


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

