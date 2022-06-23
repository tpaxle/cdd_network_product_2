variable hostname {}
variable port {}
variable username {}
variable password {}

variable sync_config {
    default = false
}
variable snmp_contact {
  type = string
  description = "asalksjdfasdf"
  default = "ami@gruposantander.com"
}

variable snmp_location {
  description = "asalksjdfasdf"
  type = string
  default = "cloud"
}

variable snmp_allowedaddress {
  description = "asalksjdfasdf"
  type = list
}


variable dns_servers {
  type = list
  description = "Dns server IP's list"
  default = []
}

variable dns_search {
  type = list
  description = "Dns domains search list"
  default = []
}

variable ntp_servers {
  type = list
  description = "NTP Servers list"
  default = []
}

variable ntp_timezone {
  type = string
  description = "NTP Servers list"
  default = "Europe/Madrid"
}

variable ltm_monitors {
  type = map
  default = {
      example_1 = {
        name           = "/Common/tcp_example_8021"
        destination    = "*:8021"
        interval       = 5
        parent         = "/Common/tcp"
        time_until_up  = 0

      }
   }
}


variable ltm_nodes {
  type = map
  default = {
      example_1 = {
        name   = "/Common/cccp1ew1imggloballserver01"
        ip     = "1.1.1.1"
        description = "Gravity server"
      }
   }
}

variable ltm_pools {
  type = map
  default = {
      example_1 = {
        name                = "/Common/grv_pool_ldap_secure"
        load_balancing_mode = "round-robin"
        monitors            = ["/Common/icmp"]
        nodes               = ["1.1.1.1:8080"]
      }
   }
}

variable ltm_vservers {
  type = map
  default = {
      example_1 = {
        name                = "/Common/grv_pool_ldap_secure"
        load_balancing_mode = "round-robin"
        monitors            = ["/Common/icmp"]
        nodes               = ["1.1.1.1:8080"]
      }
   }
}