terraform {
  backend "s3" {
    bucket = "tf-s3-backend"
    region = "us-east-1"
    key    = "terraform.tfstate"
    dynamodb_table = "tf-lock-table"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "########################"
  secret_key = "########################################"

}

resource "aws_instance" "tf-ec2-1" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "${var.instanceType}"

  key_name = "vmkey"

  tags ={
    Name="${var.instanceName}"
  }
}

