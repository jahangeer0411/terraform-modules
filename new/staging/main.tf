provider "aws" {
  region = "us-east-1"
  
}
module "mystaggingmodule" {
    source = "../modules/vpc_modules"
    vpc_cidr = var.stgcidr
}