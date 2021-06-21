resource "aws_vpc" "myvpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform_vpc"
  }
}


resource "aws_subnet" "websubnet" {
  count     =  "${var.ec2_count}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "terraform-pub-subnet"
  }
}

resource "aws_instance" "webserver"{
	ami = "{var.ami_id}"
	instance_type = "{var.instance_type}"
	subnet_id = "{var.subnet_id}"

	tags ={
		Name = "hayyyyy"
	}
}


output "vpc_id" {
	value = "${aws_vpc.myvpc.id}"
}

output "subnet_id" {
	value = "${aws_subnet.websubnet.id}"
}




