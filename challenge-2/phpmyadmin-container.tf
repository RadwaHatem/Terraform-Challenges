resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  image = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"
  labels  {
    label = "challenge"
    value = "second"
  }
  networks_advanced = "my_network"
  ports {
    internal = 80
    external = 8081
    ip       = "0.0.0.0"
  }

  depends_on = [

    docker_container.mariadb
  ]

  links = [
    docker_container.mariadb.name
  ]
}
