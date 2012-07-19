node 'cports.localhost' inherits default {
	Package { ensure => "installed" }
	$enhancers = [ "gcc-gfortran" ]
	package { $enhancers: }
}
