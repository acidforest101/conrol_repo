node slave1.puppet {

  package { 'httpd': 
    ensure => 'installed',
  }
  
  package { 'php':
    ensure => 'installed',
  }
 
  service { 'httpd':
    ensure => 'running',
    enable => 'true',
  }
 
  file { '/root/README':
    ensure => 'absent',
  }
}

node slave2.puppet {
  
  package { 'httpd': 
    ensure => 'installed',
  }
  
  package { 'php':
    ensure => 'installed',
  }
 
  service { 'httpd':
    ensure => 'running',
    enable => 'true',
  }
 
  file { '/root/README':
    ensure => 'absent',
  }
}
