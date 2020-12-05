variable "resource_group_name" {}
variable "resource_group_location" {}
variable "ss_name" {}
variable "admin_username" {}
variable "instances" {}
variable "sku" {}
variable "address_prefixes" {
  type = list
}
variable "subnet_name" {}
variable "address_space" {}
variable "vpc_name" {}

publisher = var.publisher
offer     = var.offer
sku       = var.os_sku
version   = var.version

variable "publisher" {}
variable "offer" {}
variable "os_sku" {}
variable "os_version" {}