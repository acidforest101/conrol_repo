node 'slave1.puppet' {
  file { '/root/README':
    ensure => 'absent',
  }
  class { 'apache': }
  apache::vhost { 'localhost':
    vhost_name => '*',
    port => '8080',
    docroot => '/var/www/html',
  }
  file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.html',
      replace => 'true',
  }
}
node 'slave2.puppet' {
  file { '/root/README':
    ensure => 'absent',
  }
  class { 'apache::mod::php': }
  apache::vhost { 'localhost':
    vhost_name => '*',
    port => '8081',
    docroot => '/var/www/html',
  }  
  file { '/var/www/html/index.php':
      ensure => file,
      source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/files/index.php',
      replace => true,
  }
}
node 'master.puppet' {
  include nginx
  nginx::resource::server { 'master':
    listen_port => 80,
    proxy => 'http://192.168.33.12:8081',
  }
}
node 'mineserver.puppet' {
  include role::mineserver
}
