provider "google" {
    project = var.project_name
    region  = var.region
    zone    = var.zone
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.firewall_rules}-ssh"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["${var.vpc_network}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]
  depends_on = [ google_compute_network.vpc_network ]
}

resource "google_compute_firewall" "jenkins" {
  name    = "${var.firewall_rules}-jenkins"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  target_tags   = ["${var.vpc_network}-firewall-jenkins"]
  source_ranges = ["0.0.0.0/0"]
  depends_on = [ google_compute_network.vpc_network ]
}


resource "google_compute_network" "vpc_network" {
    name = var.vpc_network
}

resource "google_compute_instance" "vm_instance" {
    name = var.vm_instance_name
    machine_type = "n2-highcpu-2"
    zone = var.zone
    boot_disk {
        initialize_params {
            image = var.machine_type
        }
    }
    network_interface {
        network = google_compute_network.vpc_network.name
        access_config {}
    }
    
    tags = [ 
        "${var.vpc_network}-firewall-ssh",
        "${var.vpc_network}-firewall-jenkins"
    ]

    metadata = {
        sshKeys = "${var.ssh_user}:${var.ssh_key}"
    }

    metadata_startup_script = file("./startup.sh")
}
