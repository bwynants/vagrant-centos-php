# vi: set ft=ruby :
#
# Note: puppet modules are installed into the modules diretory
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

package { 'git':
    ensure => installed,
    }


include stdlib
include firewall

#include apache
class {'apache':  }
class {'apache::mod::php': }

 firewall { '100 allow http and https access':
   port   => [80, 443],
   proto  => tcp,
   action => accept,
 }

apache::vhost { 'habaridev' :
  priority => '20',
  port => '80',
  docroot => '/var/www/html',
  configure_firewall => false,
}

#habari
#create data source
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


