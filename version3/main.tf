provider "google" {
    project = var.project_name
    region  = var.region
    zone    = var.zone
}

resource "google_compute_firewall" "default" {
  name    = var.firewall_rules
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["22","8080","30000-32767"]
  }

  target_tags   = ["${var.vpc_network}-firewall-ssh"]
  source_ranges = ["${chomp(data.http.myip.body)}/32"]
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
        "${var.vpc_network}-firewall-ssh" 
    ]

    metadata = {
        sshKeys = "${var.ssh_user}:${var.ssh_key}"
    }
}