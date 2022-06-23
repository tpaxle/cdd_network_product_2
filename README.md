<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_bigip"></a> [bigip](#requirement\_bigip) | 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_bigip"></a> [bigip](#provider\_bigip) | 1.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pools"></a> [pools](#module\_pools) | ./modules/ltm_pool | n/a |
| <a name="module_vservers"></a> [vservers](#module\_vservers) | ./modules/ltm_virtual_server | n/a |

## Resources

| Name | Type |
|------|------|
| [bigip_command.disable_dhcp](https://registry.terraform.io/providers/F5Networks/bigip/1.14.0/docs/resources/command) | resource |
| [bigip_ltm_monitor.monitors](https://registry.terraform.io/providers/F5Networks/bigip/1.14.0/docs/resources/ltm_monitor) | resource |
| [bigip_ltm_node.node](https://registry.terraform.io/providers/F5Networks/bigip/1.14.0/docs/resources/ltm_node) | resource |
| [bigip_sys_dns.dns1](https://registry.terraform.io/providers/F5Networks/bigip/1.14.0/docs/resources/sys_dns) | resource |
| [bigip_sys_ntp.ntp1](https://registry.terraform.io/providers/F5Networks/bigip/1.14.0/docs/resources/sys_ntp) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_search"></a> [dns\_search](#input\_dns\_search) | Dns domains search list | `list(any)` | `[]` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Dns server IP's list | `list(any)` | `[]` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | n/a | `any` | n/a | yes |
| <a name="input_ltm_monitors"></a> [ltm\_monitors](#input\_ltm\_monitors) | n/a | `map(any)` | <pre>{<br>  "example_1": {<br>    "destination": "*:8021",<br>    "interval": 5,<br>    "name": "/Common/tcp_example_8021",<br>    "parent": "/Common/tcp",<br>    "time_until_up": 0<br>  }<br>}</pre> | no |
| <a name="input_ltm_nodes"></a> [ltm\_nodes](#input\_ltm\_nodes) | n/a | `map(any)` | <pre>{<br>  "example_1": {<br>    "description": "Gravity server",<br>    "ip": "1.1.1.1",<br>    "name": "/Common/cccp1ew1imggloballserver01"<br>  }<br>}</pre> | no |
| <a name="input_ltm_pools"></a> [ltm\_pools](#input\_ltm\_pools) | n/a | `map(any)` | <pre>{<br>  "example_1": {<br>    "load_balancing_mode": "round-robin",<br>    "monitors": [<br>      "/Common/icmp"<br>    ],<br>    "name": "/Common/grv_pool_ldap_secure",<br>    "nodes": [<br>      "1.1.1.1:8080"<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_ltm_vservers"></a> [ltm\_vservers](#input\_ltm\_vservers) | n/a | `map(any)` | <pre>{<br>  "example_1": {<br>    "load_balancing_mode": "round-robin",<br>    "monitors": [<br>      "/Common/icmp"<br>    ],<br>    "name": "/Common/grv_pool_ldap_secure",<br>    "nodes": [<br>      "1.1.1.1:8080"<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | NTP Servers list | `list(any)` | `[]` | no |
| <a name="input_ntp_timezone"></a> [ntp\_timezone](#input\_ntp\_timezone) | NTP Servers list | `string` | `"Europe/Madrid"` | no |
| <a name="input_port"></a> [port](#input\_port) | n/a | `any` | n/a | yes |
| <a name="input_snmp_allowedaddress"></a> [snmp\_allowedaddress](#input\_snmp\_allowedaddress) | asalksjdfasdf | `list(any)` | n/a | yes |
| <a name="input_snmp_contact"></a> [snmp\_contact](#input\_snmp\_contact) | asalksjdfasdf | `string` | `"ami@gruposantander.com"` | no |
| <a name="input_snmp_location"></a> [snmp\_location](#input\_snmp\_location) | asalksjdfasdf | `string` | `"cloud"` | no |
| <a name="input_sync_config"></a> [sync\_config](#input\_sync\_config) | n/a | `bool` | `false` | no |
| <a name="input_username"></a> [username](#input\_username) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->