group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Vagrant-built virtual machine!
              Managed by Puppet.\n"
}

include stdlib
include firewall
include apache


#class apache {
#  firewall { '100 allow http and https access':
#    port   => [80, 443],
#    proto  => tcp,
#    action => accept,
#  }
#}

class {'apache::mod::php': }

#service { 'iptables': 
#ensure => stopped, 
#}


#apache::vhost { 'growinglibertydev.com' :
#  priority => '20',
#  port => '80',
#  docroot => $docroot,
#  configure_firewall => false,
#}


#apache::vhost { 'www.example.com':
#    priority        => '10',
#    vhost_name      => '192.168.33.10',
#    port            => '80',
#    docroot         => '/home/vagrant',
#}

