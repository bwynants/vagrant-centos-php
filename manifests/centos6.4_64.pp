# vi: set ft=ruby :
#
# Note: puppet modules are installed into the modules directory
# The name convention is author-name, so 
# https://github.com/smarchive/puppet-archive would need to be 
# named 'archive' in the modules directory.  A git submodule install 
# might look like the following:
# git submodule add https://github.com/smarchive/puppet-archive modules/archive
# 
#
#
group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Vagrant-built Habri virtual machine!
              Managed by Puppet.\n"
}

#Just because
package { 'git':
    ensure => installed,
    }

#stdlib is required by many things
include stdlib

#To be able to control traffic to/from the vm
include firewall

#Need a web server
class {'apache':  }

#add php module
class {'apache::mod::php': }

 firewall { '100 allow http and https access':
   port   => [80, 443],
   proto  => tcp,
   action => accept,
 }

#Note:
#docroot is set the same as in Vagrantfile
#override is set to all to ensure mod_rewrite is working
#for habari's needs
#There is a share setup in Vagrantfile to simplify 
#altering the web content in the vm
apache::vhost { 'habaridev' :
  priority => '20',
  port => '80',
  docroot => '/var/www/html',
  configure_firewall => false,
  override => 'All',
}

#habari
#create a data source
class { 'habari_install::mysql':
   root_password        => 'vagrant',
   schema               => 'habari',
   user                 => 'vagrant',
   password             => 'vagrant',
   host                 => 'localhost',
   prefix               => 'habari__',
}

#install code
class { 'habari_install':
   db_template_head     => $habari_install::mysql::template_head,
   version              => '0.9',
   admin_username       => 'admin',
   admin_pass           => 'vagrant',
}


