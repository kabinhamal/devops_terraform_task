provider "aws" {

  region     = "us-east-2"
  access_key = ""
  secret_key = "/1"

}






terraform {
	backend "s3" {
	    access_key = "A"
            secret_key = "q3uYg0sZV"
	    bucket = "my-tf-test-bucket121122288"
	    key = "global/s3/terraform.tfstate"
	    region = "us-east-2"
            
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

    
      }
    
 


    
