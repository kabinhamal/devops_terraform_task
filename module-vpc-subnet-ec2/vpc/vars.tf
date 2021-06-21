variable "vpc_id"{
	
	description = "VPC ID"
	}


variable "vpc_cidr"{
	default = "10.0.0.0/16"
}

variable "subnet_id"{
	
	description = "SUBNET ID"	
	}

variable "subnet_cidr"{
	default = "10.0.1.0/24"

	description = "subnet_cidr block"
}


variable "ec2-count" {
	default = "1"
	}

variable "ami_id" {}

variable "instance_type"{ 
	default = "t2.micro"
}
