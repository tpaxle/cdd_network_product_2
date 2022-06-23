###############################################################################
##### NAMING CONVENTION CONFIGURATION IMPORT ##################################
###############################################################################

resource "bigip_ltm_pool" "pool" {

  name                   = var.poolb["name"]
  load_balancing_mode    = lookup(var.poolb, "load_balancing_mode", "round-robin")
  monitors               = lookup(var.poolb, "monitors", ["/Common/tcp"])

}

resource "bigip_ltm_pool_attachment" "attach_node" {
  count = length(var.poolb["nodes"])
    pool = bigip_ltm_pool.pool.name
    node = "${var.poolb["nodes"][count.index]}:${var.poolb["ports"][count.index]}"
}