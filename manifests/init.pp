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
  $filename = $owncloud::params::filename,
  $url      = $owncloud::params::url,
) inherits owncloud::params {

  # validate parameters here

  class { 'owncloud::install': } ->
  class { 'owncloud::config': } ->
  Class['owncloud']
}
