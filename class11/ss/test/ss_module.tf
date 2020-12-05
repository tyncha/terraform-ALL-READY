module "ss" {
    source = "../"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    ss_name                 = var.ss_name
    admin_username          = var.admin_username
    instances               = var.instances
    sku                     = var.sku
    subnet_name             = var.subnet_name
    address_space           = var.address_space
    vpc_name                = var.vpc_name 
}
