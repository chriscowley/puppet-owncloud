# == Class owncloud::service
#
# This class is meant to be called from owncloud
# It ensure the service is running
#
class owncloud::service {

  service { $owncloud::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
