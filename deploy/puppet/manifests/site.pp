# Import site-wide variables
import 'variables.pp'
import 'functions.pp'

# Import node definitions from any additional manifests
import 'nodes/*.pp'

# Apply s_basenode to clients that lack more specific configuration
node "default" {
#  include s_basenode
}
