node 'cports.localhost' {
	file { "/etc/profile.d/proxy.sh": ensure => present, }

	line { http_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export http_proxy=http://proxy.tchpc.tcd.ie:8080",
	}

	line { https_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export https_proxy=http://proxy.tchpc.tcd.ie:8080",
	}

	line { ftp_proxy:
		file => "/etc/profile.d/proxy.sh",
		line => "export ftp_proxy=http://proxy.tchpc.tcd.ie:8080",
	}

	Package { ensure => "installed" }
	$enhancers = [ "screen", "strace", "sudo", "git", "gcc-gfortran" ]
	package { $enhancers: }
}
