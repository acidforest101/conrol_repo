node slave1.puppet {

  package { 'httpd': 
    ensure => 'installed',
  }
  
  package { 'php':
    ensure => 'installed',
  }
     
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://github.com/acidforest101/control_repo/blob/ad53e4c1b15044998bbf2ef28e4e38b68690ac61/files/index.html',
  }
  
  file { '/etc/httpd/conf.d':
      ensure => file,
      source => 'https://github.com/acidforest101/control_repo/blob/e32f08a38c53f86eb1c33570c6f7722e7ad4df50/files/static.conf',
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
   
  file { '/var/www/html/index.php':
      ensure => file,
      source => 'https://github.com/acidforest101/control_repo/blob/e32f08a38c53f86eb1c33570c6f7722e7ad4df50/files/index.php',
  }
  
  file { '/etc/httpd/conf.d':
      ensure => file,
      source => 'https://github.com/acidforest101/control_repo/blob/e32f08a38c53f86eb1c33570c6f7722e7ad4df50/files/dynamic.conf',
  }
  
  service { 'httpd':
    ensure => 'running',
    enable => 'true',
  }
 
  file { '/root/README':
    ensure => 'absent',
  }
}
