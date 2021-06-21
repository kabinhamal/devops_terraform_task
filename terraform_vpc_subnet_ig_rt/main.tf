terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket1211222"
    key    = "Dev/terraform.tfstate"
    region = "us-east-2"
  }
}



resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-tf-test-bucket121122288"
  lifecycle {
       prevent_destroy = true
	}
   versioning {
	enabled = true
	}

    server_side_encryption_configuration {
	rule {
	   apply_server_side_encryption_by_default {
	      sse_algorithm = "AES256"

	}
      }
    }
}
 

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    
    attribute {
       name = "LockIDcl"
       type = "S"
 }
}
    

terraform {
	backend "s3"
	    bucket = "my-tf-test-bucket1211222"
	    key = "global/s3/terraform.tfstate"
	    region = "us-east-2"
            dynamodb_table = "terraform-state-locking"
            encrypt = true
