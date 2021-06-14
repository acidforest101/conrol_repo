node slave1.puppet {
 
  file { '/root/README':
    ensure => absent,
     }
}

node slave2.puppet {
  package { "mc": ensure => 'latest' }
 }
