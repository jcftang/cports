/*

=Definition: java::keystore::keypair

Creates (or delete) a keypair from a java keystore.

Args:
  $name             - key alias in keystore
  $keystore         - keystore filename (mandatory)
  $basedir          - keystore location (mandatory)
  $keyalg           - key algorithm (default: RSA)
  $keysize          - key size (default: 2048)
  $storepass        - keystore password (default: changeit)
  $alias            - key pair alias (default: $name)
  $validity         - key pair validity (default: 3650 days)
  $commonName       - key pair common name (default: localhost)
  $organisationUnit - key pair organisation unit (default: empty)
  $organisation     - key pair organisation (default: empty)
  $country          - key pair country (default: empty)
  keypass           - private key password (default: changeit)


Notes:
  - keytool will update an existing keystore!
  - according to https://issues.apache.org/bugzilla/show_bug.cgi?id=38217 ,
    storepass and keypass should be the same. As it's not sure it has
    to be the case in the future, we let you the choice about that.

*/
define java::keystore::keypair($ensure=present,
                               $keystore,
                               $basedir,
                               $keyalg='RSA',
                               $keysize=2048,
                               $storepass='changeit',
                               $kalias='',
                               $validity=3650,
                               $commonName='localhost',
                               $organisationUnit='',
                               $organisation='',
                               $country='',
                               $keypass='changeit'
                               ) {

  $_kalias = $kalias ? {
    ''      => $name,
    default => $kalias,
  }

  case $ensure {
    present: {
      $ou = $organisationUnit? {
        ''      => '',
        default => ",ou=${organisationUnit}",
      }
      $o = $organisation? {
        ''      => '',
        default => ",o=${organisation}",
      }
      $c = $country? {
        ''      => '',
        default => ",c=${country}",
      }

      $dn = "cn=${commonName}${ou}${o}${c}"
      exec {"java::key: Creates ${_kalias} to ${keystore}":
        command => "keytool -genkeypair -keyalg ${keyalg} -keysize ${keysize} -keystore ${basedir}/${keystore} -storepass ${storepass} -storetype jks -alias ${_kalias} -validity ${validity} -dname '${dn}' -keypass ${keypass}",
        unless  => "keytool -list -keystore ${basedir}/${keystore} -storepass ${storepass} -alias ${_kalias}"
      }

      exec {"java::key: Export ${_kalias} keypair":
        command => "keytool -exportcert -keystore ${basedir}/${keystore} -storepass ${storepass} -keypass ${keypass} -alias ${_kalias} -file ${basedir}/${_kalias}.crt",
        creates => "${basedir}/${_kalias}.crt",
        require => Exec["java::key: Creates ${_kalias} to ${keystore}"],
      }

      exec {"java::key: Generate CSR for ${_kalias}":
        command => "keytool -certreq -keystore ${basedir}/${keystore} -storepass ${storepass} -alias ${_kalias} -keypass ${keypass} -file ${basedir}/${_kalias}.csr",
        creates => "${basedir}/${_kalias}.csr",
        require => Exec["java::key: Creates ${_kalias} to ${keystore}"],
      }

    }
    absent: {
      exec {"java::key: Remove ${_kalias} from ${keystore}":
        command => "keytool -delete -alias ${_kalias} -keystore ${basedir}/${keystore} -storepass ${storepass}",
        onlyif  => "keytool -list -keystore ${keystore} -storepass ${storepass} -alias ${_kalias}",
      }
      file {["${basedir}/${_kalias}.csr", "${basedir}/${_kalias}.crt"]:
        ensure => absent,
      }
    }
  }
}
