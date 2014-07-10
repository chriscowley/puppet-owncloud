# == Class owncloud::params
#
# This class is meant to be called from owncloud
# It sets variables according to platform
#
class owncloud::params {
  $url_base    = 'http://download.owncloud.org/community/testing/'
  $releasever  = '7.0.0RC1'
  $url         = "${url_base}/owncloud-${releasever}.tar.bz2"
  $filename    = "/opt/owncloud-${releasever}.tar.bz2"
}
