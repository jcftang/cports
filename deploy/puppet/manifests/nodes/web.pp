node 'web.localhost' inherits default {
	# install needed packages
	Package { ensure => "installed" }
	$enhancers = [ "httpd" ]
	package { $enhancers: }

	# turn on services
	service { "httpd":
		enable => true,
		ensure => "running",
		require => Package["httpd"],
	}
}
