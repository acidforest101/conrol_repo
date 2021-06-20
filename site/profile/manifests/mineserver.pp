class profile::mineserver {
  file { '/opt/minecraft':
    ensure => 'directory',
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true'
  }
  file { '/opt/minecraft/server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/0a269b5f2c5b93b1712d0f5dc43b6182b9ab254e/server.jar',
    replace => false,
  }
  file { '/etc/systemd/system/mineserver.service':
    ensure => file,
    source => 'https://raw.githubusercontent.com/acidforest101/control_repo/production/modules/mineserver/mineserver.service',
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  service {'mineserver':
    ensure => running,
  }
}
