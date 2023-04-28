resource "docker_container" "mariadb" {
  name  = "db"
  image = docker_image.mariadb-image.name
  hostname = "db"
  labels  {
    label = "challenge"
    value = "second"
  }
  networks_advanced = "my_network"
  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website"

  ]
  volumes {
    volume_name = docker_volume.mariadb_volume.name
    container_path = "/var/lib/mysql"
  }

}