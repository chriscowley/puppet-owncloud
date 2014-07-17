# == Class owncloud::config
#
# This class is called from owncloud
#
class owncloud::config {
  case $owncloud::webserver {
    'nginx': {
      $vhost_template = 'owncloud/nginx_conf.erb'
    }
  }
}
