#
# This class contains all packages necessary for developping Java applications
#

class java::dev {
  package {"maven2":
    ensure  => present,
    require => Package["java-1.6"],
  }

  package {"ant":
    ensure => present,
  }
}
