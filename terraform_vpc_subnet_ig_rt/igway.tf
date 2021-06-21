

resource "aws_internet_gateway" "tergateway" {
  vpc_id = "${aws_vpc.terraform-vpc1.id}"
   
}


resource "aws_eip" "nateIP" {
   vpc   = true
   depends_on = [aws_internet_gateway.tergateway]
 }

 resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.terraform-pub_subnet.id

   tags = {
      name = " ter-nat-gateway"
     }
}





