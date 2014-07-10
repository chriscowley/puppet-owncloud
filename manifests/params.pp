# == Class owncloud::params
#
# This class is meant to be called from owncloud
# It sets variables according to platform
#
class owncloud::params {
  $url_base = 'http://download.owncloud.org/community/testing/'
  $version  = '-7.0.0RC1',
}
