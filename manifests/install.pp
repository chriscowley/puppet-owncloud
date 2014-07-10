# == Class owncloud::install
#
class owncloud::install (
  $url = "${url_base}/owncloud-${version}.tar.bz2"
){
  exec { "$url /opt/staging/owncloud-${version}.tar.bz2":
    cwd => '/opt/staging',
    creates => "/opt/staging/owncloud-${version}.tar.bz2"
  }
#  exec { 'tar xf /opt/staging/owncloud-${version}.tar.bz2':
#    cwd => '/var/www/',
#    creates => '/var/www/owncloud',
#    require => Exec["$url /opt/staging/owncloud-${version}.tar.bz2"],
#  }
}
