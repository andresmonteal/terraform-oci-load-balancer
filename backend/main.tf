
locals {
  compartment_id   = try(data.oci_identity_compartments.this[0].compartments[0].id, var.compartment_id)
  load_balancer_id = try(data.oci_load_balancer_load_balancers.this[0].load_balancers[0].id, var.load_balancer_id)
}

resource "oci_load_balancer_backend" "test_backend" {
  #Required
  backendset_name  = var.backendset_name
  ip_address       = var.ip_address
  load_balancer_id = local.load_balancer_id
  port             = var.port

  #Optional
  backup  = var.backup
  drain   = var.drain
  offline = var.offline
  weight  = var.weight

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}