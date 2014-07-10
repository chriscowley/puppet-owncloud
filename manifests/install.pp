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
  }
#  exec { 'tar xf /opt/staging/owncloud-${version}.tar.bz2':
#    cwd => '/var/www/',
#    creates => '/var/www/owncloud',
#    require => Exec["$url /opt/staging/owncloud-${version}.tar.bz2"],
#  }
}
