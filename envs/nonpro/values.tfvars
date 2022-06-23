
hostname = "192.168.1.204"
username = "admin"
port = 8443


###############################################################################
##### System
dns_servers   =   ["8.8.8.8"]
dns_search    =   ["lab.corp"]

ntp_servers   =   ["es.pool.ntp.org"]
ntp_timezone  =   "Europe/Madrid"

#####
snmp_contact  = "pablo.zamorano@gruposantander.com"
snmp_location = "AzuWS"
snmp_allowedaddress = [
  "10.1.1.1",
  "10.1.1.2"
]

## PROES
ltm_monitors = {
  grv_hc_http_web = {
    name   = "/Common/grv_hc_http_web"
    parent = "/Common/http"

    destination = "*.*"

    adaptive       = "disabled"
    adaptive_limit = 200
    send           = "GET /"
    receive        = "200 OK"
    interval       = 2
    timeout        = 6
    time_until_up  = 0
  },  
}


ltm_nodes = {
  node101 = {
    name   = "/Common/node101"
    ip     = "192.168.17.6"
    description = "AzuWS101"
  }
  node201 = {
    name   = "/Common/node201"
    ip     = "192.168.17.26"
    description = "AzuWS201"
  }
}


##############################################################################
##############################################################################
############# POOLS
ltm_pools = {
grv_pool_web_nonpro = {
    name                = "/Common/grv_pool_web_nonpro"
    load_balancing_mode = "round-robin"
    monitors            = ["/Common/grv_hc_http_esmac"]
    nodes           =     [
                            "/Common/node101",
                            "/Common/node201"
                          ]
    ports           =     [
                            "80",
                            "80"
                          ]
  }
}  
##############################################################################
##############################################################################
############# VSERVERS

ltm_vservers = {
  grv_vs_webserver1 = {
    name                = "/Common/grv_vs_webserver1"
    destination         = "192.168.10.11"
    ports               = "80"
    pool                = "/Common/grv_pool_web_nonpro"
    source_address_translation = "automap"
    translate_address          = "enabled"
    translate_port             = "enabled"
    profiles              = ["/Common/tcp"]
    description               = "Batch Esmac VS"
  }    
}