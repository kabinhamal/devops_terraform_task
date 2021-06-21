


resource "aws_iam_role_policy" "ec2-policy" {
	name = "ec2-policy"
	role = "${aws_iam_role.test_role.id}"
	
        policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "test_role" {
	name = "test_role"

	assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2-profile" {
	name = "test_ec2-profile"
	role = "${aws_iam_role.test_role.name}"
}



