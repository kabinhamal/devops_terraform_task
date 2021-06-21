provider "aws" {

  region     = "us-east-2"
  access_key = "AKIA274JALVXQYJ7EZUU"
  secret_key = "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"

}


module "vpc1" {
  source        = "./vpc"
  vpc_id        = module.vpc1.vpc.id
  vpc_cidr      = "192.168.0.0/16"
  subnet_id     = module.vpc1.subnet_id
  subnet_cidr   = "172.16.1.0/24"
  ec2-count     = 1
  ami_id        = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
}





