locals {
  options = <<MANAGEMENT
----------------------------------------------------
---POOLS TABLE ----------------------------------
----------------------------------------------------
${var.poolb["name"]}
tostring(${var.poolb["nodes"][0]})
MANAGEMENT

}

output "toString" {
  value = local.options
}
