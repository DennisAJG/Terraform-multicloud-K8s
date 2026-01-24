variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name_prefix" {
  description = "Prefixo do nome do storage account (será adicionado sufixo aleatório)."
  type        = string
  default     = "tfstate"
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

variable "tags" {
  type    = map(string)
  default = {}
}
