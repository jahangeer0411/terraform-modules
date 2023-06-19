provider "aws" {
 
}
module "myprodmodule" {
    source       = "../modules/vpc_modules"
    vpc_cidr     = var.prodcidr
    region       = var.region
    project_name = var.project_name
}