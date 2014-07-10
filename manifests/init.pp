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
  $url_base = $owncloud::params::url_base
  $version  = $owncloud::params::version
) inherits owncloud::params {

  # validate parameters here

  class { 'owncloud::install': } ->
  class { 'owncloud::config': } ~>
  class { 'owncloud::service': } ->
  Class['owncloud']
}
