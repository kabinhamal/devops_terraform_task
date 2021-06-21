

resource "aws_subnet" "terraform-private_subnet" {
  vpc_id     = "${aws_vpc.terraform-vpc1.id}"
  cidr_block = "172.16.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "terraform-private-subnet"
  }
}
