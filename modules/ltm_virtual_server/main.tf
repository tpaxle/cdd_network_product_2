###############################################################################
##### NAMING CONVENTION CONFIGURATION IMPORT ##################################
###############################################################################

# A Virtual server with SSL enabled
resource "bigip_ltm_virtual_server" "https" {
  name                       = var.vserver["name"]
  destination                = var.vserver["destination"]
  description                = var.vserver["description"]
  port                       = var.vserver["ports"]
  pool                       = var.vserver["pool"]
  profiles                   = var.vserver["profiles"]
  source_address_translation = var.vserver["source_address_translation"]
  translate_address          = var.vserver["translate_address"]
  translate_port             = var.vserver["translate_port"]
}