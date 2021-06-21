resource "aws_instance" "ec2"{
instance_type = var.instancetype
key_name = "kabin"
ami = "ami-00399ec92321828f5"
availability_zone = "us-east-2a"
tags = {
 name = "HELL0123"
}
}