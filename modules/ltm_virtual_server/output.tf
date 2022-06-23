locals {
  options = <<MANAGEMENT
----------------------------------------------------
---POOLS TABLE ----------------------------------
----------------------------------------------------
${var.vserver["name"]}
MANAGEMENT

}

output "toString" {
  value = local.options
}
