module "oci-lb" {
  source = "git::ssh://devops.scmservice.us-ashburn-1.oci.oraclecloud.com/namespaces/id9de6bj2yv6/projects/claro-devops/repositories/terraform-oci-load-balancer?ref=v0.1.2"

  for_each = var.load_balancers

  default_compartment_id = data.oci_identity_compartments.cmp_lvl3[each.key].compartments[0].id

  lb_options = {
    display_name   = each.key
    compartment_id = null
    shape          = each.value["shape"]
    subnet_ids     = [data.oci_core_subnets.subnets[each.key].subnets[0].id]
    private        = each.value["type"] == "public" ? "false" : true
    nsg_ids        = null
    defined_tags   = lookup(each.value, "defined_tags", {})
    freeform_tags  = lookup(each.value, "freeform_tags", {})
    shape_details  = lookup(each.value, "shape_details", {})
  }

  health_checks = each.value["health_checks"]

  backend_sets = each.value["backend_sets"]

  listeners = each.value["listeners"]
}