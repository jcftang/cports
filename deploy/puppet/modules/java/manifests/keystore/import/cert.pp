/*

=Definition: java::::keystore::import::cert
Import a certificate in a keystore

Args:
  $name      - certificate alias in keystore
  $cert      - certificate file
  $keystore  - keystore full path (default: ${JAVA_HOME}/jre/lib/security/cacerts)
  $storepass - keystore password (default: changeit)

NOTE: please take care of $cert format. 
  Accepted formats are, for now: x509, DER

*/
define java::keystore::import::cert ($ensure=present,
                                     $cert,
                                     $keystore='${JAVA_HOME}/jre/lib/security/cacerts',
                                     $storepass='changeit') {
  
  case $ensure {
    present: {
      exec {"Import ${name} cert in ${keystore}":
        command => "keytool -importcert -alias ${name} -file ${cert} -keystore ${keystore} -storepass ${storepass} -noprompt -trustcacerts",
        unless  => "keytool -list -keystore ${keystore} -alias ${name}",
      }
    }
    absent: {
      exec {"Remove $name cert from ${keystore}":
        exec   => "keytool -delete -keystore ${keystore} -alias ${name} -storepass ${storepass}",
        onlyif => "keytool -list -keystore ${keystore} -alias ${name}",
      }
    }
  }
}

