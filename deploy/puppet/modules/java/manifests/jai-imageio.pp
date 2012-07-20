# Java Advanced Imaging

class java::jai-imageio {

  include java::params

  archive::tar-gz{"${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/.installed":
    source => $architecture ? {
      "i386"  => "${java::params::jai_imageio_url_base}/jai_imageio-${java::params::jai_imageio_version}-lib-linux-i586.tar.gz",
      "amd64" => "${java::params::jai_imageio_url_base}/jai_imageio-${java::params::jai_imageio_version}-lib-linux-amd64.tar.gz",
    },
    target  => "${java::params::jvm_path}/ext",
    require => Package["${java::params::pkgname}"],
  }

  file {"${java::params::jvm_path}/jre/lib/${java::params::jai_arch}/libclib_jiio.so":
    ensure => link,
    target => "${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/lib/libclib_jiio.so",
    require => [ 
      Package["${java::params::pkgname}"], 
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/.installed"]
    ],
  }

  file {"${java::params::jvm_path}/jre/lib/ext/jai_imageio.jar":
    ensure => link,
    target => "${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/lib/jai_imageio.jar",
    require => [ 
      Package["${java::params::pkgname}"], 
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/.installed"]
    ],
  }
  
  file {"${java::params::jvm_path}/jre/lib/ext/clibwrapper_jiio.jar":
    ensure => link,
    target => "${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/lib/clibwrapper_jiio.jar",
    require => [            
      Package["${java::params::pkgname}"],
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai_imageio-${java::params::jai_imageio_version}/.installed"]
    ],
  }

}
