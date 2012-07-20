/*

=Definition: java::keystore::import::key
Import a private key in a keystore

Args:
  $name      - keypair alias in keystore
  $pkey      - private key file
  $cert      - certificate file
  $pkey_pass - private key password
  $keystore  - keystore full path (default: ${JAVA_HOME}/jre/lib/security/cacerts)
  $storepass - keystore password (default: changeit)

Require:
  module openssl: https://github.com/camptocamp/puppet-openssl

*/
define java::keystore::import::key ($ensure=present,
                                    $pkey,
                                    $cert,
                                    $pkey_pass,
                                    $keystore='${JAVA_HOME}/jre/lib/security/cacerts',
                                    $storepass='changeit') {

  $cacert_cache_dir = '/var/cache/java_keys'

  if !defined(File[$cacert_cache_dir]) {
    file {$cacert_cache_dir:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => 0750,
    }
  }

  # convert keypair to pkcs12
  openssl::export::pkcs12 {$name:
    ensure  => $ensure,
    basedir => $cacert_cache_dir,
    pkey    => $pkey,
    cert    => $cert,
    pkey_pass => $pkey_pass,
  }

  case $ensure {
    present: {
      exec {"Import ${name} key in ${keystore}":
        command => "keytool -importkeystore -srckeystore ${cacert_cache_dir}/${name}.p12 -srcstoretype pkcs12 -srcstorepass ${pkey_pass} -srcalias ${name} -destkeystore ${keystore} -deststoretype jks -deststorepass ${storepass}",
        unless  => "keytool -list -keystore ${keystore} -alias ${name}",
        require => Openssl::Export::Pkcs12[$name],
      }
    }
    absent: {
      exec {"Remove $name key from ${keystore}":
        exec   => "keytool -delete -keystore ${keystore} -alias ${name} -storepass ${storepass}",
        onlyif => "keytool -list -keystore ${keystore} -alias ${name}",
      }
    }
  }
}
