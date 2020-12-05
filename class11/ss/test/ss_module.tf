module "ss" {
    source = "../"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    ss_name                 = var.ss_name
}