job "hashi-ui" {
  datacenters = ["demo-environment"]
  type        = "service"

  group "Nomad-modern-UI" {
    count = 1

    task "hashi-ui" {
      driver = "docker"

      config {
        image        = "jippi/hashi-ui"
        network_mode = "host"
      }

      service {
        port = "http"

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }

      env {
        NOMAD_ENABLE = 1
        NOMAD_ADDR   = "http://127.0.0.1:4646"

        /**CONSUL_ENABLE = 1
        CONSUL_ADDR   = "consul.service.consul:8500"
	*/
      }

      resources {
        cpu    = 500
        memory = 512

        network {
          mbits = 5

          port "http" {
            static = 3000
          }
        }
      }
    }
  }
}
