main.tf

provider "aws" {

    access_key = "${var.aws_access_key}"

    secret_key = "${var.aws_secret_key}"

    region = "${var.aws_region}"

}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "eu-central-1b"
  ami               = "ami-0f5dbc86dd9cbf7a8"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y install haproxy.x86_64
              sudo yum -y install ansible.x86_64
              sudo yum -y install docker.x86_64
              EOF
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
}

