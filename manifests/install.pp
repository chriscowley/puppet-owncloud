# == Class owncloud::install
#
class owncloud::install (
  $url      = $owncloud::url,
  $filename = $owncloud::filename,
) {
  exec { "curl -o $filename $url":
    cwd => '/opt/',
    creates => $filename,
    path    => '/usr/bin/',
    before  => Exec["/bin/tar xf ${filename}"],
  }
  exec { "/bin/tar xf ${filename}":
    cwd => '/var/www/',
    creates => '/var/www/owncloud',
    require => File['/var/www/'],
  }
  file { '/var/www':
    ensure => directory,
  }
}
