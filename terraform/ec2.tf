provider "aws" {
     region = "us-east-1"
}

data "aws_ami" "packerDemo" {
     most_recent = true

     filter {
        name   = "name"
        values = ["PackerDemo*"]

 }
     filter {
       name   = "virtualization-type"
       values = ["hvm"]
 }
     owners = ["207563224361"]
 }

resource "aws_instance" "packerDemo" {
     ami = data.aws_ami.packerDemo.id
     instance_type = "t2.micro"
     availability_zone = var.availability_zone

lifecycle {
     ignore_changes = [ami]
     }
 }
