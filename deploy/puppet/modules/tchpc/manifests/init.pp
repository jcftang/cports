# == Class: tchpc
#
# Full description of class tchpc here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { tchpc:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class tchpc {

    case $operatingsystem {
        'scientific', 'redhat', 'centos': {
            $supported = true
        }
        default: {
            $supported = false
            notify { "${module_name}_unsupported":
                message => "The ${module_name} module is not supported on ${operatingsystem}",
            }
        }
    }

    if ( $supported == true ) {
	class { "tchpc::proxy": }
	class { "tchpc::ntp": }
    }

}

class tchpc::proxy {
	file { "/etc/profile.d/proxy.sh": ensure => present, }

	line { http_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export http_proxy=http://proxy.tchpc.tcd.ie:8080",
		require => File["/etc/profile.d/proxy.sh"],
	}

	line { https_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export https_proxy=http://proxy.tchpc.tcd.ie:8080",
		require => File["/etc/profile.d/proxy.sh"],
	}

	line { ftp_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export ftp_proxy=http://proxy.tchpc.tcd.ie:8080",
		require => File["/etc/profile.d/proxy.sh"],
	}

	line { http_proxy_yum:
		file => "/etc/yum.conf",
		line => "proxy=http://proxy.tchpc.tcd.ie:8080",
	}

        Package { ensure => "installed" }
        $enhancers = [ "screen", "strace", "sudo", "git" ]
        package { $enhancers:
               require => Line["http_proxy_yum"],
	}
}

class tchpc::ntp {
        line { ntp_conf:
                file => "/etc/ntp.conf",
                line => "server ntp.tchpc.tcd.ie",
        }

        service { "ntpd":
                enable => true,
                ensure => "running",
                require => Line["ntp_conf"],
        }
}
