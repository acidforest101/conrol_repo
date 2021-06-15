node slave1.puppet {
  
  file { '/root/README':
    ensure => 'absent',
  }
  
  class { 'apache': }
  
  file { '/etc/httpd/conf.d/static.conf':
      ensure => file,
      source => 'puppet:////production/files/static.conf',
      replace => 'true',
  }
     
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'puppet:///production/files/index.html',
      replace => 'true',
  }

}

node slave2.puppet {

  file { '/root/README':
    ensure => 'absent',
  }

  class { 'apache::mod::php': }
  
  file { '/etc/httpd/conf.d/dynamic.conf':
      ensure => file,
      source => 'puppet:///production/files/dynamic.conf',
      replace => 'true',
  }
  
  file { '/var/www/html/index.php':
      ensure => file,
      source => 'puppet:////production/files/index.php',
      replace => 'true',
  }

}
