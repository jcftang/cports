# Java Advanced Imaging

class java::jai {

  include java::params

  archive::tar-gz{"${java::params::jvm_path}/ext/jai-${java::params::jai_version}/.installed":
    source  => "${java::params::jai_url_base}/${java::params::jai_version}/jai-${java::params::jai_version}-lib-linux-${java::params::jai_arch}.tar.gz",
    target  => "${java::params::jvm_path}/ext",
    require => Package["${java::params::pkgname}"],
  }

  file {"${java::params::jvm_path}/jre/lib/${java::params::jai_arch}/libmlib_jai.so":
    ensure  => link,
    target  => "${java::params::jvm_path}/ext/jai-${java::params::jai_version}/lib/libmlib_jai.so",
    require => [ 
      Package["${java::params::pkgname}"], 
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai-${java::params::jai_version}/.installed"]
    ],
  }

  file {"${java::params::jvm_path}/jre/lib/ext/jai_core.jar":
    ensure  => link,
    target  => "${java::params::jvm_path}/ext/jai-${java::params::jai_version}/lib/jai_core.jar",
    require => [ 
      Package["${java::params::pkgname}"], 
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai-${java::params::jai_version}/.installed"]
    ],
  }
  
  file {"${java::params::jvm_path}/jre/lib/ext/jai_codec.jar":
    ensure  => link,
    target  => "${java::params::jvm_path}/ext/jai-${java::params::jai_version}/lib/jai_codec.jar",
    require => [            
      Package["${java::params::pkgname}"],
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai-${java::params::jai_version}/.installed"]
    ],
  }

  file {"${java::params::jvm_path}/jre/lib/ext/mlibwrapper_jai.jar":
    ensure  => link,
    target  => "${java::params::jvm_path}/ext/jai-${java::params::jai_version}/lib/mlibwrapper_jai.jar",
    require => [            
      Package["${java::params::pkgname}"],
      Archive::Tar-gz["${java::params::jvm_path}/ext/jai-${java::params::jai_version}/.installed"]
    ],
  }

}

