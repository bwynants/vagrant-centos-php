# vi: set ft=ruby :
group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Vagrant-built virtual machine!
              Managed by Puppet.\n"
}

package { 'git':
    ensure => installed,
    }


include stdlib
include firewall
include apache

class {'apache::mod::php': }

 firewall { '100 allow http and https access':
   port   => [80, 443],
   proto  => tcp,
   action => accept,
 }

apache::vhost { 'growinglibertydev.com' :
  priority => '20',
  port => '80',
  docroot => '/var/www/html',
  configure_firewall => false,
}

include mysql
#MySQL

#mysql::server
#
#Installs mysql-server packages, configures my.cnf and starts mysqld service:
#Database login information stored in /root/.my.cnf.

class { 'mysql::server':
  config_hash => { 'root_password' => 'vagrant' }
}

#mysql::db
#
#Creates a database with a user and assign some privileges.

mysql::db { 'mydb':
  user     => 'vagrant',
  password => 'vagrant',
  host     => 'localhost',
  grant    => ['all'],
}



