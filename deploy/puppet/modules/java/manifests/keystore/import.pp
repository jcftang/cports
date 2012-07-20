/*

=Definition: java::keystore::import

Import a java keystore.
It will either create a new keystore, or update an existing one.

Args:
  $name          - new keystore name
  $srcKeystore   - source keystore
  $basedir       - directory where you want to put the new keystore. Has to exists
  $srcStorepass  - source keystore password (default:changeit)
  $destStorepass - new keystore password

*/
define java::keystore::import ($ensure=present,
                               $srcKeystore,
                               $basedir,
                               $srcStorepass='changeit',
                               $destStorepass
                               ) {

  case $ensure {
    present: {
      exec {"Duplicate ${srcKeystore} to ${basedir}/${name}":
        command => "keytool -importkeystore -srckeystore ${srcKeystore} -destkeystore ${basedir}/${name} -srcstorepass ${srcStorepass} -deststorepass ${destStorepass}",
        creates => "${basedir}/${name}",
      }
    }
    absent: {
      file {"${basedir}/${name}":
        ensure => absent,
      }
    }
  }
}
