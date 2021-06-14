node slave1.puppet {

  class { 'apache': }
  
    apache::vhost { 'apache':
    port    => '8080',
    docroot => '/var/www/html',
     }
 
  file { '/root/README':
    ensure => absent,
     }
}

node slave2.puppet {
  package { "mc": ensure => 'latest' }
 }
