node slave1.puppet {
  Package { ensure => 'installed' }
  $packages = [ 'httpd', 'php' ]
  package { $packages: }
  
  service { 'httpd': ensure => running, enable => true, }
