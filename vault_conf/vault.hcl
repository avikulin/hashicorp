ui = true

listener "tcp" {
	address = "main.ru-central1.internal:8200"
	tls_ca_file   = "/etc/vault.d/ssl/ca.cert"
 	tls_cert_file = "/etc/vault.d/ssl/consul.cert"
 	tls_key_file  = "/etc/vault.d/ssl/consul.key"
}

listener "tcp" {
	address = "127.0.0.1:8200"
	tls_ca_file   = "/etc/vault.d/ssl/ca.cert"
 	tls_cert_file = "/etc/vault.d/ssl/consul.cert"
 	tls_key_file  = "/etc/vault.d/ssl/consul.key"
}

storage "consul" {
	address = "main.ru-central1.internal:8501"
	token = "593f5cc3-a54c-ab27-18fa-e377e9a5cf38"
	path = "vault/"
	scheme = "https"
	tls_ca_file   = "/etc/vault.d/ssl/ca.cert"
 	tls_cert_file = "/etc/vault.d/ssl/consul.cert"
 	tls_key_file  = "/etc/vault.d/ssl/consul.key"
}
