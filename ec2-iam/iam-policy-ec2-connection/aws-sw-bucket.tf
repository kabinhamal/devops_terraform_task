provider "aws" {

  region     = "us-east-2"
  access_key = ""
  secret_key = ""

}






terraform {
	backend "s3" {
	    access_key = ""
            secret_key = "g0sZV"
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
    
 


    
