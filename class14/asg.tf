resource "google_compute_network" "vpc" {
    project = var.project_id
  name                    = "vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "public_subnet_1" {
    project = var.project_id
  region      = "us-central1"

  name          = "public-subnet1"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc.name
}


resource "google_compute_autoscaler" "foobar" {
  name   = "my-autoscaler"
  zone   = "us-central1-f"
  target = google_compute_instance_group_manager.foobar.id
  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60
    cpu_utilization {
      target = 0.5
    }
  }
}



resource "google_compute_instance_template" "foobar" {
    project = var.project_id

  name           = "my-instance-template"
  machine_type   = "e2-medium"
  can_ip_forward = false
  tags           = ["foo", "bar"]
  disk {
    source_image = "debian-cloud/debian-9"
  }
  network_interface {
    network = google_compute_subnetwork.public_subnet_1.name
  }
}


resource "google_compute_target_pool" "foobar" {
    project = var.project_id

  region  = "us-central1"
  name    = "my-target-pool"
}


resource "google_compute_instance_group_manager" "foobar" {
  name    = "my-igm"
  zone    = "us-central1-f"
  version {
    instance_template = google_compute_instance_template.foobar.id
    name              = "primary"
  }
  target_pools       = [google_compute_target_pool.foobar.self_link]
  base_instance_name = "foobar"
}