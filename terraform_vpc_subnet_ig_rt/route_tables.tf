
resource "aws_route_table" "RTprivate" {
	vpc_id = "${aws_vpc.terraform-vpc1.id}"
	
route {
	cidr_block = "0.0.0.0/0"
	gateway_id = aws_nat_gateway.NATgw.id
     }
 
 tags = {
 	name = "ter private route table"
	}
}



resource "aws_route_table_association" "private" {
	subnet_id = aws_subnet.terraform-private_subnet.id
	route_table_id = aws_route_table.RTprivate.id
}


