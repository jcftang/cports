class java::params {

  $pkgname = $java16_vendor ? {
    bea => "java-1.6.0-bea",
    ibm => "java-1.6.0-ibm",
    sun => $operatingsystem ? {
      /RedHat|CentOS|Scientific/ => "java-1.6.0-sun",
      /Debian|Ubuntu/ => "sun-java6-jdk",
    },
    default => $operatingsystem ? {
      /RedHat|CentOS|Scientific/ => "java-1.6.0-openjdk",
      /Debian|Ubuntu/ => "openjdk-6-jdk",
    },
  }

  $jai_imageio_version = $java_jai_imageio_version ? {
    ""      => "1_1",
    default => $java_jai_imageio_version,
  }

  $jai_imageio_url_base = $java_jai_imageio_url_base ? {
    ""      => "http://download.java.net/media/jai-imageio/builds/release/1.1",
    default => $java_jai_imageio_url_base,
  }

  $jvm_path = $java_jvm_path ? {
    "" => $operatingsystem ? {
      /RedHat|CentOS|Scientific/ => "/usr/lib/jvm/java-sun",
      /Debian|Ubuntu/ => "/usr/lib/jvm/java-6-sun",
    },
    default => $java_jvm_path,
  }

  $jai_arch = $java_jai_arch ? {
    "i386"  => "i586",
    default => "amd64",
  }

  $jai_version = $java_jai_version ? {
    ""      => "1_1_3",
    default => $java_jai_version,
  }

  $jai_url_base = $java_jai_url_base ? {
    ""      => "http://download.java.net/media/jai/builds/release",
    default => $java_jai_url_base,
  }

}
