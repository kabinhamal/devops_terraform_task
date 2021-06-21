provider "aws" {

  region     = "us-east-2"
  access_key = "AKIA274JALVXQYJ7EZUU"
  secret_key = "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"

}






terraform {
	backend "s3" {
	    access_key = "AKIA274JALVXQYJ7EZUU"
            secret_key = "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"
	    bucket = "my-tf-test-bucket121122288"
	    key = "global/s3/terraform.tfstate"
	    region = "us-east-2"
            dynamodb_table = "terraform-state-locking"
            encrypt = true
	}
}



resource "aws_s3_bucket" "terraform_bucket" {
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
       name = "LockID"
       type = "S"
 }
}
    
