


resource "aws_iam_role_policy" "ec2-policy" {
	name = "ec2-policy"
	role = "${aws_iam_role.test_role.id}"
	
	policy = "${file("ec2-policy.json")}"
}

resource "aws_iam_role" "test_role" {
	name = "test_role"

	assume_role_policy = "${file("ec2-assume-policy.json")}"
}



resource "aws_iam_instance_profile" "ec2-profile" {
	name = "test_ec2-profile"
	role = "${aws_iam_role.test_role.name}"
}



