# Import site-wide variables
import 'variables.pp'
import 'functions.pp'

# Import node definitions from any additional manifests
import 'nodes/*.pp'

# Default thing to do for all nodes
node "default" {
	class { "tchpc": }

	service { "iptables":
		enable => false,
		ensure => "stopped",
	}

}
