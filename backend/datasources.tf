data "oci_identity_compartments" "this" {
  count = var.tenancy_ocid == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment_name]
  }
}

data "oci_load_balancer_load_balancers" "this" {
  count = var.load_balancer_name == null ? 0 : 1
  #Required
  compartment_id = local.compartment_id

  #Optional
  display_name = var.load_balancer_name
  state        = "ACTIVE"
}