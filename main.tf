main.tf

provider "aws" {

    access_key = "${var.aws_access_key}"

    secret_key = "${var.aws_secret_key}"

    region = "${var.aws_region}"

}

 

resource "aws_instance" "hello_world" {

    ami = "ami-e3fdd999"  # CentOS Linux 6 for us-east-1

    instance_type = "t2.micro"

    vpc_security_group_ids = ["${aws_security_group.web.id}"]

    key_name = "${aws_key_pair.hello_world.id}"

}

 

resource "aws_security_group" "web" {

    name = "web"

    description = "Allow HTTP and SSH connections."

 

    ingress {

        from_port = 22

        to_port = 22

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }

 

    ingress {

        from_port = 80

        to_port = 80

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }
    

    ingress {

        from_port = 8080

        to_port = 8080

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }

 

    egress {

        from_port = 0

        to_port = 0

        protocol = "-1"

        cidr_blocks = ["0.0.0.0/0"]

    }

}

 

resource "aws_key_pair" "hello_world" {

    key_name = "hello_world"

    public_key = "${file(var.public_key_path)}"

}

 

 

variables.tf

# These variables come from the terraform.tfvars file

variable "aws_access_key" {}

variable "aws_secret_key" {}

 

variable "aws_region" {

    description = "AWS region in which to launch the servers."

    default = "us-east-1"

}

 

variable "public_key_path" {

    default = "~/.ssh/id_rsa.pub"

}
