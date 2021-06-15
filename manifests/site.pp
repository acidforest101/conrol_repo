node slave1.puppet {
  
  file { '/root/README':
    ensure => 'absent',
  }
  
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
}

node slave2.puppet {

  file { '/root/README':
    ensure => 'absent',
  }

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
}
