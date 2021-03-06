# == Class owncloud::install
#
class owncloud::install (
  $url            = $owncloud::url,
  $filename       = $owncloud::filename,
  $clear_skeleton = $owncloud::clear_skeleton,
  $webserver_user = $owncloud::webserver_user,
) {
  exec { "curl -o ${filename} ${url}":
    cwd     => '/opt/',
    creates => $filename,
    path    => '/usr/bin/',
    before  => Exec["/bin/tar xf ${filename}"],
  }
  exec { "/bin/tar xf ${filename}":
    cwd         => '/var/www/',
    subscribe   => Exec["curl -o ${filename} ${url}"],
    refreshonly => true,
    require     => File['/var/www/'],
  }
  file { '/var/www':
    ensure => directory,
  }
  file { '/var/www/owncloud':
    require => File["/bin/tar xf ${filename}"],
    owner   => $webserver_user,
    recurse => true,
  }
  if $clear_skeleton == true {
    file { '/var/www/owncloud/core/skeleton/photos':
      ensure  => absent,
      require => Exec["/bin/tar xf ${filename}"],
    }
    file { '/var/www/owncloud/core/skeleton/music':
      ensure  => absent,
      require => Exec["/bin/tar xf ${filename}"],
    }
    file { '/var/www/owncloud/core/skeleton/documents':
      ensure  => absent,
      require => Exec["/bin/tar xf ${filename}"],
    }
  }
}
