terraform {

  backend "s3" {
    bucket         	   = "terraform-state-file-remote-07052024-seetha"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "terraform-state-file-db"
  }
}