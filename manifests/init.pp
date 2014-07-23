# == Class: owncloud
#
# Full description of class owncloud here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class owncloud (
  $filename      = $owncloud::params::filename,
  $url           = $owncloud::params::url,
  $servername    = $owncloud::params::servername,
  $webserver     = $owncloud::params::webserver,
  $ssl           = $owncloud::params::ssl,
  $dbtype        = $owncloud::params::dbtype,
  $dbname        = $owncloud::params::dbname,
  $dbuser        = $owncloud::params::dbuser,
  $dbpassword    = $owncloud::params::dbpassword,
  $dbtableprefix = $owncloud::params::dbtableprefix,
) inherits owncloud::params {

  # validate parameters here

  class { 'owncloud::install': } ->
  class { 'owncloud::config': } ->
  Class['owncloud']
}
