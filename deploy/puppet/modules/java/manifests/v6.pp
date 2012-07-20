class java::v6 {

  include java::params

  if $operatingsystem =~ /Ubuntu|Debian/ and $java16_vendor == "sun" {

    # Thanks to Java strange licensing
    file {"/var/cache/debconf/sun-java6-bin.preseed":
      ensure  => present,
      content => "sun-java6-bin   shared/accepted-sun-dlj-v1-1    boolean true",
    }
  
    package {"sun-java6-bin":
      ensure       => present,
      responsefile => "/var/cache/debconf/sun-java6-bin.preseed",
      require      => File["/var/cache/debconf/sun-java6-bin.preseed"],
      before       => Package["${java::params::pkgname}"],
    }
  
    # On Debian/Ubuntu status of update-java-alternatives is always 1,
    # || true is a dirty workaround to stop puppet from thinking it failed!
    exec {"set default jvm":
      command => "update-alternatives --set java /usr/lib/jvm/java-6-sun/jre/bin/java || true",
      unless  => 'test $(readlink /etc/alternatives/java) = /usr/lib/jvm/java-6-sun/jre/bin/java',
      require => Package["sun-java6-bin"],
    }

    exec {"set default keytool":
      command => "update-alternatives --set keytool /usr/lib/jvm/java-6-sun/jre/bin/keytool || true",
      unless  => 'test $(readlink /etc/alternatives/keytool) = /usr/lib/jvm/java-6-sun/jre/bin/keytool',
      require => Package["sun-java6-bin"],
    }
  
    $jvm = '6'
    file {"/etc/profile.d/java_home":
      ensure  => present,
      content => template("java/java-home.erb"),
    }
  
  }

  package {"${java::params::pkgname}":
    alias  => "java-1.6",
    ensure => present,
  }

  if $operatingsystem =~ /RedHat|CentOS|Scientific/ {
    package {"${java::params::pkgname}-devel":
      alias  => "java-1.6-devel",
      ensure => present,
    }
  }
}
