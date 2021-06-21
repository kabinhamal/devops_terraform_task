resource "aws_instance" "web" {
  count = var.instance_count
  instance_type = "t2.micro"
  ami           = "ami-00399ec92321828f5"
  iam_instance_profile = "${aws_iam_instance_profile.ec2-profile.name}"

  tags = {
    Name = "Helloec2-${count.index+1}"
  }
  

}
variable "instance_count"{
default = "1"
}