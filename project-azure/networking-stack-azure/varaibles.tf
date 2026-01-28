variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "tags" {
  type = map(string)
  default = {
    project     = "foodzip"
    environment = "development"
  }
}

variable "network" {
  type = object({
    resource_group_name = string
    vnet_name           = string
    address_space       = list(string)

    nat_gateway_name    = string
    public_ip_name      = string

    public_route_table_name  = string
    private_route_table_name = string

    public_subnets = list(object({
      name           = string
      address_prefix = string
    }))

    private_subnets = list(object({
      name           = string
      address_prefix = string
    }))
  })
}
