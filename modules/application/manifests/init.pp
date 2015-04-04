class application {
  include docker

  hiera_include('classes')

  sudo::conf { 'vagrant':
    priority => 30,
    content  => 'vagrant ALL=(ALL) NOPASSWD:ALL',
  }

  file { '/etc/update-motd.d':
    purge => true
  }

  ufw::allow { 'allow-ssh-from-all':
    port => 22,
    ip   => 'any',
  }

  ufw::allow { 'allow-http-from-all':
    port => 5004,
    ip   => 'any',
  }

  $application_directory = '/opt/vnext'

  file { $application_directory:
    ensure  => directory,
    source  => 'puppet:///modules/application/vnext',
    recurse => true,
    force   => true,
  }

  ::docker::image { 'vnext':
    docker_dir => $application_directory,
    require    => File[$application_directory],
  }

  ::docker::run { 'vnext':
    image   => 'vnext',
    tty     => true,
    ports   => ['5004:5004'],
    require => Docker::Image['vnext'],
  }

}
