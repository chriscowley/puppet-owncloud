# == Class owncloud::config
#
# This class is called from owncloud
#
class owncloud::config {
  case $owncloud::webserver {
    'nginx': {
      case $::osfamily {
        'RedHat': {
          $vhost_conf = '/etc/nginx/conf.d/owncloud.conf'
        }
        default: {
          fail("${::osfamily} not supported")
        }
      }
      $vhost_template = 'owncloud/nginx_conf.erb'
    }
    default {
      fail ("${owncloud::webserver} not supported")
    }
  }
  file { $vhost_conf:
    content => template($vhost_template),
  }
  file { '/var/www/owncloud/config/config.php.test':
    content => template('owncloud/config.php.erb'),
    require => Class['owncloud::install'}
  }
}
