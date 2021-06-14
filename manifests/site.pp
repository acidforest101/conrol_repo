node slave1.puppet {

  class { 'apache': }
  
  apache::vhost { 'static':
    port    => '8080',
    docroot => '/var/www/html',
  }
     
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.html',
  }
  
  service { 'httpd':
    hasrestart => 'true',
  }
    
  file { '/root/README':
    ensure => 'absent',
  }
}

node slave2.puppet {

  class { 'apache::mod::php': }
  
  apache::vhost { 'dynamic':
    port    => '8081',
    docroot => '/var/www/html',
  }
  
  file { '/var/www/html/index.php':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.php',
  }
  
  service { 'httpd':
    hasrestart => 'true',
  }
 
  file { '/root/README':
    ensure => 'absent',
  }
}
