job "mariadb" {
  datacenters = ["demo-environment"]
  type        = "service"

  group "mariadb-server-and-admin-ui" {
    count = 1

    task "mariadb-server" {
      driver = "docker"

      env {
        MYSQL_ROOT_PASSWORD = "secret"
      }
      
      config {
        image    = "mariadb:10.3"
        volumes = ["/var/nomad.persistent.data/mariadb/data:/var/lib/mysql:Z",
                   "/var/nomad.persistent.data/mariadb/logs:/var/lib/mysql/logs:Z",
                   "/var/nomad.services.conf/mariadb/etc:/etc/mysql/conf.d:Z"]
        port_map {
            db = 3306
        }
      }

      resources {
        cpu    = 500
        memory = 1024
        network {
            port "db" {
              static = 3306
            }
          }
        }

      service {
        name = "mysql-server"
        tags = ["database", "mysql"]
        port = "db"
        check {
            type     = "tcp"
            port     = "db"
            interval = "10s"
            timeout  = "2s"
        }
      }
    }
  }
}