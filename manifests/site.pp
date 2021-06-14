node slave1.puppet {

  class { 'apache': }
  
  apache::vhost { 'static':
    port    => '8080',
    docroot => '/var/www/html',
  }
     
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://github.com/acidforest101/control_repo/blob/ad53e4c1b15044998bbf2ef28e4e38b68690ac61/files/index.html',
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
      source => 'https://github.com/acidforest101/control_repo/blob/e32f08a38c53f86eb1c33570c6f7722e7ad4df50/files/index.php',
  }
  
  service { 'httpd':
    hasrestart => 'true',
  }
 
  file { '/root/README':
    ensure => 'absent',
  }
}
