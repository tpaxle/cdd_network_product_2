##############################################################################
##############################################################################
############################ System 


resource "bigip_sys_dns" "dns1" {
  description    = "/Common/DNS1"
  name_servers   = var.dns_servers
  number_of_dots = 2
  search         = var.dns_search
}


resource "bigip_sys_ntp" "ntp1" {
  description = "/Common/NTP1"
  servers     = var.ntp_servers
  timezone    = var.ntp_timezone
}



##############################################################################
##############################################################################
############################ Nodes
resource "bigip_ltm_node" "node" {
  for_each         = var.ltm_nodes
  name             = each.value["name"]
  address          = each.value["ip"]
  connection_limit = lookup(each.value, "connection_limit", "0")
  dynamic_ratio    = lookup(each.value, "dynamic_ratio", "1")
  description      = lookup(each.value, "description", "terraform-node")
  monitor          = lookup(each.value, "monitor", "/Common/icmp")
  rate_limit       = lookup(each.value, "rate_limit", "disabled")
  fqdn {
    address_family = "ipv4"
    interval       = "3000"
  }
}

##############################################################################
##############################################################################
############################ Virtual Servers 
resource "bigip_ltm_monitor" "monitors" {
  for_each = var.ltm_monitors

  name        = each.value["name"]
  destination = each.value["destination"]
  interval    = each.value["interval"]

  parent        = each.value["parent"]
  time_until_up = each.value["time_until_up"]
  timeout       = each.value["timeout"]

  adaptive       = lookup(each.value, "adaptive", "disaled")
  adaptive_limit = lookup(each.value, "adaptive_limit", 200)
  ip_dscp        = lookup(each.value, "ip_dscp", 0)
  manual_resume  = lookup(each.value, "manual_resume", "disabled")
  send           = lookup(each.value, "send", null)
  receive        = lookup(each.value, "receive", null)
  transparent    = lookup(each.value, "transparent", "disabled")
  up_interval    = lookup(each.value, "up_interval", 0)
  username       = lookup(each.value, "username", null)
  password       = lookup(each.value, "password", null)
}

module "pools" {
  source   = "./modules/ltm_pool"
  for_each = var.ltm_pools
  poolb    = each.value

  depends_on = [bigip_ltm_node.node, bigip_ltm_monitor.monitors]
}


module "vservers" {
  source   = "./modules/ltm_virtual_server"
  for_each = var.ltm_vservers
  vserver  = each.value

  depends_on = [module.pools]
}

# A Virtual server with SSL enabled

resource "bigip_command" "disable_dhcp" {
  commands = ["modify sys management-dhcp sys-mgmt-dhcp-config request-options delete { domain-name-servers }"]
}