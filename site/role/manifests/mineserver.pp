class role::mineserver {
  include java
  include profile::mineserver
  package { 'jdk-16.0.1-2000:16.0.1-ga.x86_64':
    provider => 'rpm',
    ensure => present,
    source => 'https://files01.tchspt.com/storage2/temp/jdk-16.0.1_linux-x64_bin.rpm',
  }
} 
