# == Class owncloud::params
#
# This class is meant to be called from owncloud
# It sets variables according to platform
#
class owncloud::params {
  $url_base        = 'http://download.owncloud.org/'
  $releasever      = '7.0.0'
  $url             = "${url_base}/owncloud-${releasever}.tar.bz2"
  $filename        = "/opt/owncloud-${releasever}.tar.bz2"
  $webserver       = 'nginx'
  $servername      = undef
  $config_owncloud = false
  $ssl             = undef
  $dbtype          = 'sqlite'
  $dbname          = 'owncloud'
  $dbuser          = undef
  $dbpassword      = undef
  $dbtableprefix   = 'oc_'
  $instanceid      = '7b3626c84bb02d12472c03d2ece878fdc4756c94'
  $passwordsalt    = '7b3626c84bb02d12472c03d2ece878fdc4756c94'
  $clear_skeleton  = false
}
