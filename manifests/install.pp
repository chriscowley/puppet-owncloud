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
  exec { "/bin/tar xf ${filename}":
    cwd => '/var/www/',
    creates => '/var/www/owncloud',
    require => Exec["curl -o ${filename} ${url}"],
  }
}
