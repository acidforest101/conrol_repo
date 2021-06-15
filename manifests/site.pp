node slave1.puppet {
  
  file { '/root/README':
    ensure => 'absent',
  }
  
  class { 'apache': }
  
  file { '/etc/httpd/conf.d/static.conf':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/static.conf',
  }
     
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.html',
  }
  
  service { 'httpd':
    restart
  }
}

node slave2.puppet {

  file { '/root/README':
    ensure => 'absent',
  }

  class { 'apache::mod::php': }
  
  file { '/etc/httpd/conf.d/dynamic.conf':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/dynamic.conf',
  }
  
  file { '/var/www/html/index.php':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.php',
  }
  
  service { 'httpd':
    restart
  }
}
