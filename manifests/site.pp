node slave1.puppet {

  class { 'apache':
    }
  
  file { '/root/README':
    ensure => absent,
     }
}

node slave2.puppet {
  package { "mc": ensure => 'latest' }
 }
