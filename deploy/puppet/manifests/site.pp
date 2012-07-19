# Import site-wide variables
import 'variables.pp'
import 'functions.pp'

# Import node definitions from any additional manifests
import 'nodes/*.pp'

# Default thing to do for all nodes
node "default" {
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

	service { "iptables":
		enable => false,
		ensure => "stopped",
	}

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
