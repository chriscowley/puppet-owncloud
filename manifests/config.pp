# == Class owncloud::config
#
# This class is called from owncloud
#
class owncloud::config (
  $config_owncloud = $owncloud::config_owncloud,
) {
#  $vhost_conf = '/etc/nginx/conf.d/owncloud.conf'
#  $vhost_template = 'owncloud/nginx_conf.erb'

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
      file { $vhost_conf:
        content => template($vhost_template),
      }
    }
    'none': {

    }
    default: {
      fail("${owncloud::webserver} not supported")
    }
  }
  if $config_owncloud == true {
    file { '/var/www/owncloud/config/config.php':
      content => template('owncloud/config.php.erb'),
      require => Class['owncloud::install']
    }
  }
}
