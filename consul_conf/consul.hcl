bootstrap = true
datacenter = "demo-environment"
data_dir = "/opt/consul"
log_level = "INFO"
node_name = "main"
server =true

bind_addr = "0.0.0.0"
advertise_addr = "{{GetPrivateIP}}"

addresses {
	    https = "0.0.0.0"
}

encrypt   = "XNs+CKPxyf+nUHQFYPxHTA=="
ca_file   = "/etc/consul.d/ssl/ca.cert"
cert_file = "/etc/consul.d/ssl/consul.cert"
key_file  = "/etc/consul.d/ssl/consul.key"

acl = {
	enabled = true,
	default_policy = "deny",
	enable_token_persistence = true
	tokens = {
		    master  = "bc9dc329-cbfb-4fd1-3a96-41014c4bb563"
		    agent   = "262411a7-e69f-315a-2f30-0e365165ee2a"
		    default = "262411a7-e69f-315a-2f30-0e365165ee2a"
	}
}

ports = {
	  http  = -1
	  https = 8501
}
