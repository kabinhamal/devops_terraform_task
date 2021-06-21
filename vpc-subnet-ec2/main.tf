provider "aws" {

  region     = "us-east-2"
  access_key = "AKIA274JALVXQYJ7EZUU"
  secret_key = "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"

}


module "firstvpc"{
	source = "./vpc"
	vpc_cidr = "20.0.0.0/16"
	name = "HelloVpc"
}

module "myec2565" {
  source = "./ec-2"
  name = "HELL0ec2"
}