provider "google" {
  project     = "hari-cloud-first-project"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-medium"
  zone        = "us-central1-c"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
